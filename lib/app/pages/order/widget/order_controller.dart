import 'dart:developer';

import 'package:dw_vakinha/app/dto/order_product_dto.dart';
import 'package:dw_vakinha/app/pages/order/widget/order_state.dart';
import 'package:dw_vakinha/app/repositories/order/order_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderController extends Cubit<OrderState> {
  final OrderRepository _orderRepository;
  OrderController(this._orderRepository) : super(const OrderState.initial());

  Future<void> load(List<OrderProductDto> products) async {
    try {
      emit(state.copyWith(status: OrderStatus.loading));
      final paymentsTypes = await _orderRepository.getAllPaymentsTypes();
      emit(state.copyWith(
        orderProducts: products,
        status: OrderStatus.loaded,
        paymentsTypes: paymentsTypes,
      ));
    } catch (e, s) {
      log("Erro ao carregar página", error: e, stackTrace: s);
      emit(state.copyWith(
          status: OrderStatus.error, errorMessage: "Erro ao carregar página"));
    }
  }

  void incrementProduct(int index) {
    final orders = [...state.orderProducts];
    final order = orders[index];
    orders[index] = order.copyWith(amount: order.amount + 1);
    emit(
      state.copyWith(
        orderProducts: orders,
        status: OrderStatus.updateOrder,
      ),
    );
  }

  void decrementProduct(int index) {
    final orders = [...state.orderProducts];
    final order = orders[index];
    orders[index] = order.copyWith(amount: order.amount - (order.amount > 0 ? 1 : 0 ));
    emit(
      state.copyWith(
        orderProducts: orders,
        status: OrderStatus.updateOrder,
      ),
    );
  }
}
