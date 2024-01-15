import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_supabase/screens/Login_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => LoginScreen(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.black],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: const Column(children: [
          SizedBox(height: 20),
          Icon(Icons.edit, size: 80, color: Colors.white),
          SizedBox(height: 20),
          Text('Flutter Supabase Cities',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ))
        ]),
      ),
    );
  }
}
