import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/theme_data.dart';
import 'package:flutter_chat_app/screens/auth_screen.dart';
import 'package:flutter_chat_app/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

// void main() => runApp(MyApp());
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: getMyAppThemeData(context),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData) {
            return ChatScreen();
          }
          return AuthScreen();
        },
      ),
    );
  }
}
