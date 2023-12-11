import 'package:drift/drift.dart';

class TodoTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get serialNumber => integer().nullable()();

  TextColumn get task => text().nullable()();

  TextColumn get description => text().nullable()();

  DateTimeColumn get createdDate => dateTime()();

  DateTimeColumn get modifiedDate => dateTime()();

  BoolColumn get completed => boolean().nullable()();

  BoolColumn get edited => boolean().nullable()();

  BoolColumn get lastViewed => boolean().nullable()();
}
