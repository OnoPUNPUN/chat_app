import 'package:flutter/material.dart';


class MyButtons extends StatelessWidget {
  final void Function()? onTap;
  final String buttonTitle;
  const MyButtons({super.key, required this.buttonTitle,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8)
        ),
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: Text(buttonTitle),
        ),
      ),
    );
  }
}