import 'package:dw_vakinha/app/dto/order_product_dto.dart';
import 'package:dw_vakinha/app/pages/order/widget/order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderController extends Cubit<OrderState> {
  OrderController() : super(const OrderState.initial());

  void load(List<OrderProductDto> products) {
    emit(state.copyWith(orderProducts: products));
  }
}
