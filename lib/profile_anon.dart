import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:third_day/fetchData.dart';
import 'package:third_day/services/firebase_services.dart';
import 'package:third_day/updateData.dart';

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
        leading: IconButton(
            onPressed: () async {
              await AuthService().signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
            icon: const Icon(Icons.logout)),
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: const FetchData(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const UpdateData())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
