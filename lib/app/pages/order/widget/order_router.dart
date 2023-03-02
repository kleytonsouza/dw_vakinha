import 'package:dw_vakinha/app/pages/order/order_page.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'order_controller.dart';

class OrderRouter {
  OrderRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => OrderController(),
          )
        ],
        child: const OrderPage(),
      );
}
