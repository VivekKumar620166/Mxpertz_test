import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'OTPVerification.dart';

class MyEcommerceFirst extends StatefulWidget {
  const MyEcommerceFirst({Key? key}) : super(key: key);

  @override
  State<MyEcommerceFirst> createState() => _MyEcommerceFirstState();
}

class _MyEcommerceFirstState extends State<MyEcommerceFirst> {
  bool isPassVisible = true;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool is_checked = false;
  String _selectedCountryCode = '+91';
  String email = '';
  String password = '';
  String repeatPassword = '';
  String phoneNumber = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final List<Map<String, String>> _countries = [
    {'code': '+91', 'flag': '🇮🇳'}, // India
    {'code': '+1', 'flag': '🇺🇸'},  // USA
    {'code': '+44', 'flag': '🇬🇧'}, // UK
    // Add more country codes and flags as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey, // Assign formkey to the Form widget
          child: Column(
            children: [
              SizedBox(height: 70),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
              SizedBox(height: 12),
              _buildTextField(
                icon: Icons.email,
                hintText: "Email",
                obscureText: false,
                onChanged: (value) => email = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // You can add more complex email validation if needed
                  return null;
                },
              ),
              _buildTextField(
                icon: Icons.lock,
                hintText: "Password",
                obscureText: true,
                onChanged: (value) => password = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  // Add more password validation if needed
                  return null;
                },
              ),
              _buildTextField(
                icon: Icons.lock,
                hintText: "Repeat Password",
                obscureText: true,
                onChanged: (value) => repeatPassword = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please repeat your password';
                  }
                  if (value != password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              _buildPhoneNumberField(),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    // Save email and password to Firebase
                    try {
                      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      // Send OTP to the phone number
                      await _auth.verifyPhoneNumber(
                        phoneNumber: _selectedCountryCode + phoneNumber,
                        verificationCompleted: (PhoneAuthCredential credential) async {
                          await _auth.signInWithCredential(credential);
                        },
                        verificationFailed: (FirebaseAuthException e) {
                          if (e.code == 'invalid-phone-number') {
                            print('The provided phone number is not valid.');
                          }
                        },
                        codeSent: (String verificationId, int? resendToken) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OTPVerification(
                                verificationId: verificationId,
                                phoneNumber: _selectedCountryCode + phoneNumber,
                              ),
                            ),
                          );
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    } on FirebaseAuthException catch (e) {
                      print('Error creating user: $e');
                    }
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 260,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 27),
              RichText(
                text: TextSpan(
                  text: "or Continue With",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  children: [
                    _buildSocialMediaButton(
                      icon: Icons.apple,
                      label: "Apple",
                      iconColor: Colors.black,
                      borderColor: Colors.black,
                    ),
                    SizedBox(width: 20),
                    _buildSocialMediaButton(
                      imageAsset: "assets/images/google.png",
                      label: "Google",
                      borderColor: Colors.black,
                    ),
                    SizedBox(width: 20),
                    _buildSocialMediaButton(
                      icon: Icons.facebook_sharp,
                      label: "Facebook",
                      iconColor: Colors.blue,
                      borderColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required IconData icon,
    required String hintText,
    required bool obscureText,
    required Function(String) onChanged,
    String? Function(String?)? validator, // Added validator parameter
  }) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                obscureText: obscureText,
                onChanged: onChanged,
                validator: validator, // Assigned validator function
                decoration: InputDecoration(
                  suffixIcon: obscureText ? Icon(Icons.remove_red_eye_rounded, color: Colors.grey) : null,
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            DropdownButton<String>(
              value: _selectedCountryCode,
              items: _countries.map((country) {
                return DropdownMenuItem<String>(
                  value: country['code'],
                  child: Row(
                    children: [
                      Text(
                        country['flag']!,
                        style: TextStyle(color: Colors.orange),
                      ),
                      SizedBox(width: 8),
                      Text(
                        country['code']!,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCountryCode = value!;
                });
              },
              style: TextStyle(color: Colors.orange),
              icon: Icon(Icons.arrow_drop_down, color: Colors.orange),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                onChanged: (value) => phoneNumber = value,
                decoration: InputDecoration(
                  hintText: "Mobile Number",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.grey),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  // Add more phone number validation if needed
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialMediaButton({
    IconData? icon,
    String? imageAsset,
    required String label,
    Color? iconColor,
    required Color borderColor,
  }) {
    return Expanded(
      child: Container(
        height: 80,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Column(
          children: [
            SizedBox(height: 5),
            icon != null
                ? Icon(icon, color: iconColor, size: 45)
                : Image.asset(imageAsset!, height: 38),
            SizedBox(height: 1),
            Text(label),
          ],
        ),
      ),
    );
  }
}
