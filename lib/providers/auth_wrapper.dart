import 'package:final_project_for_bootcamp/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_project_for_bootcamp/views/home_screen.dart';
import 'package:final_project_for_bootcamp/views/login_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    final user = authProvider.currentUser;

    return user != null ? HomeScreen(userId: user.uid) : const LoginScreen();
  }
}
