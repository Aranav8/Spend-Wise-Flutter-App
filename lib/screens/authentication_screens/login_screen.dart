import 'package:flutter/material.dart';
import 'package:spend_wise/components/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:spend_wise/screens/authentication_screens/registration_screen.dart';
import 'package:spend_wise/screens/home.dart';
import 'package:spend_wise/components/user_text_field.dart';
import 'package:spend_wise/components/signup_buttons.dart';

class LoginPage extends StatelessWidget {
  static String id = 'Login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 250.0,
                  width: 250.0,
                  child: Image(
                    image: AssetImage('images/login.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Welcome Back!',
                  style: kWelcomeHeadingText,
                ),
                SizedBox(
                  height: 30.0,
                ),
                UserTextField(
                  suffixIcon: Icon(Icons.mail),
                  boxColor: Color(0xFFF5F7FC),
                  hintText: 'Enter your email address',
                ),
                UserTextField(
                  suffixIcon: Icon(Icons.remove_red_eye),
                  boxColor: Color(0xFFF5F7FC),
                  hintText: 'Enter your password',
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'or',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignupButtons(
                        buttonIcon: Icon(MdiIcons.google),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      SignupButtons(
                        buttonIcon: Icon(MdiIcons.facebook),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      SignupButtons(
                        buttonIcon: Icon(MdiIcons.apple),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  height: 70.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF1E1D2E),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Home.id);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, RegistrationPage.id);
                      },
                      child: Text(
                        'Sign up now.',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
