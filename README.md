# Generic notifier

Generic notifier which every notifier should extend to avoid writing repetitive code and to access
global loading, error handling and route navigation.

Uses **[Riverpod package](https://pub.dev/packages/riverpod)**.

## Add dependency

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
    ref.globalNavigationListener();
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

### Failure example

**globalFailureProvider** listener will be triggered by setting **globalFailure** inside of execute 
method to **true** when failure happens which can actually can be omitted being the default option. 
If set to false, instead of updating globalFailureProvider, **BaseStateNotifier** state will be 
set to error so the failure can be shown directly on the screen, not in the overlay as a toast or dialog.

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
navigation actions. Navigation can be used directly by updating **globalNavigationProvider** or
by using descendant of **BaseStateNotifier** which initially provides **pushNamed**,
**pushReplacementNamed** and **pop** methods.
**BaseWidget** registers listener for **globalNavigationProvider** and therefore any change
triggers **execute** method of **RouteAction** object.

To navigate to next page from current page it can be done like this:
```
ref.read(currentPageNotifierProvider.notifier).pushNamed(nextPageRouteName);
```
or to pop back to previous page:
```
ref.read(currentPageNotifierProvider.notifier).pop();
```
Navigator can be used even directly by access **globalNavigationProvider** but it is more 
convenient to navigate through descendant of BaseStateNotifier like shown above and 
that way you don't have to instantiate by yourself RouteAction descendant classes.

If more navigation actions are necessary, RouteAction can be subclassed with desired action and 
new method can be added into BaseStateNotifier that will use that class. Also, BaseRouter can be 
expanded with new navigation method and then implemented in the descendant class which will be used 
in RouteAction descendant class.

Default navigation package being used is **Beamer** and in **baseRouterProvider** its BaseRouter 
subclass BeamerRouter is being instantiated. 

If necessary, by making few changes navigation package can be easily switched to **AutoRoute**,
**GoRouter** or probably any other navigation package but here it will be provided short notes for
just two popular alternatives to Beamer.

* changes needed for AutoRoute package:
  * add auto_route dependency to pubspec.yaml
  * create app_router.dart file, define AppRouter class with options defined in its documentation 
  * (including generating .gr.dart file by running **flutter packages pub run build_runner build** in terminal)
  * create **AppRouterRouter** class in **base_router.dart** and override BaseRouter's navigation methods,
  it can look something like this:
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
  * update **baseRouterProvider** in **base_router_provider.dart** to use **AppRouterRouter** class 
  instead of **BeamerRouter**
  * remove **BeamerProvider** widget from **main.dart**
\
&nbsp;
* changes needed for go_router package:
  * add go_router dependency to pubspec.yaml
  * create **GoRouterRouter** class in **base_router.dart** and override BaseRouter's navigation methods,
    it can look something like this:
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
  * update **baseRouterProvider** in **base_router_provider.dart** to use **GoRouterRouter** class
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
  * remove **BeamerProvider** widget from **main.dart**

**QNetworkResponse** object:

* **Response** is a standard response object from dio package

* **APIVersionStatus** enum with values:
    * supported

    * unsupported

    * sunset

&nbsp;

### Simulate API status response demo

<img src="./assets/simulate_api_status.gif" width="30%" height="30%"/>
