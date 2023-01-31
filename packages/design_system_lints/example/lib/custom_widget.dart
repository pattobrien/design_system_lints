import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.callback,
    required this.text,
    super.key,
    required this.colorModel,
  });

  final void Function() callback;
  final String text;
  final SomeColorModel colorModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).backgroundColor,
      color: colorModel.colorized,
      // color: colorModel.color,
      child: ElevatedButton(
        onPressed: callback,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}

class SomeColorModel {
  SomeColorModel(this.color);
  final Color color;

  Color get colorized => color;
}
