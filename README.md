# final_project_for_bootcamp

A simple and efficient note-taking app built with Flutter. The app integrates Firebase Authentication and Firestore for secure user authentication and cloud-based storage of notes.

Features

User Authentication: Sign up and log in with Firebase Authentication.

Create Notes: Users can add new notes with text content.

Edit & Delete Notes: Modify or remove existing notes.

Cloud Storage: All notes are stored in Firestore, ensuring access across devices.

State Management: Uses Provider for managing app state efficiently.

Tech Stack
Flutter (Dart 3.0)

Firebase (Authentication & Firestore)

Provider (State Management)

Folder Structure
lib/
|-- main.dart
|-- models/
|   |-- note_model.dart
|-- providers/
|   |-- auth_provider.dart
|   |-- notes_provider.dart
|-- screens/
|   |-- home_screen.dart
|   |-- login_screen.dart
|   |-- note_editor_screen.dart
|-- widgets/
|   |-- note_card.dart

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
