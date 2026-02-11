import 'package:flutter/material.dart';
import 'ui/widgets/actions/bla_button.dart';
import 'ui/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(
        body: BlaButton(
          icon: Icons.home_outlined,
          text: 'Hello',
          onTap: () => {},
          // type: ButtonType.secondary,
        ),
      ),
    );
  }
}
