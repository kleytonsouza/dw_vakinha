import 'package:dw_vakinha/app/core/ui/styles/text_styles.dart';
import 'package:dw_vakinha/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw_vakinha/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _nameEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
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
                  decoration: const InputDecoration(labelText: "Nome"),
                  validator: Validatorless.required("nome obrigatório"),
                  controller: _nameEC,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "E-mail"),
                  controller: _emailEC,
                  validator: Validatorless.multiple([
                    Validatorless.email("Email invalído"),
                    Validatorless.required("E-mail Obrigatório"),
                  ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Senha"),
                  controller: _passwordEC,
                  obscureText: true,
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required("Senha obrigatória"),
                      Validatorless.min(
                          6, "Senha deve conter ao menos 6 caracteres."),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Confirma Senha"),
                  validator: Validatorless.multiple([
                    Validatorless.required("Confirmar Senha obrigatório"),
                    Validatorless.compare(
                        _passwordEC, "As Senhas devem ser iguais.")
                  ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: DeliveryButton(
                    label: "Cadastrar",
                    onPressed: () {
                      final valid = _formKey.currentState?.validate() ?? false;
                      if(valid){
                        
                      }
                    },
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
