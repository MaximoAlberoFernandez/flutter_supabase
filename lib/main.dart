import 'package:flutter/material.dart';
import 'package:flutter_supabase/screens/Splash_Screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_supabase/screens/Login_Screen.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ujvlubotquniivdbsoxo.supabase.co',
    anonKey: 
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVqdmx1Ym90cXVuaWl2ZGJzb3hvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ0ODE3NzMsImV4cCI6MjAyMDA1Nzc3M30.3W1xbTkTWEiCTb8OrhiTlc2m0kYw2Ik_COv0l90SA90', 
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cities',
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: Colours.scaffoldBgColor,
      //   useMaterial3: true,
      // ),
      // home: LoginScreen(),
      home: SplashScreen(),
    );
  }
}