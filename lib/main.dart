// lib/main.dart
import 'package:flutter/material.dart';
import 'package:speak_bridge/ui/pages/language_selection_page.dart';

void main() {
  runApp(const SpeakBridgeApp());
}

class SpeakBridgeApp extends StatelessWidget {
  const SpeakBridgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speak Bridge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'OpenSans',
      ),
      home: const LanguageSelectionPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
