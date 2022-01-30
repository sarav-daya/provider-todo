import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_provider/models/todo_model.dart';
import 'package:todo_provider/providers/providers.dart';

class FilteredTodosState extends Equatable {
  final List<Todo> filteredTodos;
  FilteredTodosState({
    required this.filteredTodos,
  });

  factory FilteredTodosState.initial() => FilteredTodosState(filteredTodos: []);

  @override
  List<Object> get props => [filteredTodos];

  @override
  String toString() => 'FilteredTodosState(filteredTodos: $filteredTodos)';

  FilteredTodosState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodosState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }
}

class FilteredTodos extends StateNotifier<FilteredTodosState>
    with LocatorMixin {
  FilteredTodos() : super(FilteredTodosState.initial());

  @override
  void update(Locator watch) {
    final todoFilter = watch<TodoFilterState>().filter;
    final todoSearch = watch<TodoSearchState>().searchTerm;
    final todoList = watch<TodoListState>().todos;

    List<Todo> _filteredTodos;

    switch (todoFilter) {
      case Filter.active:
        _filteredTodos =
            todoList.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        _filteredTodos = todoList.where((Todo todo) => todo.completed).toList();
        break;
      case Filter.all:
      default:
        _filteredTodos = todoList;
        break;
    }
    if (todoSearch.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((Todo todo) =>
              todo.desc.toLowerCase().contains(todoSearch.toLowerCase()))
          .toList();
    }

    state = state.copyWith(filteredTodos: _filteredTodos);

    super.update(watch);
  }
}
