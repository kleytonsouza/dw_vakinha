import 'package:dw_vakinha/app/dto/order_product_dto.dart';
import 'package:dw_vakinha/app/models/payment_type_model.dart';
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'order_state.g.dart';

@match
enum OrderStatus {
  initial,
  loaded,
  loading,
  error,
  updateOrder,
}

class OrderState extends Equatable {
  final OrderStatus status;
  final List<OrderProductDto> orderProducts;
  final List<PaymentTypeModel> paymentsTypes;
  final String? errorMessage;

  const OrderState(
      {required this.status,
      required this.orderProducts,
      this.errorMessage,
      required this.paymentsTypes});

  const OrderState.initial()
      : status = OrderStatus.initial,
        paymentsTypes = const [],
        errorMessage = null,
        orderProducts = const [];

  double get totalPrice => orderProducts.fold(
      0.0, (previousValue, element) => previousValue + element.totalPrice);

  @override
  List<Object?> get props =>
      [status, orderProducts, paymentsTypes, errorMessage];

  OrderState copyWith({
    OrderStatus? status,
    String? errorMessage,
    List<PaymentTypeModel>? paymentsTypes,
    List<OrderProductDto>? orderProducts,
  }) {
    return OrderState(
        status: status ?? this.status,
        paymentsTypes: paymentsTypes ?? this.paymentsTypes,
        errorMessage: errorMessage ?? this.errorMessage,
        orderProducts: orderProducts ?? this.orderProducts);
  }
}
