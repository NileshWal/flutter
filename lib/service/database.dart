import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../entity/todo_entity_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [TodoTable])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  static String databaseName = 'todo.sqlite';

  @override
  int get schemaVersion => 1;

  Future<List<TodoTableData>> getTodoList() async {
    return await select(todoTable).get();
  }

  Future<TodoTableData> getTodoItem(int id) async {
    return await (select(todoTable)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateTodoItem(TodoTableCompanion entity) async {
    return await update(todoTable).replace(entity);
  }

  Future<int> insertTodoItem(TodoTableCompanion entity) async {
    return await into(todoTable).insert(entity);
  }

  Future<int> deleteTodoItem(int id) async {
    return await (delete(todoTable)..where((tbl) => tbl.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final databaseFilePath = await getApplicationDocumentsDirectory();
    final file =
        File(path.join(databaseFilePath.path, MyDatabase.databaseName));

    return NativeDatabase.createInBackground(file);
  });
}
