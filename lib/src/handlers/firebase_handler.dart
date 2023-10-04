import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DatabaseHandler<Snapshot> {
  Future<Snapshot> getDocumentById(String collection, String id);
  Future<void> addDocument(String collection, Map<String, dynamic> data);
  Future<void> updateDocument(
      String collection, String id, Map<String, dynamic> data);
  Future<void> deleteDocument(String collection, String id);
  Future<QuerySnapshot> getDocuments(String collection, {Query? query});
}

class FirestoreHandler extends DatabaseHandler<DocumentSnapshot> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new document to a Firestore collection
  @override
  Future<void> addDocument(String collection, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).add(data);

      log("Document Added");
    } catch (e) {
      log("Error adding document: $e");
      rethrow;
    }
  }

  // Update an existing document in a Firestore collection
  @override
  Future<void> updateDocument(
      String collection, String id, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(id).update(data);
    } catch (e) {
      log("Error updating document: $e");
      rethrow;
    }
  }

  // Retrieve a document from a Firestore collection by its ID
  @override
  Future<DocumentSnapshot> getDocumentById(String collection, String id) async {
    try {
      return await _firestore.collection(collection).doc(id).get();
    } catch (e) {
      log("Error getting document: $e");
      rethrow;
    }
  }

  // Query documents in a Firestore collection based on specific conditions
  @override
  Future<QuerySnapshot> getDocuments(String collection, {Query? query}) async {
    try {
      return await (query ?? _firestore.collection(collection)).get();
    } catch (e) {
      log("Error querying documents: $e");
      rethrow;
    }
  }

  // Delete a document from a Firestore collection by its ID
  @override
  Future<void> deleteDocument(String collection, String id) async {
    try {
      await _firestore.collection(collection).doc(id).delete();
      log("Document Deleted");
    } catch (e) {
      log("Error deleting document: $e");
      rethrow;
    }
  }
}
