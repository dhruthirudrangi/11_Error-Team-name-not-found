import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe/pages/picture_screen.dart';
import '../pages/auth_pages.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  void logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AuthPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DISHGUISE"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logout(context),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "DISHGUISE",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Image.asset("assets/small_logo.png", width: 40),
                ],
              ),
              const SizedBox(height: 20),
              buttonWidget(context, "Helplines", Colors.blue, Icons.phone, () {
                showHelplinesPopup(context);
              }),
              const SizedBox(height: 10),
              buttonWidget(context, "Inspiration", Colors.green, Icons.lightbulb, () {}),
              const SizedBox(height: 10),
              buttonWidget(context, "Evidence", Colors.orange, Icons.upload, () {}),
              const SizedBox(height: 10),
              buttonWidget(context, "SOS", Colors.red, Icons.sos, () {}),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.refresh, size: 40, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PictureScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Spacer(),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 5),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Chatbot Coming Soon!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buttonWidget(
  BuildContext context,
  String text,
  Color color,
  IconData icon,
  VoidCallback onTap,
) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      icon: Icon(icon, color: Colors.white),
      label: Text(
        text,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
      onPressed: onTap,
    ),
  );
}

void showHelplinesPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Women Helplines - Bengaluru"),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(leading: Icon(Icons.phone), title: Text("National Helpline: 1091")),
            ListTile(leading: Icon(Icons.phone), title: Text("Karnataka Women Helpline: 181")),
            ListTile(leading: Icon(Icons.phone), title: Text("Police Emergency: 112")),
            ListTile(leading: Icon(Icons.phone), title: Text("NGO Support: 080-23412345")),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      );
    },
  );
}