import 'package:flutter/material.dart';
import 'package:form/app/theme/colors/colors.dart';
import 'package:intl/intl.dart';

class InputDate extends StatefulWidget {
  const InputDate({Key? key, required this.text, required this.controlador})
      : super(key: key);

  final String text;
  final TextEditingController controlador;
  @override
  _InputDateState createState() => _InputDateState();
}

class _InputDateState extends State<InputDate> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: InputDecorator(
        decoration: InputDecoration(
            labelText: widget.text,
            labelStyle: const TextStyle(color: ColorsApp.tagBackgroundColor),
            contentPadding: const EdgeInsets.fromLTRB(12, 5, 20, 5),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(0.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: getFecha,
                icon: const Icon(Icons.date_range,
                    color: ColorsApp.secondaryPromoColor)),
            RichText(
              textAlign: TextAlign.end,
              text: TextSpan(
                  style: const TextStyle(color: ColorsApp.primaryColor),
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.controlador.text,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorsApp.primaryColor),
                    ),
                  ]),
            )
          ],
        ),
      ),
      onTap: getFecha,
    );
  }

  getFecha() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1920),
            lastDate: DateTime.now())
        .then((value) {
      if (value != null) {
        setState(() {
          widget.controlador.text = DateFormat.yMMMd().format(value);
        });
      }
    });
  }
}
