import 'package:flutter/material.dart';
import 'package:movie_app/pages/bloc/counter/counter_page.dart';
import 'package:movie_app/pages/set_state/list_package_page.dart';
import 'package:movie_app/pages/bloc/list/list_page.dart';

class ThemesPage extends StatefulWidget {
  const ThemesPage({super.key});

  @override
  State<ThemesPage> createState() => _ThemesPageState();
}

class _ThemesPageState extends State<ThemesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$widget")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ListPackagePage()),
                  );
                },
                child: const Text("setState")),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ListPage()),
                );
              },
              child: const Text("Bloc"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CounterPage()),
                );
              },
              child: const Text("Counter Bloc"),
            ),
          ],
        ),
      ),
    );
  }
}
