import 'package:dw_vakinha/app/core/provider/application_binding.dart';
import 'package:dw_vakinha/app/core/ui/theme/theme_config.dart';
import 'package:dw_vakinha/app/pages/home/home_page.dart';
import 'package:dw_vakinha/app/pages/home/home_router.dart';
import 'package:dw_vakinha/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DwApp extends StatelessWidget {
  const DwApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: "Title dw App",
        theme: ThemeConfig.theme,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
        },
      ),
    );
  }
}
