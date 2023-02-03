import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:third_day/profile.dart';
import 'package:third_day/profile_anon.dart';
import 'package:third_day/services/firebase_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () async {
                await AuthService().signInAnonymously();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Anon()));
              },
              child: const Text('Sign In Anonymously'),
            ),
            ElevatedButton(
              onPressed: () async {
                dynamic result = await AuthService()
                    .signInWithEmailAndPassword(email, password);
                if (result != null) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Anon()));
                } else {
                  print('Sign In Failed');
                }
              },
              child: const Text('Sign In With Email and Password'),
            ),
            ElevatedButton(
              onPressed: () async {
                dynamic result = await AuthService()
                    .registerWithEmailAndPassword(email, password);
                if (result != null) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Anon()));
                } else {
                  print('Sign In Failed');
                }
              },
              child: const Text('Register With Email and Password'),
            ),
            GestureDetector(
              onTap: () async {
                await AuthService().signInWithGoogle();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Profile()));
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/googleLogo.jpg'),
                radius: 50.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    onChanged: (val) => setState(() {
                      email = val;
                    }),
                    decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'email@gmail.com',
                        fillColor: Colors.grey,
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    onChanged: (val) => setState(() {
                      password = val;
                    }),
                    obscureText: true,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        hintText: 'password1234',
                        fillColor: Colors.grey,
                        border: OutlineInputBorder()),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
