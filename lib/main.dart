import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/theme.dart';
import 'package:provider/provider.dart';

import '3_application/core/services/theme_service.dart';

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
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: Scaffold(
            appBar: AppBar(
                title: const Text(
                  "Clean Architecture",
                ),
                actions: [
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
