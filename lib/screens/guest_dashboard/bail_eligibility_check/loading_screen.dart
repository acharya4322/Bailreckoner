import 'package:flutter/material.dart';
import 'dart:math' as math; // For rotation animation
import 'result_screen.dart';
import 'data/dummy_data.dart';

class LoadingScreen extends StatefulWidget {
  final Map<String, String> formData;

  LoadingScreen({required this.formData});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  bool isExistingUser = false;
  Map<String, dynamic>? userData;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat();

    _checkDatabase();
  }

  void _checkDatabase() async {
    await Future.delayed(Duration(seconds: 2));

    for (var record in dummyData) {
      if (record['aadharNumber'] == widget.formData['aadharNumber']) {
        isExistingUser = true;
        userData = record;
        break;
      }
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          isExistingUser: isExistingUser,
          userData: userData,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal.shade700,
              Colors.teal.shade400,
              Colors.teal.shade200,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * math.pi,
                    child: child,
                  );
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.tealAccent],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.search,
                      size: 40,
                      color: Colors.teal.shade900,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Checking Records...',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Please wait a moment.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
