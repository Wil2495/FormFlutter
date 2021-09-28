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

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final keyForm = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final docController = TextEditingController();
  final typeDocController = TextEditingController();
  final dateController =
      TextEditingController(text: DateFormat.yMMMd().format(DateTime.now()));
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsApp.terciaryPromoColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: keyForm,
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
                  _showPhoneNumber(),
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

  Widget _showTitle() {
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
      controller: nameController,
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
      controller: lastNameController,
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

    return InputFormSelect(
      controladorText: typeDocController,
      itemsDoc: _itemsDoc,
      labelText: "Tipo Documento",
    );
  }

  Widget _showDocument() {
    return CustomInputField(
      label: "Número documento",
      controller: docController,
      inputype: TextInputType.number,
      validator: (text) {
        if (text!.isNotEmpty) {
          return null;
        }
        return "número invalido";
      },
    );
  }

  Widget _showPhoneNumber() {
    return CustomInputField(
      label: "Número celular",
      controller: phoneNumberController,
      inputype: TextInputType.number,
      validator: (text) {
        if (text!.isNotEmpty) {
          if (text.trim().length <= 10) return null;
        }

        return "número invalido";
      },
    );
  }

  Widget _showEmail() {
    return CustomInputField(
      label: "Correo",
      controller: emailController,
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
      controlador: dateController,
      text: 'Seleccione fecha de nacimiento',
    );
  }

  Widget _showPassword() {
    return CustomInputField(
      label: "Contraseña",
      controller: passwordController,
      isPassword: true,
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
          if (keyForm.currentState!.validate()) setInfo(context);
        },
        child: const Text('Enviar'));
  }

  Future setInfo(context) async {
    Map<String, dynamic> jsonBody = {
      'name': nameController.text,
      'lastName': lastNameController.text,
      'typeDocument': typeDocController.text,
      'document': docController.text,
      'email': emailController.text,
      'phone': phoneNumberController.text,
      'date': dateController.text,
    };
    /*  print("//*****************ESTE ES EL MAP**************// \n");
    print(jsonBody);
    print("//*****************ESTE ES EL MAP**************// \n"); */
    ProgressDialog.show(context);
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return ProfileView(
        data: jsonBody,
      );
    }), (route) => false);
  }
}
