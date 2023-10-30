import 'package:flutter/material.dart';
import 'package:notepad/modules/widget/my_button.dart';
import 'package:notepad/shared/constants/constants.dart';

class DialogBox extends StatelessWidget
{
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context)
  {
    return AlertDialog(
      backgroundColor: backgroundColor,
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new task',
                  fillColor: primaryColor2,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:
              [
                MyButton(
                  text: 'Save',
                  onPressed: onSave,
                ),
                const SizedBox(
                   width: 10,
                ),
                MyButton(
                  text: 'Cancel',
                  onPressed: onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
