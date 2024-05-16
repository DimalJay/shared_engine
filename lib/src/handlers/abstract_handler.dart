import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DatabaseHandler<Snapshot> {
  void useEmulator({required String host, required int port});

  Future<Snapshot> getDocumentById(String collection, String id);
  Stream<Snapshot> getDocumentByIdStream(String collection, String id);
  Future<DocumentReference> addDocument(
      String collection, Map<String, dynamic> data);
  Future<void> addDocumentWithId(
      String collection, String id, Map<String, dynamic> data);
  Future<void> updateDocument(
      String collection, String id, Map<String, dynamic> data);
  Future<bool> isDocExists(String collection, String id);
  Future<void> deleteDocument(String collection, String id);
  Future<QuerySnapshot> getDocuments(String collection, {Query? query});
  Stream<QuerySnapshot> getDocumentsStream(String collection,
      {Query? query, int? limit});
}
