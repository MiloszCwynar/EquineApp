import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBanner({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? currentRoute = ModalRoute.of(context)?.settings.name;

    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.brown[800],
      foregroundColor: Colors.white,
      elevation: 3.0,
      actions: [
        IconButton(
          icon: const Icon(Icons.home),
          tooltip: 'Home',
          onPressed: () {
            if (currentRoute != '/') {
              Navigator.pushReplacementNamed(context, '/');
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.list_alt),
          tooltip: 'View Catalogue',
          onPressed: () {
            if (currentRoute != '/view-horses') {
              Navigator.pushReplacementNamed(context, '/view-horses');
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          tooltip: 'Add Horse',
          onPressed: () {
            if (currentRoute != '/add-horse') {
              Navigator.pushReplacementNamed(context, '/add-horse');
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.person),
          tooltip: 'Login',
          onPressed: () {
            if (currentRoute != '/login') {
              Navigator.pushReplacementNamed(context, '/login');
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.person),
          tooltip: 'Sign Up',
          onPressed: () {
            if (currentRoute != '/signup') {
              Navigator.pushReplacementNamed(context, '/signup');
            }
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}