import 'package:appwriteauth/auth/authenticate.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the email';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the password';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                loginUser(emailController.text, passwordController.text)
                    .then((value) {
                  if (value) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid email or password'),
                      ),
                    );
                  }
                });
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
