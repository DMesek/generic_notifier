import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:reusability/main.dart';
import 'package:reusability/presentation/example_page.dart';

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
        key: ValueKey('examplePage'),
        title: 'Example',
        child: ExamplePage(),
      ),
      if (state.uri.pathSegments.contains('second'))
        const BeamPage(
          key: ValueKey('secondScreen'),
          title: 'SecondScreen',
          child: SecondScreen(),
        ),
      if (state.uri.pathSegments.contains('third'))
        const BeamPage(
          key: ValueKey('screen3'),
          title: 'Screen3',
          child: Screen3(),
        ),
    ];
  }
}
