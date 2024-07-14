import 'package:appwriteauth/auth/authenticate.dart';
import 'package:flutter/material.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  final TextEditingController userAddress = TextEditingController();
  final TextEditingController userNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inserting data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: userAddress,
              decoration: const InputDecoration(
                labelText: 'Address',
              ),
            ),
            TextField(
              controller: userNumber,
              decoration: const InputDecoration(
                labelText: 'Number',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await updateData(userAddress.text, userNumber.text)
                    .then((value) {
                  if (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data updated successfully'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Failed to Data updated'),
                      ),
                    );
                  }
                });
              },
              child: const Text('Update Data'),
            ),
          ],
        ),
      ),
    );
  }
}
