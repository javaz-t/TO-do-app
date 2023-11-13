import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';

class todoTile extends StatelessWidget {
  todoTile(
      {super.key,
      required this.taskName,
      required this.taskComplete,
      required this.doneORNot,
      required this.onDelete});

  final String taskName;
  final bool taskComplete;
  Function(bool?)? doneORNot;
  Function(BuildContext)? onDelete;

  @override
  Widget build(BuildContext context) { 
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [SlidableAction(
            onPressed: onDelete, 
            icon: Icons.delete, 
            borderRadius: BorderRadius.circular(15),   
            backgroundColor: Color.fromARGB(255, 192, 65, 65),
            )],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),  
          decoration: BoxDecoration(
              color: Color.fromARGB(246, 223, 184, 57), borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              Checkbox(
                value: taskComplete,
                onChanged: doneORNot,
                activeColor: Color.fromRGBO(102, 165, 194, 1),
              ),
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskComplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              )
            ],
          ),
        ),
      ),
    );
  }
}
