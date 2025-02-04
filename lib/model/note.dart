class Note {
  final String noteId;
  final String title;
  final String content;

  // Constructor
  Note({
    required this.noteId,
    required this.title,
    required this.content,
  });

  // Optionally, you can add a method to convert Firestore data to Note object.
  factory Note.fromFirestore(Map<String, dynamic> doc) {
    return Note(
      noteId: doc['noteId'] ?? '',
      title: doc['title'] ?? '',
      content: doc['content'] ?? '',
    );
  }
}
