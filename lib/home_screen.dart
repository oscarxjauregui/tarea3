import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea3/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
          ),
          Positioned.fill(
            top: 80,
            child: Align(
              alignment: Alignment.topCenter,
              child:
                  Consumer<ThemeProvider>(builder: (context, provider, child) {
                return DropdownButton<String>(
                  value: provider.currentTheme,
                  items: [
                    //Light, dark, and system
                    DropdownMenuItem<String>(
                      value: 'light',
                      child: Text(
                        'Light',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),

                    DropdownMenuItem<String>(
                      value: 'dark',
                      child: Text(
                        'Dark',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'system',
                      child: Text(
                        'System',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                  onChanged: (String? value) {
                    provider.changeTheme(value ?? 'system');
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}