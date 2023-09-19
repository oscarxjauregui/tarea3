import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea3/home_screen.dart';
import 'package:tarea3/screens/login_screen.dart';
import 'package:tarea3/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider()..initialize(),
        ),
        ChangeNotifierProvider<CheckboxState>(
          create: (_) => CheckboxState(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class CheckboxState with ChangeNotifier {
  bool isChecked = false;

  void toggleCheckbox() {
    isChecked = !isChecked;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      final checkboxState = Provider.of<CheckboxState>(context);


    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: provider.themeMode,
        home: checkboxState.isChecked ? HomeScreen() : LoginScreen(checkboxState.toggleCheckbox()),
      );
    });
  }
}