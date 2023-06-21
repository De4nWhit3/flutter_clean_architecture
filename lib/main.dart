import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/services/theme_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const CleanApp(),
  ));
}

class CleanApp extends StatelessWidget {
  const CleanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Clean App',
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeService.lightTheme,
          darkTheme: ThemeService.darkTheme,
          home: Scaffold(
            appBar: AppBar(actions: [
              OutlinedButton.icon(
                onPressed: () {
                  themeService.toggleTheme();
                },
                icon: const Icon(Icons.ac_unit),
                label: const Text('Change Theme'),
              ),
            ]),
          ),
        );
      },
    );
  }
}
