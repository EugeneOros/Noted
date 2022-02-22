import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService({FirebaseAuth? firebaseAuth}) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  User? get user => FirebaseAuth.instance.currentUser;

  Future logInOrRegister(String email, String password) async {
    try {
      await _logInWithEmailAndPassword(email, password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        await _registerWithEmailAndPassword(email, password);
      }
      throw e;
    }
  }

  Future<UserCredential> _logInWithEmailAndPassword(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(email: email.trim(), password: password);
  }

  Future<UserCredential> _registerWithEmailAndPassword(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email.trim(), password: password);
  }

  Future<List<void>> signOut() async {
    return Future.wait([_firebaseAuth.signOut()]);
  }

  User? getUser() {
    return _firebaseAuth.currentUser;
  }

  bool isSignedIn(){
    return getUser() != null;
  }
}
