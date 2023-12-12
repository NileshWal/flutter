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
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'todo.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
