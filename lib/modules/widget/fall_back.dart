import 'package:flutter/material.dart';

class FallBack extends StatelessWidget
{
  const FallBack({super.key});

  @override
  Widget build(BuildContext context)
  {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          Icon(
            Icons.menu_rounded,
            size: 100,
          ),
          Text(
            'No Tasks Yet, Please Add Some Tasks.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
