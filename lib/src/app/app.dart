import 'package:flutter/material.dart';
import 'package:secret_notes/src/core/theme/app_theme.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'Secret Notes'),
    );
  }
}