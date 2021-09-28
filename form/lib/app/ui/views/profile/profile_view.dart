import 'package:flutter/material.dart';
import 'package:form/app/theme/colors/colors.dart';
import 'package:form/app/ui/views/home/home_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Informacion enviada",
              style: TextStyle(
                  color: ColorsApp.terciaryPromoColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            _showButton(context),
          ],
        ),
      ),
    );
  }

  Widget _showButton(context) {
    return ElevatedButton(
        onPressed: () async {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (BuildContext context) {
              return const HomeView();
            }),
          );
        },
        child: const Text('Enviar'));
  }
}
