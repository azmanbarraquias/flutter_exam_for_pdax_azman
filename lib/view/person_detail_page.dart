import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonDetailPage extends StatelessWidget {
  const PersonDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> personData = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(personData['name']),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(personData['image']),
            SizedBox(height: 10),
            Text(
              personData['name'],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              personData['email'],
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
