import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<AuthResult> signIn(String email, String password) async {
    AuthResult user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user;
  }

  Future<AuthResult> register(String email, String password) async {
    AuthResult user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user;
  }
}
