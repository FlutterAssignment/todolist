import 'package:flutter/material.dart';
import '../todo/todo_list_screen.dart';
import '../../providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        actions: [
          Consumer<ThemeProvider>(
            builder: (_, theme, __) => IconButton(
              icon: Icon(theme.isDark ? Icons.light_mode : Icons.dark_mode),
              onPressed: () => theme.toggleTheme(),
            ),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to To-Do List"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TodoListScreen()),
            );
          },
        ),
      ),
    );
  }
}
