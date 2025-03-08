import 'package:flutter/material.dart';
import '../services/auth_services.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signup / Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 10),
            Text(errorMessage, style: const TextStyle(color: Colors.red)), // Show Error Message

            ElevatedButton(
              onPressed: () async {
                String? error = await _authService.signUp(emailController.text, passwordController.text);
                if (error == null) {
                  Navigator.pushReplacementNamed(context, "/main");
                } else {
                  setState(() => errorMessage = error); // Show actual Firebase error
                }
              },
              child: const Text("Signup"),
            ),

            ElevatedButton(
              onPressed: () async {
                String? error = await _authService.signIn(emailController.text, passwordController.text);
                if (error == null) {
                  Navigator.pushReplacementNamed(context, "/main");
                } else {
                  setState(() => errorMessage = error); // Show actual Firebase error
                }
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
