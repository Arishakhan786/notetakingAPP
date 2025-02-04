import 'package:final_project_for_bootcamp/firebase_options.dart';
import 'package:final_project_for_bootcamp/providers/auth_providers.dart';
import 'package:final_project_for_bootcamp/providers/auth_wrapper.dart';
import 'package:final_project_for_bootcamp/view_model/note_viewmodel.dart'; // Import NoteViewModel
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => NoteViewModel()), // Add NoteViewModel here
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthWrapper(), // Manages login and home navigation
      ),
    );
  }
}
