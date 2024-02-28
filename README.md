<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.
## Install
```yaml
shared_engine:
  git: 
    url: https://github.com/DimalJay/shared_engine
```

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

```dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_engine/shared_engine.dart';

class UserModel extends TxModel {
  static String collectioName = "users";

  final String name;
  UserModel({required super.id, required this.name}) : super(collectioName);

  @override
  Map<String, dynamic> toJson() {
    return {
      "name": name,
    };
  }

  factory UserModel.fromDoc(DocumentSnapshot doc) {
    return UserModel(id: doc.id, name: doc['name'].toString());
  }

  static DatabaseService<UserModel> get service => DatabaseService<UserModel>(
      collection: UserModel.collection, fromDoc: UserModel.fromDoc);
}


```


### Use

```dart
await UserModel.service.addDocument(UserModel(id: '', name: 'Dimal'));
```
