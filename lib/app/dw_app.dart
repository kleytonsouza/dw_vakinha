import 'package:dw_vakinha/app/core/provider/application_binding.dart';
import 'package:dw_vakinha/app/core/ui/theme/theme_config.dart';
import 'package:dw_vakinha/app/pages/auth/register/register_router.dart';
import 'package:dw_vakinha/app/pages/home/home_router.dart';
import 'package:dw_vakinha/app/pages/order/order_page.dart';
import 'package:dw_vakinha/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'pages/auth/login/login_router.dart';
import 'pages/product_detail/product_detail_router.dart';

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
          '/productDetail': (context) => ProductDetailRouter.page,
          '/auth/login': (context) => LoginRouter.page,
          '/auth/register': (context) => RegisterRouter.page,
          '/order': (context) => const OrderPage(),
        },
      ),
    );
  }
}
