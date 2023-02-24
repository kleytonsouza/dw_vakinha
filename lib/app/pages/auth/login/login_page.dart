import 'package:dw_vakinha/app/core/ui/styles/colors_app.dart';
import 'package:dw_vakinha/app/core/ui/styles/text_styles.dart';
import 'package:dw_vakinha/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw_vakinha/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: context.textStyles.textTitle,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "E-mail"),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Senha"),
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: DeliveryButton(
                        label: "ENTRAR",
                        width: double.infinity,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Não Possui conta",
                      style: context.textStyles.textBold,
                    ),
                    TextButton(
                      child: Text(
                        "Cadastre-se",
                        style: context.textStyles.textBold
                            .copyWith(color: Colors.blue),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
