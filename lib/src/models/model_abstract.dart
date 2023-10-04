abstract class TxModel {
  final String id;
  final String collectionName;

  TxModel(this.collectionName, {required this.id});

  Map<String, dynamic> toJson();
}
