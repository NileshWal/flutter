import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_todo_app/repositories/todo_repository.dart';
import 'package:sample_todo_app/utils/practice_utils.dart';
import 'package:sample_todo_app/widgets/todo_list_card.dart';

class TodoListView extends ConsumerStatefulWidget {
  const TodoListView({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoListViewState();
}

class _TodoListViewState extends ConsumerState<TodoListView> {
  bool isUnfinishedVisible = true;

  @override
  Widget build(BuildContext context) {
    final allTodos = ref.watch(allTodoProvider);
    return allTodos.isEmpty
        ? const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  PracticeUtils.addTaskTitle,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          )
        : CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: allTodos.length,
                  (context, index) => TodoListCard(
                    isVisible: isUnfinishedVisible,
                    todos: allTodos,
                    index: index,
                    lineThrough: allTodos[index].completed ?? false,
                  ),
                ),
              ),
            ],
          );
  }
}
