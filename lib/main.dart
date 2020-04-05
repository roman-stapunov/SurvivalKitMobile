import 'package:flutter/material.dart';
import 'package:survival_kit/screens/home_screen.dart';
import 'package:survival_kit/screens/login_screen.dart';
import 'package:survival_kit/screens/registration_screen.dart';
import 'package:survival_kit/screens/services_screen.dart';

main() {
  runApp(SurvivalKitApp());
}

class SurvivalKitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/': (_) => LoginSrceen(),
        '/reg': (_) => RegistrationSrceen(),
        '/home': (_) => HomeScreen(),
        '/services': (_) => ServicesScreen(),
      },
    );
  }
}
