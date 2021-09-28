import 'package:flutter/material.dart';
import 'package:form/app/theme/colors/colors.dart';

import 'package:select_form_field/select_form_field.dart';

class InputFormSelect extends StatelessWidget {
  const InputFormSelect(
      {Key? key,
      required List<Map<String, dynamic>> itemsDoc,
      required this.controladorText,
      required this.labelText})
      : _itemsDoc = itemsDoc,
        super(key: key);

  final List<Map<String, dynamic>> _itemsDoc;
  final TextEditingController controladorText;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: ColorsApp.tagBackgroundColor),
          contentPadding: const EdgeInsets.fromLTRB(12, 5, 20, 5),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0))),
      child: SelectFormField(
        type: SelectFormFieldType.dialog,
        enableSearch: true,
        changeIcon: true,
        icon: const Icon(
          Icons.arrow_downward_outlined,
          color: ColorsApp.primaryColor,
        ),
        dialogCancelBtn: 'Cancelar',
        dialogSearchHint: 'Buscar...',
        items: _itemsDoc,
        onChanged: (val) {
          controladorText.text = val;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Llenar este campo';
          }
        },
      ),
    );
  }
}
