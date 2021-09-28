import 'package:flutter/material.dart';
import 'theme/colors/colors.dart';
import 'ui/views/splash_screen/splash_screen_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Formulario',
        theme: ThemeData(
            scaffoldBackgroundColor: ColorsApp.tagBackgroundColor,
            primarySwatch: ColorsApp.principalColor),
        home: const SplashScreen());
  }
}
