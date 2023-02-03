import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:third_day/services/firebase_services.dart';

import 'home.dart';

class Anon extends StatefulWidget {
  const Anon({super.key});

  @override
  State<Anon> createState() => _AnonState();
}

class _AnonState extends State<Anon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Hi, Welcome to the App !'),
            ElevatedButton(
                onPressed: () async {
                  await AuthService().signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
                child: const Text('Logout')),
          ],
        )));
  }
}
