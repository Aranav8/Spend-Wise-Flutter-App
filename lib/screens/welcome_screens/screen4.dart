import 'package:flutter/material.dart';
import 'package:spend_wise/components/constants.dart';
import 'package:spend_wise/components/segmented_control.dart';
import 'package:spend_wise/components/custom_buttons.dart';
import 'package:spend_wise/screens/authentication_screens/login_screen.dart';
import 'package:spend_wise/screens/authentication_screens/registration_screen.dart';
import 'package:spend_wise/screens/welcome_screens/screen3.dart';

class WelcomeScreen4 extends StatelessWidget {
  static String id = 'WelcomeScreen4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Image(
                image: AssetImage('images/screen4.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Analyze, Adjust, and Enhance',
                textAlign: TextAlign.center,
                style: kWelcomeHeadingText,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            GestureDetector(
              onHorizontalDragUpdate: (details) {
                int sensitivity = 8;
                if (details.delta.dx > sensitivity) {
                  Navigator.pushReplacementNamed(context, WelcomeScreen3.id);
                  // Right Swipe
                } else if (details.delta.dx < -sensitivity) {
                  //Left Swipe
                }
              },
              child: Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                child: Container(
                  height: 250.0,
                  decoration: kBottomContainer,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: SegmentedControl(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 40.0),
                        child: Text(
                          "Analyze detailed analytics to identify trends and areas for improvement. Adjust your budget with real data for smarter financial decisions.",
                          textAlign: TextAlign.center,
                          style: kWelcomeText,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 15.0),
                            child: CustomButton(
                              text: 'Sign up',
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.white.withOpacity(0.3),
                              ),
                              textColor: Colors.white,
                              destination: RegistrationPage.id,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 20.0),
                            child: CustomButton(
                              text: 'Log in',
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.white,
                              ),
                              textColor: Color(0xFF1E1D2E),
                              destination: LoginPage.id,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
