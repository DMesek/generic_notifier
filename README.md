# Generic notifier

Generic notifier which every notifier should extend to avoid writing repetitive code and to access
global loading, error handling and route navigation.

Uses **[Riverpod package](https://pub.dev/packages/riverpod)**.

## Table of contents
- [Real life example](#real-life-example)
- [BaseState<State, OtherStates>](#basestatestate-otherstates)
- [BaseStateNotifier](#basestatenotifier)
- [Global loading](#global-loading)
- [Global failure](#global-failure)
- [Navigation](#navigation)
- [BaseWidget](#basewidget)
- [Changes to switch to AutoRoute package](#changes-to-switch-to-autoroute-package)
- [Changes to switch to GoRouter package](#changes-to-switch-to-go_router-package)

## Real life example

In this example **State** is **String** and **OtherState** is **OtherStateExample**.

### ExampleStateNotifier
 ```dart


final exampleNotifierProvider = StateNotifierProvider<ExampleStateNotifier,
    BaseState<String, OtherStateExample>>(
      (ref) => ExampleStateNotifier(SentenceRepository(), ref.read),
);

class ExampleStateNotifier
    extends BaseStateNotifier<String, OtherStateExample> {
  final ExampleRepository _exampleRepository;

  ExampleStateNotifier(this._exampleRepository, Reader reader) : super(reader);

  Future getSomeStringFullExample() => execute(
    //Function that is called. Needs to have the same success return type as State
    _exampleRepository.getSomeString(),

    //Set to true if you want to handle error globally (ex. Show error dialog above the entire app)
    globalFailure: true,

    //Set to true if you want to show BaseLoadingIndicator above the entire app
    globalLoading: false,

    //Set to true if you want to update state to BaseState.loading()
    withLoadingState: true,

    //Do some actions with data
    //If you return true, base state will be updated to BaseState.data(data)
    //If you return false, state will not be updated
    onDataReceived: (data) {
      // Custom handle data
      return true;
    },

    //Do some actions with failure
    //If you return true, base state will be updated to BaseState.error(failure)
    //If you return false, state will not be updated
    onFailureOccurred: (failure) {
      // Custom handle data
      return true;
    },
  );

  //Example of the API request with global loading indicator
  Future getSomeStringGlobalLoading() => execute(
    _exampleRepository.getSomeString(),
    globalLoading: true,
    withLoadingState: false,
  );

  //Example on how to use additional states
  Future<void> getSomeStringWithOtherState() async {
    state = const BaseState.other(OtherStateExample.fetching());
    execute(
      _exampleRepository.getSomeOtherString(),
      withLoadingState: false,
      onFailureOccurred: (error) {
        //Set custom state
        state = BaseState.other(OtherStateExample.customError(error));
        //Return false because we don't want to update BaseState to BaseState.error
        return false;
      },
      onDataReceived: (_) {
        //Set custom state
        state = const BaseState.other(OtherStateExample.empty());
        //Return false because we don't want to update BaseState to BaseState.data(_)
        return false;
      },
    );
  }
}

```

### ExamplePage

 ```dart

class ExamplePage extends ConsumerWidget {
  static const routeName = '/';

  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exampleNotifierProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              state.when(
                data: (sentence) => sentence,
                loading: () => 'Loading',
                other: (otherState) => otherState.when(
                  empty: () => 'Empty',
                  fetching: () => 'Fetching',
                  customError: (error) => 'Custom error: ${error.title}',
                ),
                initial: () => 'Initial',
                error: (failure) => failure.toString(),
              ),
            ),
            TextButton(
              onPressed: ref
                  .read(exampleNotifierProvider.notifier)
                  .getSomeStringWithOtherState,
              child: const Text('Other state example'),
            ),
            TextButton(
              onPressed: ref
                  .read(exampleNotifierProvider.notifier)
                  .getSomeStringFullExample,
              child: const Text('Get string'),
            ),
            TextButton(
              onPressed: ref
                  .read(exampleNotifierProvider.notifier)
                  .getSomeStringGlobalLoading,
              child: const Text('Global loading example'),
            ),
            //Navigation example
            TextButton(
              onPressed: () => ref.pushNamed(ExamplePage2.routeName),
              child: const Text('Navigate'),
            ),
          ],
        ),
      ),
    );
  }
}

```


## BaseState<State, OtherStates>

BaseState has 5 primary states:
1. **initial**

2. **loading**

3. **data(State)** - ex. Used for showing successful API call response

4. **other(OtherStates)** - Used if you want to have more then 5 primary states

5. **error(Failure)**

**State** has to be the same type as the return value from the function that is called

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


### OtherStates example

Define as many additional states that are needed

 ```dart
@freezed
class OtherStateExample with _$OtherStateExample {
  const factory OtherStateExample.empty() = _Empty;

  const factory OtherStateExample.fetching() = _Fetching;

  const factory OtherStateExample.customError(Failure failure) = _CustomError;
}
```

## BaseStateNotifier
Abstract StateNotifier class which provides some convenient methods to be used by subclassing it.
Among execute method which will be explained separately, it provides:

* **showGlobalLoading** & **clearGlobalLoading** for handling global loading

* **setGlobalFailure** for handling global failure

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
    });
```
* **function** parameter receives method to execute with return value EitherFailureOr<DataState>.

* **withLoadingState** bool parameter says while calling and waiting **function** to finish, loading state should be set.

*  **globalLoading** bool parameter says while calling and waiting **function**
   to finish, loading over the the whole app should be shown.

* **globalFailure** bool parameter says if **function** returns Failure, should it be shown globally
  over the whole app or not.
  &nbsp;

To filter and control which data will update the state, **onDataReceived** callback can be passed.
Alternatively, if callback always return false, custom data handling can be implemented.
&nbsp;

To filter and control which failure will update the state or be shown globally, **onFailureOccurred**
callback can be passed. Similar to **onDataReceived** if always returned false, custom failure
handling can be implemented.

## Global loading

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

## Global failure

**globalFailureProvider** can be used to show the failure that happened in the application without
updating **BaseStateNotifier** state.

```dart

final globalFailureProvider = StateProvider<Failure?>((_) => null);
```

### Global failure listener

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

## Navigation

**globalNavigationProvider** with **RouteAction** type can be used to execute push, pop and similar
navigation actions. Navigation can be used directly by updating **globalNavigationProvider** or by
using extension on WidgetRef class which initially provides **pushNamed**,
**pushReplacementNamed** and **pop** methods.
**BaseWidget** registers listener for **globalNavigationProvider** and therefore any change
triggers **execute** method of **RouteAction** object.

### Global navigation listener

```dart
void globalNavigationListener() {
  listen<RouteAction?>(
    globalNavigationProvider,
        (_, state) => state?.execute(read(baseRouterProvider)),
  );
}
```

To navigate from current to the next page it can be done like this:

```
ref.pushNamed(nextPageRouteName);
```

or to pop back to previous page:

```
ref.pop();
```

If more navigation actions are necessary, RouteAction can be subclassed with desired action and new
method can be added into BaseStateNotifier that will use that class. Also, BaseRouter can be
expanded with new navigation method and then implemented in the descendant class which will be used
in RouteAction descendant class.

Default navigation package being used is **Beamer** and in **baseRouterProvider** its BaseRouter
subclass BeamerRouter is being instantiated.

If necessary, by making few changes navigation package can be easily switched to **AutoRoute**,
**GoRouter** or probably any other navigation package but here short notes will be provided for
only two mentioned alternatives to Beamer.

## BaseWidget

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
    ref.globalNavigationListener();
    final showLoading = ref.watch(globalLoadingProvider);
    return Stack(
      children: [
        child,
        if (showLoading) const BaseLoadingIndicator(),
      ],
    );
  }
}
```

## Changes to switch to AutoRoute package

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

## Changes to switch to go_router package:

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