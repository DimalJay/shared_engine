import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_engine/src/handlers/auth_handler.dart';

class AuthService {
  final AuthHandler authHandler = AuthHandler();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final StreamController<User?> _userController = StreamController<User?>();

  Stream<User?> get authStateChanges => _userController.stream;

  AuthService() {
    _auth.authStateChanges().listen((User? user) {
      // Emit the current user to the stream
      _userController.add(user);
    });
  }

  void updateStream(User user) {
    _userController.add(user);
  }

  Future<User?> googleSignIn() async {
    return await authHandler.signInWithGoogle();
  }

  Future<User?> currentUser() async {
    return await authHandler.getCurrentUser();
  }

  void googleSignOut() async {
    await authHandler.signOut();
  }

  void dispose() {
    _userController.close();
  }
}
