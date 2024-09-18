import 'package:e_learning/category_view.dart';
import 'package:e_learning/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:sign_in_button/sign_in_button.dart';

class MyRegisterOrLogin extends StatelessWidget {
  const MyRegisterOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/start1.png',
                    height: 300, // Set a height for the image
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 40),
                  const SizedBox(height: 40),
                  // Register Button
                  SizedBox(
                    height: 55,
                    width: 310,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to registration screen
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 23, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Login Button
                  SizedBox(
                    height: 55,
                    width: 310,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const CategoryView())
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 25, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Help Text
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Facing problem in Signing in?",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black)),
                          TextSpan(
                              text: " Call Us",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red)),
                          // TextSpan(
                          //     text: "s",
                          //     style: TextStyle(
                          //         fontSize: 16,
                          //         color: Colors.pinkAccent)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Follow us on",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInButton(
                          Buttons.facebook,
                          mini: true,
                          onPressed: () {},
                        ),
                        SignInButton(
                          Buttons.linkedIn,
                          mini: true,
                          onPressed: () {},
                        ),
                        SignInButton(
                          Buttons.twitter,
                          mini: true,
                          onPressed: () {},
                        ),
                        SignInButton(
                          Buttons.apple,
                          mini: true,
                          onPressed: () {},
                        ),
                        SignInButton(
                          Buttons.email,
                          mini: true,
                          onPressed: () {},
                        ),
                        SignInButton(
                          Buttons.reddit,
                          mini: true,
                          onPressed: () {},
                        ),


                      ],
                    )
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
