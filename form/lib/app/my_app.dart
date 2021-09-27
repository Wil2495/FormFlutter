import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulario',
      theme: ThemeData(
          //    scaffoldBackgroundColor: ColorsApp.colorFondo,
          /* primarySwatch: ColorsApp.colorPrincipalApp*/),
      home: Text("home"),
    );
  }
}
