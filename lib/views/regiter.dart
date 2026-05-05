import 'package:cosmetics_app/data/auth.dart';
import 'package:cosmetics_app/views/verify_code.dart';
import 'package:flutter/material.dart';

class RegiterScreen extends StatelessWidget {
   RegiterScreen({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


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
              const SizedBox(height: 9),
              const Text(
                'Create Account',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 18),
              TextField(
                controller: _nameController, 
                decoration: InputDecoration(
                  labelText: 'Your Name',

                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: '',

                  filled: true,
                  fillColor: Colors.white,

                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.2,
                    ),
                  ),

                  labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),

                  hintStyle: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  
                  labelText: 'email',
                  

                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: '',

                  filled: true,
                  fillColor: Colors.white,

                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.2,
                    ),
                  ),

                  labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),

                  hintStyle: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CountryCodeBox(),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Phone Number',

                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: '',

                        filled: true,
                        fillColor: Colors.white,

                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1.2,
                          ),
                        ),

                        labelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),

                        hintStyle: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 9),
               PasswordField( hintText: 'Create your Password', labelText: '',),
              const SizedBox(height: 9),
              PasswordField( hintText: 'Confirm your Password', labelText: '',),
              const SizedBox(height: 9),
              SizedBox(
                width: 255,
                height: 66,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                  var w= await AuthService.register(
                      _nameController.text,
                      _emailController.text,
                      _phoneController.text,
                      _passwordController.text
                    );
                    showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: Text("Title"),
      content: Text(w.toString()),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // يقفل الدايلوج
          },
          child: Text("OK"),
        ),
      ],
    );
  },
);
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Error"),
                            content: Text(e.toString()),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // يقفل الدايلوج
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Verifycode( phone: "1234567890",),
                      ),
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
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              

            ],
          ),
        ),
      ),
    );
  }
}

class CountryCodeBox extends StatefulWidget {
  const CountryCodeBox({super.key});

  @override
  State<CountryCodeBox> createState() => _CountryCodeBoxState();
}

class _CountryCodeBoxState extends State<CountryCodeBox> {
  String selectedCode = "+20";

  final List<String> countryCodes = [
    "+20", // Egypt
    "+1", // USA
    "+44", // UK
    "+49", // Germany
    "+33", // France
    "+39", // Italy
    "+91", // India
    "+81", // Japan
    "+966", // Saudi
    "+971", // UAE
  ];

  void openCountryPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return ListView.builder(
          itemCount: countryCodes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                countryCodes[index],
                style: const TextStyle(fontSize: 18),
              ),
              onTap: () {
                setState(() {
                  selectedCode = countryCodes[index];
                });
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: openCountryPicker,
      child: Container(
        height: 55,
        width: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: Text(
          selectedCode,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  String? hintText;

  PasswordField({super.key, required this.hintText, required String labelText});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isHidden,
      decoration: InputDecoration(
        hintText: widget.hintText ?? 'Password',
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        suffixIcon: IconButton(
          icon: Icon(isHidden ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              isHidden = !isHidden;
            });
          },
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
