import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form/app/theme/colors/colors.dart';
import 'package:form/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:form/app/ui/global_widgets/header/header_form.dart';
import 'package:form/app/ui/global_widgets/inputs/custom_input_field.dart';
import 'package:form/app/ui/global_widgets/inputs/input_date.dart';
import 'package:form/app/ui/global_widgets/inputs/input_form_select.dart';
import 'package:form/app/ui/views/profile/profile_view.dart';
import 'package:form/app/utils/email_validator.dart';
import 'package:form/app/utils/name_validator.dart';
import 'package:intl/intl.dart';

class FormView extends StatelessWidget {
  FormView({Key? key}) : super(key: key);
  final keyFormulario = GlobalKey<FormState>();
  final nombreControlador = TextEditingController();
  final apellidoControlador = TextEditingController();
  final correoControlador = TextEditingController();
  final celularControlador = TextEditingController();
  final documentoControlador = TextEditingController();
  final tipodocControlador = TextEditingController();
  final fechaControlador =
      TextEditingController(text: DateFormat.yMMMd().format(DateTime.now()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsApp.terciaryPromoColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: keyFormulario,
              child: ListView(
                children: [
                  Header(),
                  const SizedBox(height: 20.0),
                  _showTitle(),
                  const SizedBox(height: 10.0),
                  _showName(),
                  const SizedBox(height: 10.0),
                  _showLastName(),
                  const SizedBox(height: 10.0),
                  _showTypeDocument(),
                  const SizedBox(height: 10.0),
                  _showDocument(),
                  const SizedBox(height: 10.0),
                  _showDate(),
                  const SizedBox(height: 10.0),
                  _showEmail(),
                  const SizedBox(height: 10.0),
                  _showPassword(),
                  const SizedBox(height: 20.0),
                  _showButton(context),
                ],
              ),
            ),
          ),
        ));
  }

  _showTitle() {
    return const Text(
      "Registro",
      style: TextStyle(
          color: ColorsApp.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 20.0),
    );
  }

  Widget _showName() {
    return CustomInputField(
      //  onChanged: nombreControlador.text,
      label: "Nombre",
      inputype: TextInputType.emailAddress,
      validator: (text) {
        if (isValidName(text)) {
          return null;
        }
        return "nombre invalido";
      },
    );
  }

  Widget _showLastName() {
    return CustomInputField(
      label: "Apellido",
      inputype: TextInputType.emailAddress,
      validator: (text) {
        if (isValidName(text)) {
          return null;
        }
        return "apellido invalido";
      },
    );
  }

  Widget _showTypeDocument() {
    List<Map<String, dynamic>> _itemsDoc = [
      {
        'value': 'RC',
        'label': 'Registro Civil',
        'icon': const Icon(Icons.perm_identity),
      },
      {
        'value': 'TI',
        'label': 'Tarjeta de identidad',
        'icon': const Icon(Icons.loop_sharp),
      },
      {
        'value': 'CC',
        'label': 'Cédula de ciudadanía',
        'icon': const Icon(Icons.access_alarms),
      }
    ];
    final TextEditingController _documentType = TextEditingController();
    return InputFormSelect(
      controladorText: _documentType,
      itemsDoc: _itemsDoc,
      labelText: "Tipo Documento",
    );
  }

  Widget _showDocument() {
    return CustomInputField(
      label: "Número documento",
      //onChanged: controller.onEmailChange,
      inputype: TextInputType.number,
      validator: (text) {
        if (!text!.isEmpty) {
          return null;
        }
        return "número invalido";
      },
    );
  }

  Widget _showEmail() {
    return CustomInputField(
      label: "Correo",
      //onChanged: controller.onEmailChange,
      inputype: TextInputType.emailAddress,
      validator: (text) {
        if (isValidEmail(text)) {
          return null;
        }
        return "Correo invalido";
      },
    );
  }

  Widget _showDate() {
    return InputDate(
      controlador: fechaControlador,
      text: 'Seleccione fecha de nacimiento',
    );
  }

  Widget _showPassword() {
    return CustomInputField(
      label: "Contraseña",
      isPassword: true,
      //  onChanged: controller.onPasswordChange,
      validator: (text) {
        if (text!.trim().length >= 6) {
          return null;
        }
        return "contraseña invalida";
      },
    );
  }

  Widget _showButton(context) {
    return ElevatedButton(
        onPressed: () async {
          if (keyFormulario.currentState!.validate()) setInfo(context);
        },
        child: const Text('Enviar'));
  }

  Future setInfo(context) async {
    var jsonBody = {};
    jsonBody["Nombre"] = nombreControlador.text;
    jsonBody["Apellido"] = apellidoControlador.text;
    jsonBody["Tipo_Documento"] = tipodocControlador.text;
    jsonBody["Documento"] = documentoControlador.text;
    jsonBody["Correo"] = correoControlador.text;
    jsonBody["Celular"] = celularControlador.text;
    jsonBody["Fecha"] = fechaControlador.text;
    String str = json.encode(jsonBody);
    print("//*****************ESTE ES EL JSON**************// \n");
    print(str);
    print("//*****************ESTE ES EL JSON**************// \n");
    ProgressDialog.show(context);
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return const ProfileView();
      }),
    );

    /*final response =
        await http.post(Uri.http("https://plm.com.co", "/test"), body: {
      "nombre": nombreControlador.text,
      "apellido": apellidoControlador.text,
      "Tipo_doc": tipodocControlador.text,
      "documento": documentoControlador.text,
      "correo": correoControlador.text,
      "celular": celularControlador.text,
      "fecha": fechaInput,
    })*/
  }
}
