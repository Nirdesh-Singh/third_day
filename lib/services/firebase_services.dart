import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:third_day/services/database.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  // Register in with Email and Password

  registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      //Add the new student into the database
      await DatabaseService(uid: user!.uid)
          .updateUserData('New Student', '20BCE7062');

      return user;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with Email and Password
  signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign Out
  signOut() async {
    await _auth.signOut();
  }
}
