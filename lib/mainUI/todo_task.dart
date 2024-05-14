import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoTask extends StatelessWidget {
  final String todotask;

  final bool iscompleted;

  Function(bool?)? onChanged;
  Function(BuildContext)? delete;
  TodoTask({
    super.key,
    required this.todotask,
    required this.iscompleted,
    required this.onChanged,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: delete,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(10),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.blue[400], borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Checkbox(
                value: iscompleted,
                onChanged: onChanged,
                shape: const CircleBorder(eccentricity: 1),
                activeColor: Colors.black,
              ),
              Text(
                todotask,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    decoration: iscompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
