import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/pages/todos_page.dart';
import 'package:todo_provider/providers/providers.dart';
import 'package:todo_provider/utils/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoFilter>(
          create: (context) => TodoFilter(),
        ),
        ChangeNotifierProvider<TodoSearch>(
          create: (context) => TodoSearch(),
        ),
        ChangeNotifierProvider<TodoList>(
          create: (context) => TodoList(),
        ),
        ProxyProvider<TodoList, ActiveTodoCount>(
          update: (
            BuildContext context,
            TodoList todoList,
            ActiveTodoCount? _,
          ) =>
              ActiveTodoCount(todoList: todoList),
        ),
        PP3<TodoFilter, TodoSearch, TodoList, FilteredTodos>(
          update: (BuildContext context, TodoFilter todoFilter,
                  TodoSearch todoSearch, TodoList todoList, FilteredTodos? _) =>
              FilteredTodos(
                  todoFilter: todoFilter,
                  todoList: todoList,
                  todoSearch: todoSearch),
        )
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
