import 'package:appwriteauth/auth/authenticate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userId = '';
  @override
  void initState() {
    super.initState();
    getCurrentUserId();
  }

  getCurrentUserId() async {
    try {
      final response = await account.get();
      setState(() {
        userId = response.$id;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Welcome to the simple authentication application using appwrite and the user ID is $userId"),
            ElevatedButton(
              onPressed: () {
                logout();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Logout'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/changeEmail');
              },
              child: const Text('Update Email'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/updatePassword');
              },
              child: const Text('Update Password'),
            ),
            ElevatedButton(
              onPressed: () async {
                await deleteAccount();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Delete'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/insertData');
              },
              child: const Text('Insert Data'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/uploadImage');
              },
              child: const Text('Upload Image'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/realtime');
              },
              child: const Text('Realtime'),
            ),
          ],
        ),
      ),
    );
  }
}
