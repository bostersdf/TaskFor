import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskfor/layers/presentation/screens/settings-screensTWO/settings_screen.dart';
import 'package:taskfor/layers/presentation/shared/ui/edit_task_ui.dart';
import 'package:taskfor/layers/presentation/shared/ui/task_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Task {
  String title;
  String description;
  DateTime? dateTime;
  bool isFavorite;

  Task({
    required this.title,
    required this.description,
    this.dateTime,
    this.isFavorite = false,
  });
}

class ONETaskApp extends StatefulWidget {
  @override
  ONETaskAppState createState() => ONETaskAppState();
}

class ONETaskAppState extends State<ONETaskApp> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> tasksJson = tasks.map((task) => jsonEncode({
      'title': task.title,
      'description': task.description,
      'dateTime': task.dateTime?.toIso8601String(),
      'isFavorite': task.isFavorite, // Сохраняем статус избранности
    })).toList();
    await prefs.setStringList('tasks', tasksJson);
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? tasksJson = prefs.getStringList('tasks');
    if (tasksJson != null) {
      setState(() {
        tasks = tasksJson.map((taskStr) {
          final Map<String, dynamic> data = jsonDecode(taskStr);
          return Task(
            title: data['title'],
            description: data['description'],
            dateTime: data['dateTime'] != null
                ? DateTime.parse(data['dateTime'])
                : null,
            isFavorite: data['isFavorite'] ?? false,
          );
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(247, 247, 249, 1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    onPressed: () =>
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TWOSettingsClass())),
                    icon: Icon(CupertinoIcons.gear),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      context.tr('Task'),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(width: 48),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final t = tasks[index];
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text(t.title)),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(t.isFavorite
                                          ? Icons.star
                                          : Icons.star_border),
                                      color: t.isFavorite
                                          ? Colors.amber
                                          : Colors.black,
                                      onPressed: () => _toggleFavorite(index),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      color: Color.fromARGB(255, 42, 155, 184),
                                      onPressed: () => _editTask(index),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      color: Color.fromARGB(255, 184, 42, 42),
                                      onPressed: () => _deleteTask(index),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            if (t.dateTime != null)
                              Text(context.tr('Date ${t.dateTime!.toLocal().toString().substring(0, 16)}')),
                            SizedBox(height: 8),
                            Text(t.description),
                          ]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTask() async {
    final newTask = await showAddTaskDialog(context);
    if (newTask != null) {
      setState(() {
        tasks.add(newTask);
      });
      await saveTasks();
    }
  }

  void _deleteTask(int index) async {
    setState(() => tasks.removeAt(index));
    await saveTasks();
  }

  void _editTask(int index) async {
    Task task = tasks[index];
    final updatedTask = await showEditTaskDialog(context, task);
    if (updatedTask != null) {
      setState(() {
        tasks[index] = updatedTask;
      });
      await saveTasks();
    }
  }

  void _toggleFavorite(int index) async {
    final task = tasks[index];
    setState(() {
      task.isFavorite = !task.isFavorite;
    });
    await saveTasks();
  }
}
