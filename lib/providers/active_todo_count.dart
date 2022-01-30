import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_provider/models/todo_model.dart';
import 'package:todo_provider/providers/todo_list.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;

  ActiveTodoCountState({required this.activeTodoCount});

  factory ActiveTodoCountState.initial() =>
      ActiveTodoCountState(activeTodoCount: 0);

  @override
  List<Object> get props => [activeTodoCount];

  @override
  String toString() =>
      'ActiveTodoCountState(activeTodoCount: $activeTodoCount)';

  ActiveTodoCountState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}

class ActiveTodoCount extends StateNotifier<ActiveTodoCountState>
    with LocatorMixin {
  ActiveTodoCount() : super(ActiveTodoCountState.initial());

  @override
  void update(Locator watch) {
    final todos = watch<TodoListState>().todos;

    state = state.copyWith(
        activeTodoCount:
            todos.where((Todo todo) => !todo.completed).toList().length);

    super.update(watch);
  }

  // ActiveTodoCountState get state => ActiveTodoCountState(
  //       activeTodoCount: todoList.state.todos
  //           .where((Todo todo) => !todo.completed)
  //           .toList()
  //           .length,
  //     );
}
