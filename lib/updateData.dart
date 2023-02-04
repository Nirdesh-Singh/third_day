import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:third_day/profile_anon.dart';
import 'package:third_day/services/database.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({super.key});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  String name = 'Default name';
  String regno = '20BCE7000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const Anon()));
          },
        ),
        title: const Text('Update your details'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () async {
                await DatabaseService(
                        uid: FirebaseAuth.instance.currentUser!.uid)
                    .updateUserData(name, regno);
              },
              child: const Text('Update Details'),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    onChanged: (val) => setState(() {
                      name = val;
                    }),
                    decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Name',
                        fillColor: Colors.grey,
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    obscureText: true,
                    onChanged: (val) => setState(() {
                      regno = val;
                    }),
                    decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        hintText: '20BCE7062',
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
