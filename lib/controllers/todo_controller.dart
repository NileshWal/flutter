import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_todo_app/service/database.dart';

import '../repositories/todo_repository.dart';

class TodoController {
  final ProviderRef ref;

  TodoController(this.ref);

  void addTodo(TodoTableCompanion todo) {
    ref.read(todoRepositoryProvider.notifier).postTodoEntry(todo);
  }

  void removeTodo(String id) {
    ref.read(todoRepositoryProvider.notifier).deleteTodo(id);
  }

  void editTodo(String id, String title) {
    ref.read(todoRepositoryProvider.notifier).editTodo(id, title);
  }

  void toggleTodo(TodoTableData todo) {
    ref.read(todoRepositoryProvider.notifier).updateTodo(todo);
  }
}

final todoControllerProvider = Provider<TodoController>((ref) {
  return TodoController(ref);
});
