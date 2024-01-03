import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_todo_app/routing/go_router.dart';

import '../../widgets/todo_list_view.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  Color fromHex(String? hexString) {
    if (hexString == null) {
      return Colors.transparent;
    }
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
      ),
      body: const TodoListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffc7c6c5),
        onPressed: () {
          context.pushNamed(AppRoute.addTodoScreen.name);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
