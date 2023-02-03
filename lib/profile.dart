import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:third_day/home.dart';
import 'package:third_day/services/firebase_services.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
            CircleAvatar(
              backgroundImage:
                  NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!),
              radius: 50.0,
            ),
            Text('${FirebaseAuth.instance.currentUser!.displayName}'),
            Text('${FirebaseAuth.instance.currentUser!.email}'),
            ElevatedButton(
                onPressed: () async {
                  await AuthService().signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
                child: const Text('Logout')),
          ],
        ),
      ),
    );
  }
}
