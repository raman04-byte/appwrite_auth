import 'package:flutter/material.dart';

import 'route.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // For self signed certificates, only use for development
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: routesMethod,
    );
  }
}
