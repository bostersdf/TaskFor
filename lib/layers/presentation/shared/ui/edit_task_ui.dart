import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taskfor/layers/presentation/screens/task_screen.dart';

Future<Task?> showEditTaskDialog(BuildContext context, Task task) async {
  String title = task.title;
  String desc = task.description;
  DateTime? dateTime = task.dateTime;

  return await showDialog<Task>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(context.tr('Edit task')),
        content: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: context.tr('Name')),
                controller: TextEditingController(text: title),
                onChanged: (val) => title = val,
              ),
              TextField(
                decoration: InputDecoration(labelText: context.tr('Description')),
                controller: TextEditingController(text: desc),
                onChanged: (val) => desc = val,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                child: Text(context.tr('Sdat')),
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: dateTime ?? DateTime.now(),
                    firstDate: DateTime(2025),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime:
                          TimeOfDay.fromDateTime(dateTime ?? DateTime.now()),
                    );
                    if (time != null) {
                      dateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                       setState(() {});
                    }
                  }
                },
              ),
              if (dateTime != null)
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text(context.tr('Date/time selected: ${dateTime.toString()}')),
                    ),
            ],
          );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(null), 
            child: Text(context.tr('Cancel'))),
          ElevatedButton(
            onPressed: () {
              if (title.isNotEmpty && desc.isNotEmpty) {
                Navigator.of(context).pop(Task(title: title, description: desc, dateTime: dateTime));
              }
            },
            child: Text(context.tr('Save')),
          ),
        ],
      );
    },
  );
}