// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TodoTableTable extends TodoTable
    with TableInfo<$TodoTableTable, TodoTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _serialNumberMeta =
      const VerificationMeta('serialNumber');
  @override
  late final GeneratedColumn<int> serialNumber = GeneratedColumn<int>(
      'serial_number', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _taskMeta = const VerificationMeta('task');
  @override
  late final GeneratedColumn<String> task = GeneratedColumn<String>(
      'task', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _modifiedDateMeta =
      const VerificationMeta('modifiedDate');
  @override
  late final GeneratedColumn<DateTime> modifiedDate = GeneratedColumn<DateTime>(
      'modified_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _completedMeta =
      const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
      'completed', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("completed" IN (0, 1))'));
  static const VerificationMeta _editedMeta = const VerificationMeta('edited');
  @override
  late final GeneratedColumn<bool> edited = GeneratedColumn<bool>(
      'edited', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("edited" IN (0, 1))'));
  static const VerificationMeta _lastViewedMeta =
      const VerificationMeta('lastViewed');
  @override
  late final GeneratedColumn<bool> lastViewed = GeneratedColumn<bool>(
      'last_viewed', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("last_viewed" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        serialNumber,
        task,
        description,
        createdDate,
        modifiedDate,
        completed,
        edited,
        lastViewed
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_table';
  @override
  VerificationContext validateIntegrity(Insertable<TodoTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('serial_number')) {
      context.handle(
          _serialNumberMeta,
          serialNumber.isAcceptableOrUnknown(
              data['serial_number']!, _serialNumberMeta));
    }
    if (data.containsKey('task')) {
      context.handle(
          _taskMeta, task.isAcceptableOrUnknown(data['task']!, _taskMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    } else if (isInserting) {
      context.missing(_createdDateMeta);
    }
    if (data.containsKey('modified_date')) {
      context.handle(
          _modifiedDateMeta,
          modifiedDate.isAcceptableOrUnknown(
              data['modified_date']!, _modifiedDateMeta));
    } else if (isInserting) {
      context.missing(_modifiedDateMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    if (data.containsKey('edited')) {
      context.handle(_editedMeta,
          edited.isAcceptableOrUnknown(data['edited']!, _editedMeta));
    }
    if (data.containsKey('last_viewed')) {
      context.handle(
          _lastViewedMeta,
          lastViewed.isAcceptableOrUnknown(
              data['last_viewed']!, _lastViewedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      serialNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}serial_number']),
      task: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      modifiedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}modified_date'])!,
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completed']),
      edited: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}edited']),
      lastViewed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}last_viewed']),
    );
  }

  @override
  $TodoTableTable createAlias(String alias) {
    return $TodoTableTable(attachedDatabase, alias);
  }
}

class TodoTableData extends DataClass implements Insertable<TodoTableData> {
  final int id;
  final int? serialNumber;
  final String? task;
  final String? description;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final bool? completed;
  final bool? edited;
  final bool? lastViewed;
  const TodoTableData(
      {required this.id,
      this.serialNumber,
      this.task,
      this.description,
      required this.createdDate,
      required this.modifiedDate,
      this.completed,
      this.edited,
      this.lastViewed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || serialNumber != null) {
      map['serial_number'] = Variable<int>(serialNumber);
    }
    if (!nullToAbsent || task != null) {
      map['task'] = Variable<String>(task);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_date'] = Variable<DateTime>(createdDate);
    map['modified_date'] = Variable<DateTime>(modifiedDate);
    if (!nullToAbsent || completed != null) {
      map['completed'] = Variable<bool>(completed);
    }
    if (!nullToAbsent || edited != null) {
      map['edited'] = Variable<bool>(edited);
    }
    if (!nullToAbsent || lastViewed != null) {
      map['last_viewed'] = Variable<bool>(lastViewed);
    }
    return map;
  }

  TodoTableCompanion toCompanion(bool nullToAbsent) {
    return TodoTableCompanion(
      id: Value(id),
      serialNumber: serialNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(serialNumber),
      task: task == null && nullToAbsent ? const Value.absent() : Value(task),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdDate: Value(createdDate),
      modifiedDate: Value(modifiedDate),
      completed: completed == null && nullToAbsent
          ? const Value.absent()
          : Value(completed),
      edited:
          edited == null && nullToAbsent ? const Value.absent() : Value(edited),
      lastViewed: lastViewed == null && nullToAbsent
          ? const Value.absent()
          : Value(lastViewed),
    );
  }

  factory TodoTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoTableData(
      id: serializer.fromJson<int>(json['id']),
      serialNumber: serializer.fromJson<int?>(json['serialNumber']),
      task: serializer.fromJson<String?>(json['task']),
      description: serializer.fromJson<String?>(json['description']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      modifiedDate: serializer.fromJson<DateTime>(json['modifiedDate']),
      completed: serializer.fromJson<bool?>(json['completed']),
      edited: serializer.fromJson<bool?>(json['edited']),
      lastViewed: serializer.fromJson<bool?>(json['lastViewed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serialNumber': serializer.toJson<int?>(serialNumber),
      'task': serializer.toJson<String?>(task),
      'description': serializer.toJson<String?>(description),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'modifiedDate': serializer.toJson<DateTime>(modifiedDate),
      'completed': serializer.toJson<bool?>(completed),
      'edited': serializer.toJson<bool?>(edited),
      'lastViewed': serializer.toJson<bool?>(lastViewed),
    };
  }

  TodoTableData copyWith(
          {int? id,
          Value<int?> serialNumber = const Value.absent(),
          Value<String?> task = const Value.absent(),
          Value<String?> description = const Value.absent(),
          DateTime? createdDate,
          DateTime? modifiedDate,
          Value<bool?> completed = const Value.absent(),
          Value<bool?> edited = const Value.absent(),
          Value<bool?> lastViewed = const Value.absent()}) =>
      TodoTableData(
        id: id ?? this.id,
        serialNumber:
            serialNumber.present ? serialNumber.value : this.serialNumber,
        task: task.present ? task.value : this.task,
        description: description.present ? description.value : this.description,
        createdDate: createdDate ?? this.createdDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        completed: completed.present ? completed.value : this.completed,
        edited: edited.present ? edited.value : this.edited,
        lastViewed: lastViewed.present ? lastViewed.value : this.lastViewed,
      );
  @override
  String toString() {
    return (StringBuffer('TodoTableData(')
          ..write('id: $id, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('task: $task, ')
          ..write('description: $description, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('completed: $completed, ')
          ..write('edited: $edited, ')
          ..write('lastViewed: $lastViewed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, serialNumber, task, description,
      createdDate, modifiedDate, completed, edited, lastViewed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoTableData &&
          other.id == this.id &&
          other.serialNumber == this.serialNumber &&
          other.task == this.task &&
          other.description == this.description &&
          other.createdDate == this.createdDate &&
          other.modifiedDate == this.modifiedDate &&
          other.completed == this.completed &&
          other.edited == this.edited &&
          other.lastViewed == this.lastViewed);
}

class TodoTableCompanion extends UpdateCompanion<TodoTableData> {
  final Value<int> id;
  final Value<int?> serialNumber;
  final Value<String?> task;
  final Value<String?> description;
  final Value<DateTime> createdDate;
  final Value<DateTime> modifiedDate;
  final Value<bool?> completed;
  final Value<bool?> edited;
  final Value<bool?> lastViewed;
  const TodoTableCompanion({
    this.id = const Value.absent(),
    this.serialNumber = const Value.absent(),
    this.task = const Value.absent(),
    this.description = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.modifiedDate = const Value.absent(),
    this.completed = const Value.absent(),
    this.edited = const Value.absent(),
    this.lastViewed = const Value.absent(),
  });
  TodoTableCompanion.insert({
    this.id = const Value.absent(),
    this.serialNumber = const Value.absent(),
    this.task = const Value.absent(),
    this.description = const Value.absent(),
    required DateTime createdDate,
    required DateTime modifiedDate,
    this.completed = const Value.absent(),
    this.edited = const Value.absent(),
    this.lastViewed = const Value.absent(),
  })  : createdDate = Value(createdDate),
        modifiedDate = Value(modifiedDate);
  static Insertable<TodoTableData> custom({
    Expression<int>? id,
    Expression<int>? serialNumber,
    Expression<String>? task,
    Expression<String>? description,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? modifiedDate,
    Expression<bool>? completed,
    Expression<bool>? edited,
    Expression<bool>? lastViewed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serialNumber != null) 'serial_number': serialNumber,
      if (task != null) 'task': task,
      if (description != null) 'description': description,
      if (createdDate != null) 'created_date': createdDate,
      if (modifiedDate != null) 'modified_date': modifiedDate,
      if (completed != null) 'completed': completed,
      if (edited != null) 'edited': edited,
      if (lastViewed != null) 'last_viewed': lastViewed,
    });
  }

  TodoTableCompanion copyWith(
      {Value<int>? id,
      Value<int?>? serialNumber,
      Value<String?>? task,
      Value<String?>? description,
      Value<DateTime>? createdDate,
      Value<DateTime>? modifiedDate,
      Value<bool?>? completed,
      Value<bool?>? edited,
      Value<bool?>? lastViewed}) {
    return TodoTableCompanion(
      id: id ?? this.id,
      serialNumber: serialNumber ?? this.serialNumber,
      task: task ?? this.task,
      description: description ?? this.description,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      completed: completed ?? this.completed,
      edited: edited ?? this.edited,
      lastViewed: lastViewed ?? this.lastViewed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serialNumber.present) {
      map['serial_number'] = Variable<int>(serialNumber.value);
    }
    if (task.present) {
      map['task'] = Variable<String>(task.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (modifiedDate.present) {
      map['modified_date'] = Variable<DateTime>(modifiedDate.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (edited.present) {
      map['edited'] = Variable<bool>(edited.value);
    }
    if (lastViewed.present) {
      map['last_viewed'] = Variable<bool>(lastViewed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoTableCompanion(')
          ..write('id: $id, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('task: $task, ')
          ..write('description: $description, ')
          ..write('createdDate: $createdDate, ')
          ..write('modifiedDate: $modifiedDate, ')
          ..write('completed: $completed, ')
          ..write('edited: $edited, ')
          ..write('lastViewed: $lastViewed')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $TodoTableTable todoTable = $TodoTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todoTable];
}
