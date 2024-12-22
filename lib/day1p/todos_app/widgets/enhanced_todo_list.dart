import 'package:day1/day1p/todos_app/providers/todos_provider.dart';
import 'package:day1/day1p/todos_app/widgets/edit_todo_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class EnhancedTodoList extends ConsumerWidget {
  const EnhancedTodoList({super.key});

  void _showEditTodoDialog(BuildContext context, String id) {
    showDialog(context: context, builder: (ctx) => EditTodoDialog(id: id));
  }

  void _deleteTodo(WidgetRef ref, String id) {
    ref.read(todosProvider.notifier).deleteTodo(id: id);
  }

  void _toggleTodo(WidgetRef ref, String id) {
    ref.read(todosProvider.notifier).toggleTodo(id: id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      itemCount: todos.length,
      itemBuilder: (ctx, index) {
        final todo = todos[index];
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Dismissible(
            key: Key(todo.id),
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.delete, color: Colors.red.shade700),
                ],
              ),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              // Handle delete
              if (direction == DismissDirection.endToStart) {
                _deleteTodo(ref, todo.id);
              }
            },
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: IconButton(
                onPressed: () => _toggleTodo(ref, todo.id),
                icon: Icon(
                  todo.isDone
                      ? Icons.check_circle_outline
                      : Icons.circle_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 28,
                ),
              ),
              title: Text(
                todo.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        DateFormat("dd-MM-yyyy").format(todo.date),
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => _showEditTodoDialog(context, todo.id),
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _deleteTodo(ref, todo.id),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (ctx, index) {
        return const SizedBox(height: 8);
      },
    );
  }
}
