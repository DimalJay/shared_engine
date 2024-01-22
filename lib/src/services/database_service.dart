import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../handlers/abstract_handler.dart';
import '../handlers/firestore_handler.dart';
import '../models/model_abstract.dart';

class DatabaseService<T extends TxModel> {
  final Function(DocumentSnapshot doc) fromDoc;
  final String collection;
  final DatabaseHandler<DocumentSnapshot> databaseHandler = FirestoreHandler();

  DatabaseService({
    required this.collection,
    required this.fromDoc,
  });

  // get Document
  Future<T> getDocument(String id) async {
    final snapshot = await databaseHandler.getDocumentById(collection, id);
    return fromDoc(snapshot);
  }

  // get Document Stream
  Stream<T> getDocumentStream(String id) {
    final snapshot = databaseHandler.getDocumentByIdStream(collection, id);
    return snapshot
        .where((event) => event.data() != null)
        .map((event) => fromDoc(event));
  }

  // Get Documents
  Future<List<T>> getDocuments({Query? query}) async {
    final documents =
        (await databaseHandler.getDocuments(collection, query: query)).docs;
    return documents.map<T>((snapshot) => fromDoc(snapshot)).toList();
  }

  // add Document
  Future<void> addDocument(T model) async {
    log("HI");
    await databaseHandler.addDocument(collection, model.toJson());
  }

  // add Document
  Future<void> addDocumentWithId(T model) async {
    log("HI");
    await databaseHandler.addDocumentWithId(
      collection,
      model.id,
      model.toJson(),
    );
  }

  // Update Documents
  Future<void> updateDocument(T model) async {
    await databaseHandler.updateDocument(collection, model.id, model.toJson());
  }

  // Exists Document
  Future<bool> existsDocument(String id) async {
    return databaseHandler.isDocExists(collection, id);
  }

  //Delete Documents
  Future<void> deleteDocument(T model) async {
    await databaseHandler.deleteDocument(collection, model.id);
  }
}
