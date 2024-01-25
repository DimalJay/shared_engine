import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'abstract_handler.dart';

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

  // Add a new document to a Firestore collection
  @override
  Future<void> addDocumentWithId(
      String collection, String id, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(id).set(data);

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

  // Retrieve a document stream from a Firestore collection by its ID
  @override
  Stream<DocumentSnapshot> getDocumentByIdStream(String collection, String id) {
    try {
      return _firestore.collection(collection).doc(id).snapshots();
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

  // Query documents in a Firestore collection based on specific conditions
  @override
  Stream<QuerySnapshot> getDocumentsStream(String collection, {Query? query}) {
    try {
      return (query ?? _firestore.collection(collection)).snapshots();
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

  @override
  Future<bool> isDocExists(String collection, String id) {
    try {
      return _firestore
          .collection(collection)
          .doc(id)
          .get()
          .then((value) => value.exists);
    } catch (e) {
      log("Error fetching document");
      rethrow;
    }
  }
}
