import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/main/custom_provider_observer.dart';
import 'package:reusability/presentation/common/base_scaffold.dart';
import 'package:reusability/presentation/example_page.dart';

void main() {
  runApp(MyApp());
}

const secondRoute = '/second';
const thirdRoute = '/third';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _routerDelegate = BeamerDelegate(
    initialPath: '/',
    locationBuilder: (routeInformation, _) => BeamerLocations(routeInformation),
  );

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [CustomProviderObserver()],
      child: BeamerProvider(
        routerDelegate: _routerDelegate,
        child: MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.blue),
          routeInformationParser: BeamerParser(),
          routerDelegate: _routerDelegate,
          // initialRoute: '/',
          // routes: {
          //   '/': (context) => const ExamplePage(),
          //   secondRoute: (context) => const SecondScreen(),
          //   thirdRoute: (context) => const Screen3(),
          // },
          builder: (context, child) => BaseScaffold(child: child),
        ),
      ),
    );
  }
}

class BeamerLocations extends BeamLocation<BeamState> {
  BeamerLocations(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<Pattern> get pathPatterns => [
        '/',
        secondRoute,
        thirdRoute,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('example'),
        title: 'Example',
        child: ExamplePage(),
      ),
      if (state.uri.pathSegments.contains('second'))
        const BeamPage(
          key: ValueKey('SecondScreen'),
          title: 'SecondScreen',
          child: SecondScreen(),
        ),
      if (state.uri.pathSegments.contains('third'))
        const BeamPage(
          key: ValueKey('Screen3'),
          title: 'Screen3',
          child: Screen3(),
        ),
    ];
  }
}
