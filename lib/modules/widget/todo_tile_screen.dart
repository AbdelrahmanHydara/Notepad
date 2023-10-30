import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notepad/shared/constants/constants.dart';

class TodoTileScreen extends StatelessWidget
{
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTileScreen({super.key,required this.taskName,required this.taskCompleted,
    required this.onChanged,required this.deleteFunction});

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      child: Slidable(
         endActionPane: ActionPane(
             motion: const StretchMotion(),
             children:
             [
               SlidableAction(
                 onPressed: deleteFunction,
                 icon: Icons.delete,
                 backgroundColor: Colors.purple,
                 borderRadius: BorderRadius.circular(12),
               ),
             ],
         ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children:
            [
              Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                checkColor: primaryColor,
                activeColor: primaryColor2,
                fillColor: const MaterialStatePropertyAll(primaryColor2),
              ),
              Expanded(
                child: Text(
                  taskName,
                  style: TextStyle(
                    color: defaultTextColor,
                    fontSize: 20,
                    decoration:
                    taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
