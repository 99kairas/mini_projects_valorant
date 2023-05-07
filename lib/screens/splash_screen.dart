import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mini_projects_valorant/screens/home_screen.dart';
import 'package:mini_projects_valorant/screens/login_screen.dart';
import 'package:mini_projects_valorant/utility/shared_preferences.dart';

import 'theme/font_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkUserLogin() async {
    Timer(const Duration(seconds: 3), () async {
      String cekDataLogin = await getToken();

      if (cekDataLogin.isNotEmpty) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    checkUserLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/splash.png",
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 50,
            // right: 50,
            height: MediaQuery.of(context).size.height * 0.03,
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset("assets/images/logo.png"),
                ),
                const SizedBox(width: 5),
                Text(
                  'RIOT GAMES',
                  style:
                      valorantStyle.copyWith(fontSize: 15, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
