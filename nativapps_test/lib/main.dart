import 'package:flutter/material.dart';
import 'package:nativapps_test/core/paths/app_paths.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NativApps',
      theme: ThemeData(primarySwatch: Colors.blue),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterGenerator.generateRoute,
    );
  }
}
