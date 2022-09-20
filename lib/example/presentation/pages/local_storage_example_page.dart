// ignore_for_file: always_use_package_imports

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/example/presentation/pages/example_page.dart';
import 'package:reusability/features/local_storage/data/repositories/local_storage_repository.dart';

class LocalStorageExamplePage extends ConsumerStatefulWidget {
  static const routeName = '${ExamplePage3.routeName}/local_storage';

  const LocalStorageExamplePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LocalStorageExamplePageState();
}

class _LocalStorageExamplePageState
    extends ConsumerState<LocalStorageExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => ref
                  .read(localStorageProvider)
                  .storeToken('Token 1')
                  .then((value) {
                setState(() {});
              }),
              child: const Text('Store token'),
            ),
            FutureBuilder<String?>(
              future: ref.read(localStorageProvider).token,
              builder: (context, snapshot) {
                final data = snapshot.data;
                if (data != null) {
                  return Column(
                    children: [
                      Text(data),
                      TextButton(
                        onPressed: () => ref
                            .read(localStorageProvider)
                            .deleteToken()
                            .then((value) {
                          setState(() {});
                        }),
                        child: const Text('Delete token'),
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
            TextButton(
              onPressed: () => ref
                  .read(localStorageProvider)
                  .storePassword('Password 1')
                  .then((value) {
                setState(() {});
              }),
              child: const Text('Store password'),
            ),
            FutureBuilder<String?>(
              future: ref.read(localStorageProvider).password,
              builder: (context, snapshot) {
                final data = snapshot.data;
                if (data != null) {
                  return Column(
                    children: [
                      Text(data),
                      TextButton(
                        onPressed: () => ref
                            .read(localStorageProvider)
                            .deletePassword()
                            .then((value) {
                          setState(() {});
                        }),
                        child: const Text('Delete password'),
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
