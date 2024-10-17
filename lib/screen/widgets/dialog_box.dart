import 'package:flutter/material.dart';
import 'package:todo_list_app/screen/widgets/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
    DialogBox({super.key, this.controller,required this.onSave, required this.onCancel});

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a New Task'
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Save Button
                MyButton(text: 'Save', onPressed: onSave),
                SizedBox(width: 6),

                //Cancel Button
                MyButton(text: 'Cancel', onPressed: onCancel),

              ],
            )
          ],
        ),
      ),
    );
  }
}