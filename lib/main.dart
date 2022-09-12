import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/example_page.dart';

void main() {
  runApp(const MyApp());
}

const secondRoute = "/second";
const thirdRoute = "/third";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (context) => const ExamplePage(),
          secondRoute: (context) => const SecondScreen(),
          thirdRoute: (context) => const Screen3(),
        },
      ),
    );
  }
}
