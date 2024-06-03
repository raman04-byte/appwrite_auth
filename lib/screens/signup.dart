import 'package:appwriteauth/auth/authenticate.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the name';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
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
                createUser(nameController.text, emailController.text,
                        passwordController.text)
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
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
