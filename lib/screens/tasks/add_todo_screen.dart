import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sample_todo_app/controllers/todo_controller.dart';

import '../../service/database.dart';

class AddTodoScreen extends ConsumerStatefulWidget {
  const AddTodoScreen({
    super.key,
    this.todo,
  });

  final TodoTableData? todo;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends ConsumerState<AddTodoScreen> {
  final todoCreated = "CLIENT_TODO_CREATED";
  final todoEdited = "CLIENT_TODO_EDITED";
  late TextEditingController controller;
  bool isSubmitVisible = true;
  static int srNoCounter = 0;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.todo?.task ?? '');
  }

  void canSubmit() {
    setState(() {
      isSubmitVisible = controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    void saveTodo() {
      final formattedDate =
          DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(DateTime.now());
      final formattedDateObj = DateTime.parse(formattedDate);
      final todoEntity = TodoTableCompanion(
          id: Value(formattedDateObj.millisecondsSinceEpoch),
          serialNumber: Value(srNoCounter),
          task: Value(controller.text.trim()),
          description: Value(controller.text.trim()),
          createdDate: Value(formattedDateObj),
          modifiedDate: Value(formattedDateObj),
          completed: const Value(false),
          edited: const Value(false),
          lastViewed: const Value(false));
      srNoCounter++;
      if (widget.todo == null) {
        ref.read(todoControllerProvider).addTodo(todoEntity);
      } else {
        MyDatabase().updateTodoItem(todoEntity);
        ref
            .read(todoControllerProvider)
            .editTodo(widget.todo!.id.toString(), controller.text.trim());
      }
      context.pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: controller.text.isEmpty
            ? const Text('Add a task')
            : const Text('Edit task'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: isSubmitVisible ? saveTodo : null,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: TextField(
          controller: controller,
          autofocus: true,
          onSubmitted: (_) {
            saveTodo();
          },
          onChanged: (_) => canSubmit(),
          decoration: InputDecoration(
            hintText: 'Task',
            label: const Text('Your task'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ),
    );
  }
}
