import 'package:appwriteauth/auth/authenticate.dart';
import 'package:appwriteauth/models/realtime_model.dart';
import 'package:flutter/material.dart';

class RealtimeScreen extends StatefulWidget {
  const RealtimeScreen({super.key});

  @override
  State<RealtimeScreen> createState() => _RealtimeScreenState();
}

class _RealtimeScreenState extends State<RealtimeScreen> {
  late Future<RealtimeModel> _initialData;
  RealtimeModel? _currentData;
  late Stream<RealtimeModel> _realtimeStream;

  @override
  void initState() {
    super.initState();
    _initialData = initialFunction();
    _realtimeStream = subscribeToRealtime();

    // Fetch initial data and set it to the state
    _initialData.then((data) {
      setState(() {
        _currentData = data;
      });
    });

    // Listen to real-time updates and update the state
    _realtimeStream.listen((data) {
      setState(() {
        _currentData = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-time Data'),
      ),
      body: _currentData == null
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Text 1: ${_currentData!.text1}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Text 2: ${_currentData!.text2}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
    );
  }
}
