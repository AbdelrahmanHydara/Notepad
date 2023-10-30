import 'package:flutter/material.dart';
import 'package:notepad/shared/constants/constants.dart';

class MyButton extends StatelessWidget
{
  final String text;
  final VoidCallback onPressed;
  const MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context)
  {
    return MaterialButton(
        onPressed: onPressed,
        color: primaryColor,
        child: Text(
            text,
          style: const TextStyle(
            color: defaultTextColor,
          ),
        ),
    );
  }
}
