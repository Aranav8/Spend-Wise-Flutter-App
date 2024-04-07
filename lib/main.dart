import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spend_wise/screens/authentication_screens/login_screen.dart';
import 'package:spend_wise/screens/authentication_screens/registration_screen.dart';
import 'package:spend_wise/screens/expense_screen.dart';
import 'package:spend_wise/screens/home.dart';
import 'package:spend_wise/screens/welcome_screens/screen2.dart';
import 'package:spend_wise/screens/welcome_screens/screen3.dart';
import 'package:spend_wise/screens/welcome_screens/screen4.dart';
import 'screens/welcome_screens/screen1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spend_wise/components/limit_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyADEYfhrc6LFjJmnFU2yH3c108m_7D8vo0",
      appId: "1:602842447453:android:093052e9d51dd6b7e917b4",
      messagingSenderId: "602842447453",
      projectId: "spend-wise-d0150",
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => LimitProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen1.id,
      routes: {
        WelcomeScreen1.id: (context) => WelcomeScreen1(),
        WelcomeScreen2.id: (context) => WelcomeScreen2(),
        WelcomeScreen3.id: (context) => WelcomeScreen3(),
        WelcomeScreen4.id: (context) => WelcomeScreen4(),
        RegistrationPage.id: (context) => RegistrationPage(),
        LoginPage.id: (context) => LoginPage(),
        Home.id: (context) => Home(),
        ExpenseScreen.id: (context) => ExpenseScreen(),
      },
    );
  }
}
