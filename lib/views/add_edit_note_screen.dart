import 'package:final_project_for_bootcamp/view_model/note_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_project_for_bootcamp/model/note.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? note;

  const AddEditNoteScreen({super.key, this.note});

  @override
  _AddEditNoteScreenState createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }
  }

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteViewModel>(context, listen: false);
    final isEditing = widget.note != null;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp6N5f4dDLD2dxNPg0CiffTfAY12Pll5_BEQ&s',
              fit: BoxFit.cover,
            ),
          ),

          // Input Fields
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: "Title"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _contentController,
                  maxLines: 5,
                  decoration: const InputDecoration(labelText: "Content"),
                ),
                const SizedBox(height: 20),

                // Save Button
                ElevatedButton(
                  onPressed: () async {
                    final title = _titleController.text;
                    final content = _contentController.text;

                    if (title.isNotEmpty && content.isNotEmpty) {
                      if (isEditing) {
                        await noteProvider.updateNote(
                          noteId: widget.note!.noteId,
                          title: title,
                          content: content,
                        );
                      } else {
                        await noteProvider.addNote(
                          userId: "userId_placeholder", // Pass actual userId
                          title: title,
                          content: content,
                        );
                      }
                      Navigator.pop(context);
                    }
                  },
                  child: Text(isEditing ? "Update Note" : "Save Note"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
