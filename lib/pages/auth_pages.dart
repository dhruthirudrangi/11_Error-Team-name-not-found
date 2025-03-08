import 'package:flutter/material.dart';
import '../services/auth_services.dart'; // Ensure correct path

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthService _authService = AuthService();
  bool _isLoggedIn = false;

  void _signIn() async {
    await _authService.signInAnonymously();
    setState(() {
      _isLoggedIn = true;
    });
  }

  void _signOut() async {
    await _authService.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Anonymous Auth")),
      body: Center(
        child: _isLoggedIn
            ? ElevatedButton(
                onPressed: _signOut,
                child: Text("Sign Out"),
              )
            : ElevatedButton(
                onPressed: _signIn,
                child: Text("Sign in Anonymously"),
              ),
      ),
    );
  }
}
