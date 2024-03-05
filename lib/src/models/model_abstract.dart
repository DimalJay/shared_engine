abstract class TxModel {
  final String id;
  final String collectionName;
  final DateTime createdAt;
  final DateTime updatedAt;

  TxModel(this.collectionName,
      {required this.id, DateTime? createdAt, DateTime? updatedAt})
      : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}
