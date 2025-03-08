import 'package:flutter/material.dart';
import 'main_page.dart'; // Import MainPage for navigation
import '../services/auth_services.dart';
import '../pages/auth_pages.dart'; // Ensure correct path


class GetStartedScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  void _signOut(BuildContext context) async {
    await _authService.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AuthPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _signOut(context),
          child: Text("Sign Out"),
        ),
      ),
    );
  }
}

