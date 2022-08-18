import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User? get currentUser;
  Future<User?> signInAnonymously();
  Future<void> signOut();
  Stream<User?> authStateChanges();
  Future<User?> createUser(String email, String password);
  Future<User?> signInWithEmail(String email, String password);
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<User?> signInAnonymously() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  Future<User?> signInWithEmail(String email, String password) async {
    final UserCredential = await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
    return UserCredential.user;
  }

  Future<User?> createUser(String email, String password) async {
    final UserCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(UserCredential.user!.uid)
    //     .set({'name': UserCredential.user!.displayName, 'vip': true});
    return UserCredential.user;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
