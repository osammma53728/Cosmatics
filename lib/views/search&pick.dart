import 'package:cosmetics_app/views/notfications.dart';
import 'package:flutter/material.dart';

class SearchAndPickView extends StatelessWidget {
  const SearchAndPickView({super.key});

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
                  onPressed: () {},
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
                  'assets/images/paint.png',
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

              const SizedBox(height:33),

              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: const Color(0xff4A5D73),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: IconButton(
                  onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Notfications()),
                    );
                  },
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