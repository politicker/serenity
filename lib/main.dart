import 'package:flutter/material.dart';
import 'package:serenity/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'components/bottom_navigation.dart';
import 'constants.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: Config.supabaseURL,
    anonKey: Config.supabaseAnonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serenity',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
        ),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => const BottomNavigation(),
        '/login': (_) => const LoginPage(),
      },
    );
  }
}
