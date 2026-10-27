import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home_page.dart';
import 'screens/add_horse_page.dart';
import 'screens/view_horses_page.dart';
import 'firebase_options.dart';
import 'screens/login_page.dart';

void main() async {
  // Required to initialize Firebase before the app runs
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  runApp(const HorseCatalogueApp());
}

class HorseCatalogueApp extends StatelessWidget {
  const HorseCatalogueApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horse Catalogue',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      // This maps the string paths to your actual screen files
      initialRoute: '/',
      routes: {
        '/': (context) => const Homepage(),
        '/login': (context) => const LoginScreen(),
        '/add-horse': (context) => const AddHorseScreen(),
        '/view-horses': (context) => const ViewHorsesScreen(),
      },
    );
  }
}