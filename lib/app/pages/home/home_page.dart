import 'package:dw_vakinha/app/core/ui/helpers/loader.dart';
import 'package:dw_vakinha/app/core/ui/helpers/messages.dart';
import 'package:dw_vakinha/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw_vakinha/app/models/product_model.dart';
import 'package:dw_vakinha/app/pages/home/widget/delivery_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // showLoader();
        // await Future.delayed(
        //   const Duration(seconds: 2),
        // );
        // hideLoader();
        showError("Deu mierda erro");
        await Future.delayed(Duration(seconds: 2));
        showInfo("Deu boa informações");
        await Future.delayed(Duration(seconds: 2));
        showSuccess("Deu buenas Successfull");
        await Future.delayed(Duration(seconds: 2));
      }),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return DeliveryProductTile(
                  product: ProductModel(
                    id: 0,
                    name: "Lanche X",
                    description:
                        "O Lanche acompanha pão, hambúrguer, muçarela, e maionese.",
                    price: 2.22,
                    image:
                        "https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800",
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
