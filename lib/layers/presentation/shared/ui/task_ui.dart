import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taskfor/layers/presentation/screens/task_screen.dart';

Future<Task?> showAddTaskDialog(BuildContext context) async {
  String title = '';
  String desc = '';
  DateTime? dateTime;

  final result = await showDialog<Task>(
    context: context,
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: Text(context.tr('Add a task')),
        content: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: context.tr('Name')),
                    onChanged: (val) => title = val,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: context.tr('Description')),
                    onChanged: (val) => desc = val,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    child: Text(context.tr('Sdat')),
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: ctx,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2025),
                        lastDate: DateTime(2100),
                      );
                      if (date != null) {
                        final time = await showTimePicker(
                          context: ctx,
                          initialTime: TimeOfDay.now(),
                        );
                        if (time != null) {
                          dateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                          setState(() {}); // Обновление UI
                        }
                      }
                    },
                  ),
                  if (dateTime != null)
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text(
                        context.tr('Date/time selected: ${dateTime.toString()}')),
                    ),
                ],
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(), 
            child: Text(context.tr('Cancel'))),
          ElevatedButton(
            onPressed: () {
              if (title.isNotEmpty && desc.isNotEmpty) {
                Navigator.of(ctx).pop(Task(title: title, description: desc, dateTime: dateTime));
              }
            },
            child: Text(context.tr('Add')),
          ),
        ],
      );
    },
  );
  return result;
}