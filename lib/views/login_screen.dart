import 'package:final_project_for_bootcamp/providers/auth_providers.dart';
import 'package:final_project_for_bootcamp/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.network(
              'data:image/jpeg;base64,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', // Ocean theme
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.4), // Dark overlay for readability
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 10,
                color: Colors.white.withOpacity(0.9),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.lock, size: 60, color: Colors.blueAccent),
                      const SizedBox(height: 10),
                      const Text(
                        'Welcome Back!',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Implement forgot password functionality
                          },
                          child: const Text('Forgot Password?'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () async {
                                setState(() {
                                  _isLoading = true;
                                });
                                try {
                                  await authProvider.signUpWithEmailPassword(
                                    _emailController.text.trim(),
                                    _passwordController.text.trim(),
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (_) =>  const HomeScreen(userId: '',)),
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Login failed: $e')),
                                  );
                                }
                                setState(() {
                                  _isLoading = false;
                                });
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                            ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const SignUpScreen()),
                          );
                        },
                        child: const Text("Don't have an account? Sign up here"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
