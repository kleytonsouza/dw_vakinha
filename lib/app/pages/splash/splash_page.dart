import 'package:dw_vakinha/app/core/ui/helpers/size_extensions.dart';
import 'package:dw_vakinha/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color(0xFF140e0e),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  "assets/images/lanche.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.percentHeight(.20),
                  ),
                  Image.asset("assets/images/logo.png"),
                  const SizedBox(height: 70),
                  DeliveryButton(
                    width: context.percentWidth(.60),
                    height: 35,
                    label: "Entrar",
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/home');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
