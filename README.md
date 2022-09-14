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
**BaseLoadingIndicator** can be shown above entire app by simply calling **showGlobalLoading**. To
hide **BaseLoadingIndicator** simply call **clearGlobalLoading**

```dart

final globalLoadingProvider = StateProvider<bool>((_) => false);
```

**QNetworkResponse** object:

* **Response** is a standard response object from dio package

* **APIVersionStatus** enum with values:
    * supported

    * unsupported

    * sunset

&nbsp;

### Simulate API status response demo

<img src="./assets/simulate_api_status.gif" width="30%" height="30%"/>
