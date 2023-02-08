import 'package:dw_vakinha/app/core/ui/theme/theme_config.dart';
import 'package:dw_vakinha/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class DwApp extends StatelessWidget {
  const DwApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Title dw App",
      theme: ThemeConfig.theme,
      routes: {
        '/': (context) => const SplashPage()
      },
    );
  }
}
