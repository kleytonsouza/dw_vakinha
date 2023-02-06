import 'package:dw_vakinha/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(scaffoldBackgroundColor: Colors.white),
      child: Scaffold(
        appBar: AppBar(title: const Text('Splash')),
        body: const Text('fefef'),
      ),
    );
  }
}
