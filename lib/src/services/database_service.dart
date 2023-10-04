import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../handlers/firebase_handler.dart';
import '../models/model_abstract.dart';

class DatabaseService<T extends TxModel> {
  final Function(DocumentSnapshot doc) fromDoc;
  final String collection;
  final DatabaseHandler<DocumentSnapshot> _databaseHandler = FirestoreHandler();

  DatabaseService({
    required this.collection,
    required this.fromDoc,
  });

  // get Document
  Future<T> getDocument(String id) async {
    final snapshot = await _databaseHandler.getDocumentById(collection, id);
    return fromDoc(snapshot);
  }

  // Get Documents
  Future<List<T>> getDocuments() async {
    final documents = (await _databaseHandler.getDocuments(collection)).docs;
    return documents.map<T>((snapshot) => fromDoc(snapshot)).toList();
  }

  // add Document
  Future<void> addDocument(T model) async {
    log("HI");
    await _databaseHandler.addDocument(collection, model.toJson());
  }

  // Update Documents
  Future<void> updateDocument(T model) async {
    await _databaseHandler.updateDocument(collection, model.id, model.toJson());
  }

  //Delete Documents
  Future<void> deleteDocument(T model) async {
    await _databaseHandler.deleteDocument(collection, model.id);
  }
}
