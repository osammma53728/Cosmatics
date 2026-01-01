import 'package:cosmetics_app/views/login_view.dart';
import 'package:cosmetics_app/views/regiter.dart';
import 'package:flutter/material.dart';

class Creatpassword extends StatelessWidget {
  const Creatpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 39),
              Container(
                height: 77,
                width: 77,
                child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
              ),
              const SizedBox(height: 33),
              const Text(
                "Create New Password",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                "Your new password must be different\n from previous used passwords.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 33),
               PasswordField(labelText: 'New Password', hintText: 'New Password',),
              const SizedBox(height: 16),
               PasswordField(labelText: 'Confirm Password', hintText: 'Confirm Password',),
              const SizedBox(height: 55),
              SizedBox(
                width: 255,
                height: 66,
                child: ElevatedButton(
                  onPressed: () {
                       showDialog(
                      context: context,
                      barrierDismissible: true, 
                      builder: (context) {
                        return const _CustomDialog();
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 220, 63, 118),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class _CustomDialog extends StatelessWidget {
  const _CustomDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/done.png', height: 120),
            const SizedBox(height: 16),
            const Text(
              'Password Created!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'congratulations! Your password\n has been successfully created.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 255,
              height: 66,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:  (context) => const LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 220, 63, 118),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33),
                  ),
                ),
                child: const Text(
                  'Return to Login',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}