import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  // Add Collection
  final CollectionReference studentCollection =
      FirebaseFirestore.instance.collection('students');

  Future updateUserData(String name, String regno) async {
    return await studentCollection.doc(uid).set({
      'name' : name,
      'regno' : regno,
    });
  }
}
