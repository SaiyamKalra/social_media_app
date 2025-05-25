import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/authentication/login_or_register.dart';
import 'package:social_media_app/firebase_options.dart';
import 'package:social_media_app/theme/dark_mode.dart';
import 'package:social_media_app/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegisterPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
