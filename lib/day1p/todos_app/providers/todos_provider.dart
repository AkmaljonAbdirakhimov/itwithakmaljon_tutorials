import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';

final todosProvider =
    StateNotifierProvider<TodosProvider, List<Todo>>((ref) => TodosProvider());

class TodosProvider extends StateNotifier<List<Todo>> {
  // state - ni boshlang'ich holati bo'sh = []
  TodosProvider() : super([]);

  // add
  void addTodo({
    required String title,
    required DateTime date,
  }) {
    final newTodo = Todo(
      id: UniqueKey().toString(),
      title: title,
      date: date,
    );

    state = [...state, newTodo];
  }

  // edit
  void editTodo({
    required String id, // 1
    String? title, // Hi World
    DateTime? date, // null
  }) {
    // state = [
    //   Todo(id: 1, title: Hello World, date: 12-12-2024)
    //   Todo(id: 2, title: Hello World 2, date: 12-12-2024)
    // ]

    final updatedTodos = state.map((todo) {
      if (todo.id == id) {
        return todo.copyWith(
          title: title,
          date: date,
        );
      }
      return todo;
    }).toList();

    // updatedTodos = [
    //   Todo(id: 1, title: Hi World, date: 12-12-2024)
    //   Todo(id: 2, title: Hello World 2, date: 12-12-2024)
    // ]

    state = updatedTodos;
  }

  // delete
  void deleteTodo({
    required String id, // 2
  }) {
    // state  = [
    //   Todo(id: 1, title: Hi World, date: 12-12-2024)
    //   Todo(id: 2, title: Hello World 2, date: 12-12-2024)
    // ]
    state = state.where((todo) => todo.id != id).toList();

    // state  = [
    //   Todo(id: 1, title: Hi World, date: 12-12-2024)
    // ]
  }

  // toggle todo
  void toggleTodo({
    required String id, // 1
  }) {
    // state = [
    //   Todo(id: 1, title: Hello World, date: 12-12-2024, isDone: false)
    //   Todo(id: 2, title: Hello World 2, date: 12-12-2024, isDone: false)
    // ]

    final updatedTodos = state.map((todo) {
      if (todo.id == id) {
        return todo.copyWith(
          isDone: !todo.isDone,
        );
      }
      return todo;
    }).toList();

    // updatedTodos = [
    //   Todo(id: 1, title: Hi World, date: 12-12-2024, isDone: true)
    //   Todo(id: 2, title: Hello World 2, date: 12-12-2024, isDone: false)
    // ]
    state = updatedTodos;
  }

  Todo? getTodoById(String id) {
    try {
      return state.firstWhere((todo) => todo.id == id);
    } catch (e) {
      return null;
    }
  }
}
