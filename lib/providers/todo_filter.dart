import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:todo_provider/models/todo_model.dart';

class TodoFilterState extends Equatable {
  final Filter filter;
  TodoFilterState({
    required this.filter,
  });

  factory TodoFilterState.initial() => TodoFilterState(filter: Filter.all);

  @override
  List<Object> get props => [filter];

  @override
  String toString() => 'TodoFilterState(filter: $filter)';

  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }
}

class TodoFilter extends StateNotifier<TodoFilterState> {
  TodoFilter() : super(TodoFilterState.initial());

  void changeFilter(Filter newFilter) {
    state = state.copyWith(filter: newFilter);
  }
}
