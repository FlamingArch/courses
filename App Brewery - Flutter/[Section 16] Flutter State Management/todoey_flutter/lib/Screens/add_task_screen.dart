import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/Models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 30),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              controller: textEditingController,
            ),
            SizedBox(height: 30),
            FlatButton(
              onPressed: () {
                // print("Here, bitch.");
                Provider.of<TaskData>(context, listen: false)
                    .addTask(textEditingController.text);
                Navigator.pop(context);
              },
              color: Colors.lightBlueAccent,
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
