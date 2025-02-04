import 'package:final_project_for_bootcamp/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
  // Import generated Firebase options

class FirebaseService {
  // FirebaseAuth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Initialize Firebase (this is for non-web platforms, use FirebaseOptions for Web)
  Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,  // For web, if needed
    );
  }

  // Authentication methods

  // Sign up method
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Sign up error: $e");
      rethrow;
    }
  }

  // Log in method
  Future<User?> logIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Login error: $e");
      rethrow;
    }
  }

  // Log out method
  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Logout error: $e");
      rethrow;
    }
  }

  // Note-related methods

  // Fetch notes for the logged-in user
  Stream<List<Map<String, dynamic>>> getNotes(String userId) {
    return _firestore
        .collection('notes')
        .where('userId', isEqualTo: userId) // Fetch only user-specific notes
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return {
          'noteId': doc.id,
          'title': doc['title'],
          'content': doc['content'],
          'createdAt': doc['createdAt'],
        };
      }).toList();
    });
  }

  // Add a new note
  Future<void> addNote({
    required String userId,
    required String title,
    required String content,
  }) async {
    try {
      await _firestore.collection('notes').add({
        'title': title,
        'content': content,
        'userId': userId,
        'createdAt': Timestamp.now(),
      });
    } catch (e) {
      print("Add note error: $e");
      rethrow;
    }
  }

  // Update an existing note
  Future<void> updateNote({
    required String noteId,
    required String title,
    required String content,
  }) async {
    try {
      await _firestore.collection('notes').doc(noteId).update({
        'title': title,
        'content': content,
        'createdAt': Timestamp.now(),
      });
    } catch (e) {
      print("Update note error: $e");
      rethrow;
    }
  }

  // Delete a note
  Future<void> deleteNote(String noteId) async {
    try {
      await _firestore.collection('notes').doc(noteId).delete();
    } catch (e) {
      print("Delete note error: $e");
      rethrow;
    }
  }

  getCurrentUser() {}
}
