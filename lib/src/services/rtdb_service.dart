import 'package:firebase_database/firebase_database.dart';
import 'package:shared_engine/shared_engine.dart';
import 'package:shared_engine/src/handlers/rtdb_handler.dart';

class RTDBService<T extends TxModel> {
  final Function(Map<String, dynamic> doc) fromMap;
  final String child;
  final RTDBHandler _handler = RTDBHandler();

  RTDBService({required this.fromMap, required this.child});

  void addData(T model) async {
    await _handler.addData(child, model.toJson());
  }

  Stream<DatabaseEvent> listenDatabase() {
    return _handler.listenChild(child);
  }
}
