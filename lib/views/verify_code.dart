import 'package:flutter/material.dart';
import '../data/api.dart';

class Verifycode extends StatefulWidget {
  const Verifycode({super.key , required this.phone});
  final String? phone;

  @override
  State<Verifycode> createState() => _VerifycodeState();
}

class _VerifycodeState extends State<Verifycode> {

  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());

  bool isLoading = false;

  String getOtp() {
    return controllers.map((e) => e.text).join();
  }

  Future verifyOtp() async {
    final otp = getOtp();

    if (otp.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter full code")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final response = await ApiService.dio.post(
        "/api/Auth/verify-otp",
        data: {
          "countryCode": "+20",
          "phoneNumber": widget.phone,
          "otpCode": otp
        },
      );

      setState(() => isLoading = false);

      showDialog(
        context: context,
        builder: (_) => const _CustomDialog(),
      );

    } catch (e) {
      setState(() => isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid OTP")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 39),

              SizedBox(
                height: 77,
                width: 77,
                child: Image.asset('assets/images/logo.png'),
              ),

              const SizedBox(height: 33),

              const Text(
                "Verify Code",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              const Text(
                "Enter the 4-digit code",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 33),

              OtpField(controllers: controllers),

              const SizedBox(height: 55),

              isLoading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: 255,
                      height: 66,
                      child: ElevatedButton(
                        onPressed: verifyOtp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 220, 63, 118),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(33),
                          ),
                        ),
                        child: const Text(
                          'Done',
                          style:
                              TextStyle(fontSize: 18, color: Colors.white),
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

class OtpField extends StatelessWidget {
  final List<TextEditingController> controllers;

  const OtpField({super.key, required this.controllers});

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
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              onChanged: (value) {
                if (value.isNotEmpty && index < 3) {
                  FocusScope.of(context).nextFocus();
                }
              },
              decoration: InputDecoration(
                counterText: "",
                hintText: "-",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
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
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/done.png', height: 120),

            const SizedBox(height: 16),

            const Text(
              'Account Activated!',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              'Your account has been successfully activated.',
              textAlign: TextAlign.center,
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
                  backgroundColor:
                      const Color.fromARGB(255, 220, 63, 118),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33),
                  ),
                ),
                child: const Text(
                  'Go to Home',
                  style:
                      TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}