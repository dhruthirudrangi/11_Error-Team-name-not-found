import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../pages/auth_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class UserAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dishguise',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const GetStartedScreen(),
    );
  }
}

// ✅ Initial "Get Started" Page
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PictureScreen()));
            },
            child: const Text("Get Started", style: TextStyle(fontSize: 18, color: Colors.purple)),
          ),
        ),
      ),
    );
  }
}

// ✅ First Screen: Zoomed-Out Image with Bottom Navigation
class PictureScreen extends StatefulWidget {
  const PictureScreen({super.key});

  @override
  _PictureScreenState createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {
  int homeTapCount = 0;

  void _onHomePressed() {
    setState(() {
      homeTapCount++;
      if (homeTapCount == 3) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage()));
        homeTapCount = 0; // Reset count after navigation
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ✅ Zoomed Out Image (using BoxFit.contain)
          Positioned.fill(
            child: Image.asset("assets/stealth_image.png", fit: BoxFit.contain),
          ),

          // ✅ Bottom Navigation Bar
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home, color: Colors.white, size: 30),
                    onPressed: _onHomePressed,
                  ),
                  IconButton(
                    icon: const Icon(Icons.folder, color: Colors.white, size: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.star, color: Colors.white, size: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.history, color: Colors.white, size: 30),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ Main Page (Purple Gradient, Reverse Button & Chatbot)
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Image.asset("assets/small_logo.png", width: 40), // Small Logo beside Title
                ],
              ),
              const SizedBox(height: 20),
              buttonWidget(context, "Helplines", Colors.blue, Icons.phone, () {
                showHelplinesPopup(context);
              }),
              const SizedBox(height: 10),
              buttonWidget(context, "Inspiration", Colors.green, Icons.lightbulb, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage()));
              }),
              const SizedBox(height: 10),
              buttonWidget(context, "Evidence", Colors.orange, Icons.upload, () {}),
              const SizedBox(height: 10),
              buttonWidget(context, "SOS", Colors.red, Icons.sos, () {}),
              const SizedBox(height: 10),

              // ✅ Stealth Mode Circular Button (Reverse Button)
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.refresh, size: 40, color: Colors.white),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PictureScreen()));
                  },
                ),
              ),

              const Spacer(),

              // ✅ Chatbot Section
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
                ),
                child: const Center(
                  child: Text("Chatbot Coming Soon!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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

// ✅ Button Widget
Widget buttonWidget(BuildContext context, String text, Color color, IconData icon, VoidCallback onTap) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      icon: Icon(icon, color: Colors.white),
      label: Text(text, style: const TextStyle(fontSize: 18, color: Colors.white)),
      onPressed: onTap,
    ),
  );
}

// ✅ Helplines Popup
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
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Close")),
        ],
      );
    },
  );
}

// ✅ Blank Page for Inspiration
class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inspiration")),
      body: const Center(child: Text("Content will be added soon", style: TextStyle(fontSize: 20))),
    );
  }
}
