import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign in with email and password
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return result.user;
    } catch (e) {
      print('Sign in error: $e');
      rethrow;
    }
  }

  // Create user with email and password
  Future<User?> createUserWithEmail(String email, String password, String role) async {
    try {
      print('Attempting to create user: $email with role: $role'); // Debug log

      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('User created successfully in Firebase Auth'); // Debug log
      return result.user;
    } catch (e) {
      print('Error creating user in Firebase Auth: $e'); // Debug log
      rethrow;
    }
  }


  // Save user data to Firestore
  Future<void> saveUserData(UserModel user) async {
    try {
      print('Attempting to save user data to Firestore: ${user.toMap()}'); // Debug log

      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(user.toMap());

      print('User data saved successfully to Firestore'); // Debug log
    } catch (e) {
      print('Error saving user data to Firestore: $e'); // Debug log
      rethrow;
    }
  }

  // Get user role from Firestore
  Future<String?> getUserRole(String uid) async {
    try {
      DocumentSnapshot doc =
      await _firestore.collection('users').doc(uid).get();

      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return data['role'] as String?;
      }
      return null;
    } catch (e) {
      print('Get user role error: $e');
      return null;
    }
  }
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('Password reset email error: $e');
      rethrow;
    }
  }
  // Get user data from Firestore
  Future<UserModel?> getUserData(String uid) async {
    try {
      DocumentSnapshot doc =
      await _firestore.collection('users').doc(uid).get();

      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return createUserFromMap(data);
      }
      return null;
    } catch (e) {
      print('Get user data error: $e');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Get current user
  User? get currentUser => _auth.currentUser;
}