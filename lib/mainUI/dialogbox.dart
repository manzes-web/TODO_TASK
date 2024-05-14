// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DialogBox extends StatefulWidget {
  // DialogBox({super.key});
  final controller;

  VoidCallback onADD;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onADD,
    required this.onCancel,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: widget.controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Task here',
                  labelText: 'TODO TASK'),
              // onChanged: (value) {
              //   setState(() {
              //     if (widget.controller == null) {
              //       isEmpty = true;
              //     } else {
              //       isEmpty = false;
              //     }
              //   });
              // },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: widget.onADD,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(100, 50)),
                  child: const Text(
                    'ADD',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: widget.onCancel,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade300,
                      minimumSize: const Size(100, 50)),
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
