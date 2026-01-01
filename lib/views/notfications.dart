import 'package:cosmetics_app/views/loginScreen.dart';
import 'package:flutter/material.dart';

class Notfications extends StatelessWidget {
  const Notfications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [

              const SizedBox(height: 88),

              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  'assets/images/notification.png',
                  width: 260,
                  height: 260,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                "Search & Pick",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.deepPurple
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "We have dedicated set of products and routines and picked for evry skin type",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height:47),

            SizedBox(
              
  width: 244,
  height: 68,
   
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(33),
      ),
    ),
    child: const Text('Let\'s start', style: TextStyle(fontSize: 16,color: Colors.white)),
  ),
),


              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}