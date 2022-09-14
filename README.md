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
new method can be added into BaseStateNotifier that will use that class

Default navigation package being used is **Beamer** and **RouteAction** references
**beamerDelegateProvider** which is being set immediately in builder method of **MaterialApp.router** widget.

If necessary, by with few changes navigation package can be easily switched to **AutoRoute**,
**GoRouter** or probably to any other navigation package but here it will be provided short notes for
these two also popular navigation packages.

* changes needed for AutoRoute package:
  * add auto_route dependency to pubspec.yaml
  * create app_router.dart file, define **appRouterProvider** in it and AppRouter class with options
    defined in its documentation (including generating .gr.dart file by running
    **flutter packages pub run build_runner build** in terminal)
    ```dart
    final appRouterProvider = Provider<AppRouter?>((ref) {
      return AppRouter();
    });
    ```
  * in **MyApp** build method read **appRouterProvider** and pass it in MaterialApp.router constructor like that:
    ```
    routerDelegate: appRouter?.delegate(),
    routeInformationParser: appRouter?.defaultRouteParser(),
    ```
  * in **route_action.dart** replace **beamerDelegateProvider** with **appRouterProvider** and
    update appropriate methods of AutoRouter for pushNamed, pop and pushReplacement actions
\
&nbsp;
* changes needed for go_router package:
  * add go_router dependency to pubspec.yaml
  * create go_router.dart file, define **goRouterProvider** which can be something like this:
    ```
    final goRouterProvider = StateProvider<GoRouter>((ref) {
      return GoRouter(
        routes: <GoRoute>[
          ...
        ],
      );
    });
    ```
  * in **MyApp** build method read **goRouterProvider** and pass it in MaterialApp.router constructor like that:
    ```
    routerDelegate: goRouter.routerDelegate,
    routeInformationParser: goRouter.routeInformationParser,
    routeInformationProvider: goRouter.routeInformationProvider,
    ```
  * in **route_action.dart** replace **beamerDelegateProvider** with **goRouterProvider** and
    update appropriate methods of go_router for pushNamed, pop and pushReplacement actions

**QNetworkResponse** object:

* **Response** is a standard response object from dio package

* **APIVersionStatus** enum with values:
    * supported

    * unsupported

    * sunset

&nbsp;

### Simulate API status response demo

<img src="./assets/simulate_api_status.gif" width="30%" height="30%"/>
