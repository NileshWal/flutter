import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_todo_app/service/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/todo.dart';
import '../network/network_api.dart';

class TodoRepository extends StateNotifier<List<TodoTableData>> {
  late MyDatabase db;

  TodoRepository() : super([]) {
    db = MyDatabase();
    loadTodos();
  }

  Future<void> loadTodos() async {
    final todoList = await db.getTodoList();
    state = todoList;
  }

  Future<void> saveTodos(List<Todo> todos) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedTodos =
        jsonEncode(todos.map((todo) => todo.toJson()).toList());
    await prefs.setString('todos', encodedTodos);
  }

  Future<void> postTodoEntry(TodoTableCompanion todo) async {
    await db.insertTodoItem(todo);
    await loadTodos();
  }

  Future<List<Todo>> fetchTodoList() async {
    List<Todo> fetchedTodoList = await NetworkApi().fetchTodoList();
    return fetchedTodoList;
  }

  Future<void> updateTodo(TodoTableData todo) async {
    final todoEntity = TodoTableCompanion(
        id: Value(todo.id),
        serialNumber: Value(todo.serialNumber),
        task: Value(todo.task),
        description: Value(todo.description),
        createdDate: Value(todo.createdDate),
        modifiedDate: Value(todo.modifiedDate),
        completed: Value(todo.completed),
        edited: Value(todo.edited),
        lastViewed: Value(todo.lastViewed));
    db.updateTodoItem(todoEntity);
  }

  Future<void> deleteTodo(String id) async {
    var response = await NetworkApi().deleteTodo(id);
    if (response != null && response.statusCode == 200) {
      loadTodos();
    }
  }

  @override
  set state(List<TodoTableData> newState) {
    super.state = newState;
    //saveTodos(newState);
  }

  void addTodo(TodoTableData todo) {
    state = [todo, ...state];
  }

  void removeTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id != int.parse(id)) todo
    ];
  }

  void editTodo(String id, String title) {
    state = [
      for (final todo in state)
        if (todo.id == int.parse(id))
          todo.copyWith(task: Value(title))
        else
          todo
    ];
  }

  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == int.parse(id))
          todo.copyWith(completed: Value(!(todo.completed ?? false)))
        else
          todo
    ];
  }
}

final todoRepositoryProvider =
    StateNotifierProvider<TodoRepository, List<TodoTableData>>((ref) {
  return TodoRepository();
});

final allTodoProvider = Provider<List<TodoTableData>>((ref) {
  return ref.watch(todoRepositoryProvider);
});
