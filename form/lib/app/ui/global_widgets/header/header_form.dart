import 'package:flutter/material.dart';
import 'package:form/app/theme/colors/colors.dart';

// ignore: use_key_in_widget_constructors
class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("¿Estás seguro que deseas salir.?",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: ColorsApp.primaryColor)),
                  content: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Icon(Icons.cancel),
                                const SizedBox(width: 5.0),
                                const Text("Cancelar"),
                              ],
                            ),
                            onTap: () => Navigator.pop(context)),
                        GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text("Aceptar"),
                                const SizedBox(width: 5.0),
                                const Icon(Icons.check_box),
                              ],
                            ),
                            onTap: () => {
                                  Navigator.pop(context),
                                  Navigator.pop(context)
                                })
                      ],
                    ),
                  ),
                );
              }),
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: ColorsApp.tagBackgroundColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}
