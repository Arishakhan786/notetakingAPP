import 'package:final_project_for_bootcamp/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();

  // Get current user
  User? get user => _firebaseService.getCurrentUser();

  // Sign up method
  Future<void> signUp(String email, String password) async {
    try {
      await _firebaseService.signUp(email, password);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // Log in method
  Future<void> logIn(String email, String password) async {
    try {
      await _firebaseService.logIn(email, password);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // Log out method
  Future<void> logOut() async {
    try {
      await _firebaseService.logOut();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  signUpWithEmailPassword(String text, String text2) {}
}
