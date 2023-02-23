import 'dart:developer';

import 'package:dw_vakinha/app/dto/order_product_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dw_vakinha/app/pages/home/home_state.dart';
import 'package:dw_vakinha/app/repositories/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;

  HomeController(
    this._productsRepository,
  ) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await _productsRepository.findAllProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      log("Erro ao buscar produtos", error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: "Erro na busca de produtos"));
    }
  }

  void addOrUpdateBag(OrderProductDto orderProduct) {
    final shoppingBag = [...state.shoppingBag];
    final orderIndex = shoppingBag
        .indexWhere((element) => element.product == orderProduct.product);
    if (orderIndex > -1) {
      shoppingBag[orderIndex] = orderProduct;
    }
    shoppingBag.add(orderProduct);
    emit(state.copyWith(shoppingBag: shoppingBag));
  }
}
