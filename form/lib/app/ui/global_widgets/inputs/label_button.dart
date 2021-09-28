import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  const LabelButton(
      {Key? key, required this.label, required this.value, this.onPressed})
      : super(key: key);
  final String label, value;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
              const SizedBox(width: 5.0),
              if (onPressed != null)
                const Icon(Icons.chevron_right_rounded,
                    size: 22.0, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }
}
