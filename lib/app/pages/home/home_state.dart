import 'package:dw_vakinha/app/dto/order_product_dto.dart';
import 'package:dw_vakinha/app/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<OrderProductDto> shoppingBag;

  const HomeState(
      {required this.products, required this.status, this.errorMessage, required this.shoppingBag});

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        shoppingBag = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, products, errorMessage, shoppingBag];

  // o operador ?? retorna o primeiro valor a esquerda se caso ele nao for nulo
  // senao, se ele for nulo, retorna o valor a direita
  //exemplo products ?? this.products, significa se products for nulo, retorna this.products
  HomeState copyWith({
    HomeStateStatus? status,
    String? errorMessage,
    List<ProductModel>? products,
    List<OrderProductDto>? shoppingBag,
  }) {
    return HomeState(
        products: products ?? this.products,
        status: status ?? this.status,
        shoppingBag: shoppingBag ?? this.shoppingBag,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
