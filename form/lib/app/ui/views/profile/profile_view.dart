import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form/app/theme/colors/colors.dart';
import 'package:form/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:form/app/ui/global_widgets/inputs/label_button.dart';
import 'package:form/app/ui/views/home/home_view.dart';

class ProfileView extends StatelessWidget {
  final Map<String, dynamic> data;
  const ProfileView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = data['name'];

    return Scaffold(
      backgroundColor: ColorsApp.terciaryPromoColor,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20.0),
            CircleAvatar(
                backgroundColor: ColorsApp.primaryColor,
                radius: 75,
                child: Text(
                  name[0].toUpperCase(),
                  style: const TextStyle(
                      fontSize: 65, color: ColorsApp.tagBackgroundColor),
                )),
            const SizedBox(height: 10.0),
            Center(
              child: Text(
                data['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(child: Text(data['lastName'])),
            const SizedBox(height: 20.0),
            LabelButton(label: "Nombre", value: data['name']),
            LabelButton(label: "Apellido", value: data['lastName']),
            LabelButton(label: "Tipo documento", value: data['typeDocument']),
            LabelButton(label: "N° documento ", value: data['document']),
            LabelButton(label: "Fecha de nacimiento", value: data['date']),
            LabelButton(label: "Email", value: data['email']),
            LabelButton(label: "N° contacto", value: data['phone']),
            const SizedBox(height: 100),
            LabelButton(
              label: "Cerrar",
              value: "",
              onPressed: () async {
                ProgressDialog.show(context);
                await Future.delayed(const Duration(seconds: 2));
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const HomeView();
                }), (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
