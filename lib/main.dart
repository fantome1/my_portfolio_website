// ignore_for_file: deprecated_member_use

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'configure/navigation_service.dart';
import 'pages/layoutPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  setupLocator();
  runApp(MyApp(
    savedThemeMode: savedThemeMode ?? AdaptiveThemeMode.system,
  ));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode savedThemeMode;
  const MyApp({Key? key, required this.savedThemeMode}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      dark: ThemeData(
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      initial: savedThemeMode,
      builder: (theme, darkTheme) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Phoenix Technologie',
          theme: theme,
          darkTheme: darkTheme,
          home: const LayoutPage()),
    );
  }
}
