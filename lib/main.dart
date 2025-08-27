import 'package:flutter/material.dart';
import 'package:universal_converter/screens/home_screen.dart';

void main() {
  // It's important to ensure Flutter bindings are initialized before running the app,
  // especially when adding plugins like google_mobile_ads later.
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const UniversalConverterApp());
}

class UniversalConverterApp extends StatelessWidget {
  const UniversalConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universal Converter',
      // The theme is configured to use Material 3.
      // A dynamic color scheme could be generated from a seed color.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      // Optional dark theme configuration.
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      // Let the system decide whether to use the light or dark theme.
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      // The starting point of our app's UI.
      home: const HomeScreen(),
    );
  }
}
