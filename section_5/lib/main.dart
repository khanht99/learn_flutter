import 'package:flutter/material.dart';
import 'package:section_5/expenses.dart';
// import 'package:flutter/services.dart';

var kColorSchema = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 30, 161, 254));

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: kColorSchema,
      appBarTheme: AppBarTheme(
        backgroundColor: kColorSchema.onPrimaryContainer,
        foregroundColor: kColorSchema.primaryContainer,
      ),
      cardTheme: CardTheme(
        elevation: 10,
        margin: EdgeInsets.all(10),
        color: kColorSchema.secondaryContainer,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorSchema.onPrimaryContainer,
          foregroundColor: kColorSchema.secondary
        )
      )
    ),
    home: const Expenses(),
  ));
}
