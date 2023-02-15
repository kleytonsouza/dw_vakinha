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
}
