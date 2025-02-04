import 'package:final_project_for_bootcamp/views/add_edit_note_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_project_for_bootcamp/view_model/note_viewmodel.dart'; // Import your NoteViewModel

class NoteViewModelProvider extends StatelessWidget {
  final Widget child;

  const NoteViewModelProvider({super.key, required this.child, required AddEditNoteScreen Function(dynamic context, dynamic child) builder});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteViewModel(),
      child: child,
    );
  }
}
