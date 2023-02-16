import 'package:dw_vakinha/app/models/product_model.dart';
import 'package:equatable/equatable.dart';

enum HomeStateStatus {
  initial,
  loading,
  loaded,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;

  const HomeState({required this.products, required this.status});

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [];

  @override
  List<Object?> get props => [status, products];

  // o operador ?? retorna o primeiro valor a esquerda se caso ele nao for nulo
  // senao, se ele for nulo, retorna o valor a direita
  //exemplo products ?? this.products, significa se products for nulo, retorna this.products
  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
  }) {
    return HomeState(
        products: products ?? this.products, status: status ?? this.status);
  }
}
