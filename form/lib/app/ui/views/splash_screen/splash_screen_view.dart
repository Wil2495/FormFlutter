import 'dart:async';
import 'package:flutter/material.dart';
import 'package:form/app/theme/colors/colors.dart';
import 'package:form/app/ui/views/home/home_view.dart';
import 'widgets/initial_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const HomeView();
            })));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const Text(
                "¡Bienvenido!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: ColorsApp.terciaryPromoColor,
                ),
              ),
              const SizedBox(height: 20.0),
              const InitialAnimation(radius: 15.0, dotRadius: 7.0)
            ],
          ),
        ),
      ),
    );
  }
}
