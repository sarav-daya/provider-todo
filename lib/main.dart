import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/pages/todos_page.dart';
import 'package:todo_provider/providers/providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MultiProvider(
      providers: [
        StateNotifierProvider<TodoFilter, TodoFilterState>(
          create: (context) => TodoFilter(),
        ),
        StateNotifierProvider<TodoSearch, TodoSearchState>(
          create: (context) => TodoSearch(),
        ),
        StateNotifierProvider<TodoList, TodoListState>(
          create: (context) => TodoList(),
        ),
        StateNotifierProvider<ActiveTodoCount, ActiveTodoCountState>(
          create: (context) => ActiveTodoCount(),
        ),
        StateNotifierProvider<FilteredTodos, FilteredTodosState>(
          create: (context) => FilteredTodos(),
        ),
      ],
      child: MaterialApp(
        title: 'Provider Todo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          textTheme: GoogleFonts.sourceSansProTextTheme(
              Theme.of(context).primaryTextTheme),
        ),
        home: const TodosPage(),
      ),
    );
  }
}
