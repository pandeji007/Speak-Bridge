// lib/ui/widgets/translate_button.dart
import 'package:flutter/material.dart';

class TranslateButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String label;

  const TranslateButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      icon: Icon(icon),
      label: Text(label),
      onPressed: onPressed,
    );
  }
}
