import 'package:flutter/material.dart';

class BaseLoadingIndicator extends StatelessWidget {
  final String? text;

  const BaseLoadingIndicator({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          if (text != null)
            Material(
              type: MaterialType.transparency,
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(text ?? ''),
              ),
            ),
        ],
      ),
    );
  }
}
