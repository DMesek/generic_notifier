# Generic notifier

Generic notifier which every notifier should extend to avoid writing repetitive code and to access
global loading, error handling and route navigation.

Uses **[Riverpod package](https://pub.dev/packages/riverpod)**.

## Usage

### BaseWidget

The entire app is wrapped in **BaseWidget** which listens to  **globalFailureListener**,
**globalNavigationProvider** & **globalFailureProvider**.

```dart

class BaseWidget extends ConsumerWidget {
   final Widget child;

   const BaseWidget({
      Key? key,
      required this.child,
   }) : super(key: key);

   @override
   Widget build(BuildContext context, WidgetRef ref) {
      ref.globalFailureListener(context);
      ref.globalNavigationListener(ref.read(baseRouterProvider));
      final showLoading = ref.watch(globalLoadingProvider);
      return Stack(
         children: [
            Scaffold(
               body: child,
               floatingActionButton: FloatingActionButton(
                  onPressed: () =>
                          ref.read(exampleNotifierProvider.notifier).getSomeString(),
               ),
            ),
            if (showLoading) const BaseLoadingIndicator(),
         ],
      );
   }
}
```

### BaseState<State, OtherStates>

BaseState has 5 primary states:
1. **Initial**

2. **Loading**

3. **Data** - ex. Used for showing successful API call response

4. **Other** - Used if you want to have more then 5 primary states

5. **Error**

```dart

@freezed
class BaseState<State, OtherStates> with _$BaseState<State, OtherStates> {
  const factory BaseState.initial() = _Initial;

  const factory BaseState.loading() = _Loading;

  const factory BaseState.data(State data) = _Data;

  const factory BaseState.other(OtherStates otherStates) = _Other;

  const factory BaseState.error(Failure failure) = _Error;
}
```

### BaseStateNotifier
Abstract StateNotifier class which provides some convenient methods to be used by subclassing it.
Among execute method which will be explained separately, it provides **showGlobalLoading**, 
**clearGlobalLoading** for handling global loading, **setGlobalFailure** for handling global failure
and **pushNamed**, **pushReplacementNamed** and **pop** methods to easily access navigation access
from state notifier subclasses.
### Execute method
The main **BaseStateNotifier** method which supports different options for handling the data, 
failures and loading.
```dart
  @protected
  Future execute(
    EitherFailureOr<DataState> function, {
    PreHandleData<DataState>? onDataReceived,
    PreHandleFailure? onFailureOccurred,
    bool withLoadingState = true,
    bool globalLoading = false,
    bool globalFailure = true,
  }) async {
    _setLoading(withLoadingState, globalLoading);
    final result = await function;
    result.fold(
      (failure) => _onFailure(
        failure.copyWith(uniqueKey: UniqueKey()),
        onFailureOccurred,
        withLoadingState,
        globalFailure,
      ),
      (data) => _onData(data, onDataReceived, withLoadingState),
    );
  }
```
**function** parameter receives method to execute with return value EitherFailureOr<DataState>. 
**withLoadingState** bool parameter says while calling and waiting **function** to finish, loading state 
should be set. Similarly, **globalLoading** bool parameter says while calling and waiting **function** 
to finish, loading over the the whole app should be shown.
**globalFailure** bool parameter says if **function** returns Failure, should it be shown globally 
over the whole app or not.
&nbsp;

To filter and control which data will update the state, **onDataReceived** callback can be passed. 
Alternatively, if callback always return false, custom data handling can be implemented.
&nbsp;

To filter and control which failure will update the state or be shown globally, **onFailureOccurred** 
callback can be passed. Similar to **onDataReceived** if always returned false, custom failure 
handling can be implemented.

## _onData method
Private method being called by **execute** method when **function** returns data. It will call
**onDataReceived** callback and based on the result call _unsetLoading method and update the state 
with the data.
```dart
  void _onData(
    DataState data,
    PreHandleData<DataState>? onDataReceived,
    bool withLoadingState,
  ) {
    final shouldUpdateState = onDataReceived?.call(data) ?? true;
    _unsetLoading(shouldUpdateState ? false : withLoadingState);
    if (shouldUpdateState) {
      state = BaseState.data(data);
    }
  }
```

## _onFailure method
Private method being called by **execute** method when **function** returns Failure. It will call
**onFailureOccurred** callback and based on the result call **_unsetLoading** method or not and
show the failure globally or update the state with it.
```dart
  void _onFailure(
    Failure failure,
    PreHandleFailure? onFailureOccurred,
    bool withLoadingState,
    bool globalFailure,
  ) {
    final shouldProceedWithFailure = onFailureOccurred?.call(failure) ?? true;
    if (!shouldProceedWithFailure || globalFailure) {
      _unsetLoading(withLoadingState);
    }
    if (shouldProceedWithFailure) {
      globalFailure ? setGlobalFailure(failure) : state = BaseState.error(failure);
    }
  }
```

### Loading

**globalLoadingProvider** can be used to show the loading indicator without updating
**BaseStateNotifier** state.

```dart

final globalLoadingProvider = StateProvider<bool>((_) => false);
```

### Loading example

**BaseLoadingIndicator** can be shown by setting **globalLoading** inside of execute method to
**true**

```dart
//...
Future getSomeString() =>
        execute(
           _exampleRepository.getSomeString(),
           globalLoading: true,
        );
//...
```

You can also change **BaseNotifier** state to BaseState.loading by setting
**withLoadingState** to **true**

```dart
//...
Future getSomeString() =>
        execute(
           _exampleRepository.getSomeString(),
           globalLoading: true,
           withLoadingState: true,
        );
//...
```

### Global failures

**globalFailureProvider** can be used to show the failure that happened in the application without
updating **BaseStateNotifier** state.

```dart

final globalFailureProvider = StateProvider<Failure?>((_) => null);
```

### How it works

```dart
void globalFailureListener(BuildContext _) {
   listen<Failure?>(globalFailureProvider, (_, failure) {
      if (failure == null) return;
      //Show global error
      log('''showing ${failure.isCritical ? '' : 'non-'}critical failure with title ${failure.title},
          error: ${failure.error},
          stackTrace: ${failure.stackTrace}
      ''');
   });
}
```

### Failure example

**globalFailureProvider** listener will be triggered by setting **globalFailure** inside of execute
method to **true** when failure happens. If set to false, instead of updating globalFailureProvider,
**BaseStateNotifier** state will be set to error so the failure can be shown directly on the screen,
not in the overlay as a toast or a dialog.

```dart
//...
Future getSomeString() =>
        execute(
           _exampleRepository.getSomeString(),
           globalFailure: false,
        );
//...
```

### Navigation

**globalNavigationProvider** with **RouteAction** type can be used to execute push, pop and similar
navigation actions. Navigation can be used directly by updating **globalNavigationProvider** or by
using descendant of **BaseStateNotifier** which initially provides **pushNamed**,
**pushReplacementNamed** and **pop** methods.
**BaseWidget** registers listener for **globalNavigationProvider** and therefore any change
triggers **execute** method of **RouteAction** object.

### How it works

```dart
void globalNavigationListener(BaseRouter baseRouter) {
   listen<RouteAction?>(
      globalNavigationProvider,
              (_, state) => state?.execute(baseRouter),
   );
}
```

To navigate from current to the next page it can be done like this:

```
ref.read(currentPageNotifierProvider.notifier).pushNamed(nextPageRouteName);
```

or to pop back to previous page:

```
ref.read(currentPageNotifierProvider.notifier).pop();
```

Navigator can be used even directly by accessing **globalNavigationProvider** but it is more convenient
to navigate through descendant of BaseStateNotifier like shown above and that way you don't have to
instantiate by yourself RouteAction descendant classes.

If more navigation actions are necessary, RouteAction can be subclassed with desired action and new
method can be added into BaseStateNotifier that will use that class. Also, BaseRouter can be
expanded with new navigation method and then implemented in the descendant class which will be used
in RouteAction descendant class.

Default navigation package being used is **Beamer** and in **baseRouterProvider** its BaseRouter
subclass BeamerRouter is being instantiated.

If necessary, by making few changes navigation package can be easily switched to **AutoRoute**,
**GoRouter** or probably any other navigation package but here short notes will be provided for
only two mentioned alternatives to Beamer.

&nbsp;

### Changes needed for AutoRoute package:

1. add auto_route dependency to pubspec.yaml
2. create app_router.dart file, define AppRouter class with options defined in its documentation
3. (including generating .gr.dart file by running **flutter packages pub run build_runner build**
   in terminal)
4. create **AppRouterRouter** class in **base_router.dart** and override BaseRouter's navigation
   methods, it can look something like this:

  ```
  class AppRouterRouter extends BaseRouter {
    AppRouterRouter({required super.routerDelegate, required super.routeInformationParser, super.router});

    @override
    void pushNamed(String routeName) {
      (router as AppRouter).pushNamed(routeName);
    }
  
    ...
  }
  ```

5. update **baseRouterProvider** in **base_router_provider.dart** to use **AppRouterRouter**
   class instead of **BeamerRouter**
6. remove **BeamerProvider** widget from **main.dart**

&nbsp;

### Changes needed for go_router package:

1. add go_router dependency to pubspec.yaml

2. create **GoRouterRouter** class in **base_router.dart** and override BaseRouter's navigation
   methods, it can look something like this:
      ```
      class GoRouterRouter extends BaseRouter {
        GoRouterRouter({
          required super.routerDelegate,
          required super.routeInformationParser,
          super.routeInformationProvider,
          super.router,
        });
      
        @override
        void pushNamed(String routeName) {
          (router as GoRouter).push(routeName);
        }
      
        ...
      }
      ```
3. update **baseRouterProvider** in **base_router_provider.dart** to use **GoRouterRouter** class
   instead of **BeamerRouter**

  ```
  final baseRouterProvider = StateProvider<BaseRouter>((ref) {
    final goRouter = GoRouter(
      routes: <GoRoute>[
        ...
      ],
    );
    return GoRouterRouter(
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      router: goRouter,
    );
  });
  ```

4. remove **BeamerProvider** widget from **main.dart**

&nbsp;

