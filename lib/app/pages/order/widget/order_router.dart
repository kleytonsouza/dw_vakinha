import 'package:dw_vakinha/app/pages/order/order_page.dart';
import 'package:dw_vakinha/app/repositories/order/order_repository.dart';
import 'package:dw_vakinha/app/repositories/order/order_repository_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'order_controller.dart';

class OrderRouter {
  OrderRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<OrderRepository>(
            create: (context) => OrderRepositoryImpl(dio: context.read()),
          ),
          Provider(
            create: (context) => OrderController(context.read()),
          )
        ],
        child: const OrderPage(),
      );
}
