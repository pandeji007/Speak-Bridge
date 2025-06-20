// lib/ui/widgets/language_selector.dart
import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  final String label;
  final String selectedLanguage;
  final ValueChanged<String> onChanged;

  const LanguageSelector({
    super.key,
    required this.label,
    required this.selectedLanguage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label Language',
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 6),
        DropdownButton<String>(
          value: selectedLanguage,
          dropdownColor: Colors.deepPurpleAccent,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          iconEnabledColor: Colors.white,
          isExpanded: true,
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
          items: const [
            DropdownMenuItem(value: 'en', child: Text('English')),
            DropdownMenuItem(value: 'es', child: Text('Spanish')),
            DropdownMenuItem(value: 'fr', child: Text('French')),
            DropdownMenuItem(value: 'hi', child: Text('Hindi')),
            DropdownMenuItem(value: 'de', child: Text('German')),
          ],
        ),
      ],
    );
  }
}
