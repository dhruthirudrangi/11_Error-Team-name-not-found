import 'package:flutter/material.dart';
import '../services/auth_services.dart';
import 'get_started.dart'; // Ensure this file exists

class AuthPage extends StatelessWidget {
  final AuthService _authService = AuthService();

  void _signIn(BuildContext context) async {
    await _authService.signInAnonymously();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => GetStartedScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Anonymous Auth")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _signIn(context),
          child: Text("Sign in Anonymously"),
        ),
      ),
    );
  }
}
