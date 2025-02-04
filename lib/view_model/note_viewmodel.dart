import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:final_project_for_bootcamp/model/note.dart';

class NoteViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Note> notes = [];

  Future<void> fetchNotes(String userId) async {
    try {
      final snapshot = await _firestore.collection('notes').where('userId', isEqualTo: userId).get();
      notes = snapshot.docs.map((doc) {
        return Note(
          noteId: doc.id,
          title: doc['title'],
          content: doc['content'],
        );
      }).toList();
      notifyListeners();
    } catch (e) {
      print('Failed to fetch notes: $e');
    }
  }

  Future<void> addNote({required String userId, required String title, required String content}) async {
    try {
      await _firestore.collection('notes').add({
        'userId': userId,
        'title': title,
        'content': content,
        'createdAt': Timestamp.now(),
      });
      fetchNotes(userId);
    } catch (e) {
      print('Error adding note: $e');
    }
  }

  Future<void> updateNote({required String noteId, required String title, required String content}) async {
    try {
      await _firestore.collection('notes').doc(noteId).update({
        'title': title,
        'content': content,
      });
      notifyListeners();
    } catch (e) {
      print('Error updating note: $e');
    }
  }

  Future<void> deleteNote(String noteId) async {
    try {
      await _firestore.collection('notes').doc(noteId).delete();
      notifyListeners();
    } catch (e) {
      print('Error deleting note: $e');
    }
  }
}
