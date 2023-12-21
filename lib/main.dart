import 'package:bahasaku/firebase_options.dart';
import 'package:bahasaku/src/provider/current_test.dart';
import 'package:bahasaku/src/provider/current_user.dart';
import 'package:bahasaku/src/views/start_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CurrentTest()),
        ChangeNotifierProvider(create: (context) => CurrentUser()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Lexend'),
        home: const SplashScreen(),
      ),
    );
  }
}
