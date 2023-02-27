import 'package:dw_vakinha/app/core/ui/styles/text_styles.dart';
import 'package:dw_vakinha/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw_vakinha/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: [
                Text(
                  "Casdastro",
                  style: context.textStyles.textTitle,
                ),
                Text(
                  "Preencha os campos abaixo para criar seu cadastro.",
                  style: context.textStyles.textMedium.copyWith(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Nome"),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "E-mail"),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Senha"),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Confirma Senha"),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: DeliveryButton(
                    label: "Cadastrar",
                    onPressed: () {},
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
