import 'package:appwriteauth/auth/authenticate.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                "Welcome to the simple authentication application using appwrite"),
            ElevatedButton(
              onPressed: () {
                logout();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
