import 'package:dw_vakinha/app/core/ui/styles/colors_app.dart';
import 'package:dw_vakinha/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class DeliveryIncrementDecrementButton extends StatelessWidget {
  final int amount;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;
  const DeliveryIncrementDecrementButton(
      {super.key,
      required this.amount,
      required this.incrementTap,
      required this.decrementTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: InkWell(
              onTap: decrementTap,
              child: Text(
                "-",
                style: context.textStyles.textMedium
                    .copyWith(fontSize: 22, color: Colors.grey),
              ),
            ),
          ),
          Text(
            amount.toString(),
            style: context.textStyles.textRegular
                .copyWith(fontSize: 17, color: context.colors.secondary),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: InkWell(
              onTap: incrementTap,
              child: Text(
                "+",
                style: context.textStyles.textMedium
                    .copyWith(fontSize: 22, color: context.colors.secondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
