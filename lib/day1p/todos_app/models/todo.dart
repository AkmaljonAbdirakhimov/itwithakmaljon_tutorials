import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String title;
  final DateTime date;
  final bool isDone;

  const Todo({
    required this.id,
    required this.title,
    required this.date,
    this.isDone = false,
  });

  Todo copyWith({
    String? id,
    String? title,
    DateTime? date,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object> get props => [id, title, date, isDone];
}
