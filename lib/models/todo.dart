class Todo {
  final int id;
  final int serialNumber;
  final String task;
  final String description;
  final DateTime createdDate;
  final DateTime modifiedDate;
  bool completed;
  bool edited;
  bool lastViewed;

  static String iDTag = 'id';
  static String serialNumberTag = 'serialNumber';
  static String taskTag = 'task';
  static String descriptionTag = 'description';
  static String createdDateTag = 'createdDate';
  static String modifiedDateTag = 'modifiedDate';
  static String completedTag = 'completed';
  static String editedTag = 'edited';
  static String lastViewedTag = 'lastViewed';

  Todo({
    required this.id,
    required this.serialNumber,
    required this.task,
    required this.description,
    required this.createdDate,
    required this.modifiedDate,
    this.completed = false,
    this.edited = false,
    this.lastViewed = false,
  });

  Todo copyWith({
    int? id,
    int? serialNumber,
    String? task,
    String? description,
    DateTime? createdDate,
    DateTime? modifiedDate,
    bool? completed,
    bool? edited,
    bool? lastViewed,
  }) {
    return Todo(
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      iDTag: id,
      serialNumberTag: serialNumber,
      taskTag: task,
      descriptionTag: description,
      createdDateTag: createdDate.toIso8601String(),
      modifiedDateTag: modifiedDate.toIso8601String(),
      completedTag: completed,
      editedTag: edited,
      lastViewedTag: lastViewed,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map[Todo.iDTag] as int,
      serialNumber: map[Todo.serialNumberTag] as int,
      task: map[Todo.taskTag] as String,
      description: map[Todo.descriptionTag] as String,
      createdDate: DateTime.parse(map[Todo.createdDateTag]),
      modifiedDate: DateTime.parse(map[Todo.modifiedDateTag]),
      completed: map[Todo.completedTag] as bool,
      edited: map[Todo.editedTag] as bool,
      lastViewed: map[Todo.lastViewedTag] as bool,
    );
  }

  Map toJson() => {
        iDTag: id,
        serialNumberTag: serialNumber,
        taskTag: task,
        descriptionTag: description,
        createdDateTag: createdDate.toIso8601String(),
        modifiedDateTag: modifiedDate.toIso8601String(),
        completedTag: completed,
        editedTag: edited,
        lastViewedTag: lastViewed,
      };

  Map<String, dynamic> toMapJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[iDTag] = id;
    data[serialNumberTag] = serialNumber;
    data[taskTag] = task;
    data[descriptionTag] = description;
    data[createdDateTag] = createdDate.toIso8601String();
    data[modifiedDateTag] = modifiedDate.toIso8601String();
    data[completedTag] = completed;
    data[editedTag] = edited;
    data[lastViewedTag] = lastViewed;
    return data;
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json[Todo.iDTag] as int,
      serialNumber: json[Todo.serialNumberTag] as int,
      task: json[Todo.taskTag] as String,
      description: json[Todo.descriptionTag] as String,
      createdDate: DateTime.parse(json[Todo.createdDateTag]),
      modifiedDate: DateTime.parse(json[Todo.modifiedDateTag]),
      completed: json[Todo.completedTag] as bool,
      edited: json[Todo.editedTag] as bool,
      lastViewed: json[Todo.lastViewedTag] as bool,
    );
  }
}
