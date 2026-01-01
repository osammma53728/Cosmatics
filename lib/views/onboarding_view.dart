import 'package:cosmetics_app/views/notfications.dart';
import 'package:cosmetics_app/views/search&pick.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;

  final List<String> images = [
    'assets/images/girl.png',
    'assets/images/paint.png'
    
  ];

  final List<String> titles = [
    'WELCOME!',
    'DISCOVER BEAUTY'
    ,
  ];

  final List<String> descriptions = [
    'Makeup has the power to transform your mood and empowers you to be a more confident person.',
    'Find the best cosmetics that match your unique style and personality.',
  ];

  void onNextPressed() {
    if (currentIndex < images.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Notfications(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                  
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  images[currentIndex],
                  width: 260,
                  height: 260,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 40),

              Text(
                titles[currentIndex],
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                descriptions[currentIndex],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 33),

              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: const Color(0xff4A5D73),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: IconButton(
                  onPressed: onNextPressed,
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18,
                  ),
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
