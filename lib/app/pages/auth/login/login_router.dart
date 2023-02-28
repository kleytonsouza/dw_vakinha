import 'package:dw_vakinha/app/pages/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../login/login_controller.dart';

class LoginRouter {
  LoginRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(create: (context) => LoginController(context.read()))
        ],
        child: const LoginPage(),
      );
}
