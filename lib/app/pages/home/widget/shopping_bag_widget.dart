import 'package:dw_vakinha/app/core/extensions/formatter_extension.dart';
import 'package:dw_vakinha/app/core/ui/helpers/size_extensions.dart';
import 'package:dw_vakinha/app/core/ui/styles/text_styles.dart';
import 'package:dw_vakinha/app/dto/order_product_dto.dart';
import 'package:flutter/material.dart';

class ShoppingBagWidget extends StatelessWidget {
  final List<OrderProductDto> shoppingBag;

  const ShoppingBagWidget({super.key, required this.shoppingBag});

  @override
  Widget build(BuildContext context) {
    var totalBag = shoppingBag.fold<double>(0.0, (value, element) => value += element.totalPrice).currencyPTBR;
    return Container(
      width: context.screenWidth,
      height: 90,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Ver Sacola",
                style: context.textStyles.textExtraBold.copyWith(fontSize: 14),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                totalBag,
                style: context.textStyles.textExtraBold.copyWith(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
