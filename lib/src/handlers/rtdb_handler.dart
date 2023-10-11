import 'package:firebase_database/firebase_database.dart';

class RTDBHandler {
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  Future<void> addData(String child, Map<String, dynamic> map) async {
    final DatabaseReference chatRef = _firebaseDatabase.ref().child(child);
    await chatRef.push().set(map);
  }

  Stream<DatabaseEvent> listenChild(String child) {
    final DatabaseReference chatRef = _firebaseDatabase.ref().child(child);
    return chatRef.onChildAdded;
  }
}
