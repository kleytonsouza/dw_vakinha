import 'package:dw_vakinha/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

import '../../core/config/env.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Column(
        children: [
          Container(),
          DeliveryButton(
            label: Env.i['backend_base_url'] ?? '',
            onPressed: () {},
            height: 200,
            width: 200,
          ),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('teste'),
            ),
          ),
        ],
      ),
    );
  }
}
