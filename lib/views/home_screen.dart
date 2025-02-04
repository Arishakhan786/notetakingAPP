import 'package:final_project_for_bootcamp/providers/auth_providers.dart';
import 'package:final_project_for_bootcamp/view_model/note_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_project_for_bootcamp/views/add_edit_note_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userId;
  const HomeScreen({super.key, required this.userId});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<NoteViewModel>(context, listen: false).fetchNotes(widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteViewModel>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh5J2uSeB2l8-WGsAJr0j5vt5hMGUh1fPmkA&s',
              fit: BoxFit.cover,
            ),
          ),

          // Notes List
          Column(
            children: [
              Expanded(
                child: noteProvider.notes.isEmpty
                    ? const Center(child: Text("No notes found"))
                    : ListView.builder(
                        itemCount: noteProvider.notes.length,
                        itemBuilder: (context, index) {
                          final note = noteProvider.notes[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            child: ListTile(
                              title: Text(note.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text(note.content),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddEditNoteScreen(note: note),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.red),
                                    onPressed: () => noteProvider.deleteNote(note.noteId),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),

              // Buttons Section
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AddEditNoteScreen()),
                        );
                      },
                      child: const Text("Write what you think"),
                    ),

                    const SizedBox(height: 10),

                    // Logout Button
                    OutlinedButton.icon(
                      onPressed: () => authProvider.logout(context),
                      icon: const Icon(Icons.logout, color: Colors.red),
                      label: const Text("Logout", style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
