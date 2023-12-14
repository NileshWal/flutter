import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_todo_app/routing/go_router.dart';
import 'package:sample_todo_app/service/database.dart';

import '../controllers/todo_controller.dart';

class TodoListTile extends ConsumerWidget {
  const TodoListTile({
    super.key,
    required this.isVisible,
    required this.todos,
    required this.index,
    required this.lineThrough,
  });

  final bool isVisible;
  final List<TodoTableData> todos;
  final int index;
  final bool lineThrough;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: isVisible,
      child: Dismissible(
        key: Key(todos[index].id.toString()),
        background: Container(
          padding: const EdgeInsets.only(right: 16.0),
          color: Colors.redAccent.shade700,
          child: const Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (_) {
          ref
              .read(todoControllerProvider)
              .removeTodo(todos[index].id.toString());
        },
        child: ListTile(
          onTap: () {
            context.pushNamed(AppRoute.addTodoScreen.name, extra: todos[index]);
          },
          leading: Checkbox(
            value: todos[index].completed,
            onChanged: (_) {
              final todoEntity = TodoTableData(
                  id: todos[index].id,
                  serialNumber: todos[index].serialNumber,
                  task: todos[index].task,
                  description: todos[index].description,
                  createdDate: todos[index].createdDate,
                  modifiedDate: todos[index].modifiedDate,
                  completed: !(todos[index].completed ?? true),
                  edited: todos[index].edited,
                  lastViewed: todos[index].lastViewed);
              ref.read(todoControllerProvider).toggleTodo(todoEntity);
            },
          ),
          title: Text(
            todos[index].task ?? "",
            style: lineThrough
                ? const TextStyle(decoration: TextDecoration.lineThrough)
                : null,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              ref
                  .read(todoControllerProvider)
                  .removeTodo(todos[index].id.toString());
            },
          ),
        ),
      ),
    );
  }
}
