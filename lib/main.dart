import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recipe/firebase_options.dart';
import '../services/auth_services.dart';
import '../pages/get_started.dart'; // Import the main screen after login


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AuthPage(), // The first screen of your app
    );
  }
}



class AuthPage extends StatelessWidget {
  final AuthService _authService = AuthService();

  void _signIn(BuildContext context) async {
    await _authService.signInAnonymously();
    
    // Navigate to GetStartedScreen after successful sign-in
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
