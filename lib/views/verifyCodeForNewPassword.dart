import 'package:cosmetics_app/views/creatPassword.dart';
import 'package:flutter/material.dart';

class Verifycodefornewpassword extends StatelessWidget {
  const Verifycodefornewpassword({super.key});


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
              SizedBox(height: 33),
              const Text(
                "Verify Code",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                  children: const [
                    TextSpan(
                      text: 'We just sent a 4-digit verification code to\n',
                    ),
                    TextSpan(
                      text: '+20112345678',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, 
                      ),
                    ),
                    TextSpan(
                      text: '. Enter the code in the box\nbelow to continue.',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 33),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Edit the number',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              ),
              SizedBox(height: 24),
              const OtpField(),
              SizedBox(height: 55),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      'Didn\'t receive the code? ',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),

                    Text(
                      ' Resend',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 55),
              SizedBox(
                width: 255,
                height: 66,
                child: ElevatedButton(
                  onPressed: () {
  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Creatpassword()),
                    );},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 220, 63, 118),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpField extends StatefulWidget {
  const OtpField({super.key});

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: SizedBox(
            width: 55,
            height: 55,
            child: TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              onChanged: (value) {
                if (value.isNotEmpty && index < 3) {
                  focusNodes[index + 1].requestFocus();
                } else if (value.isEmpty && index > 0) {
                  focusNodes[index - 1].requestFocus();
                }
                setState(() {});
              },
              decoration: InputDecoration(
                counterText: "",
                hintText: "-",
                hintStyle: const TextStyle(fontSize: 24, color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: controllers[index].text.isEmpty
                        ? Colors.grey
                        : Colors.red,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
        );
      }),
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
              'Account Activated!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'congratulations! Your account\n has been successfully activated.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 255,
              height: 66,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 220, 63, 118),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33),
                  ),
                ),
                child: const Text(
                  'Go to Home',
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
