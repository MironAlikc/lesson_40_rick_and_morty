import 'package:flutter/material.dart';
import 'package:lesson_40_rick_and_morty/presentation/screens/splash_screen.dart';
import 'package:lesson_40_rick_and_morty/presentation/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            theme: context.watch<ThemeProvider>().theme,
            home: const SplashScreen(),
          );
        }
      ),
    );
  }
}
