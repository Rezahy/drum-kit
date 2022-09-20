import 'package:drum_kit/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drum kit',
      theme: Theme.of(context).copyWith(
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontFamily: 'OpenSans'),
          bodyText2: TextStyle(fontFamily: 'OpenSans'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
