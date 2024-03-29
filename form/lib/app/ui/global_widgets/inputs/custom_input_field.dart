import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String label;
  final TextInputType? inputype;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CustomInputField(
      {Key? key,
      this.onChanged,
      this.controller,
      required this.label,
      this.inputype,
      this.isPassword = false,
      this.validator})
      : super(key: key);

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: '',
        builder: (state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: widget.controller,
                obscureText: _obscureText,
                keyboardType: widget.inputype,
                onChanged: (text) {
                  if (widget.validator != null) {
                    // ignore: invalid_use_of_protected_member
                    state.setValue(text);
                    state.validate();
                  }
                  if (widget.onChanged != null) {
                    widget.onChanged!(text);
                  }
                },
                decoration: InputDecoration(
                    labelText: widget.label,
                    border: const OutlineInputBorder(),
                    suffixIcon: widget.isPassword
                        ? CupertinoButton(
                            child: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              _obscureText = !_obscureText;
                              setState(() {});
                            })
                        : Container(width: 0)),
              ),
              if (state.hasError)
                Text(
                  state.errorText!,
                  style: const TextStyle(color: Colors.redAccent),
                )
            ],
          );
        });
  }
}
