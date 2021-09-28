import 'package:flutter/material.dart';
import 'package:form/app/theme/colors/colors.dart';
import 'package:form/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:form/app/ui/views/register/register_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //--------------Variables-----------------//
  bool _isChecked = false;
  //--------------Variables-----------------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _showTitle(),
              const SizedBox(height: 20.0),
              _showTermsAndConditions(),
              _showButtonCheck(),
              const SizedBox(height: 20.0),
              _showButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _showTitle() {
    return const Text(
      "Términos y condiciones",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: ColorsApp.terciaryPromoColor),
    );
  }

  Widget _showButtonCheck() {
    return CheckboxListTile(
        activeColor: ColorsApp.primaryColor,
        title: const Text(
          "¿Aceptas los terminos?",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: ColorsApp.terciaryPromoColor),
        ),
        value: _isChecked,
        onChanged: (bool? value) {
          setState(() {
            _isChecked = value!;
          });
        });
  }

  Widget _showTermsAndConditions() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          style: TextStyle(color: Colors.black),
          children: <TextSpan>[
            TextSpan(text: "Para realizar tu Registro, debes aceptar los "),
            TextSpan(
              text: "términos de uso ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
                text:
                    "y el procesamiento , tratamiento y transferencia de tus datos personales conforme a lo dispuesto en las "),
            TextSpan(
              text: "Politicas de Privacidad.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ]),
    );
  }

  Widget _showButton() {
    return ElevatedButton(
        onPressed: _isChecked == true
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return RegisterView();
                  }),
                );
              }
            : null,
        child: const Text('Continuar'));
  }
}
