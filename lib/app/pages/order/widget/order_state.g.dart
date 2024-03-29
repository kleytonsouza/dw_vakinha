// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension OrderStatusMatch on OrderStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loaded,
      required T Function() loading,
      required T Function() error,
      required T Function() updateOrder,
      required T Function() confirmRemoveProduct,
      required T Function() emptyBag}) {
    final v = this;
    if (v == OrderStatus.initial) {
      return initial();
    }

    if (v == OrderStatus.loaded) {
      return loaded();
    }

    if (v == OrderStatus.loading) {
      return loading();
    }

    if (v == OrderStatus.error) {
      return error();
    }

    if (v == OrderStatus.updateOrder) {
      return updateOrder();
    }

    if (v == OrderStatus.confirmRemoveProduct) {
      return confirmRemoveProduct();
    }

    if (v == OrderStatus.emptyBag) {
      return emptyBag();
    }

    throw Exception('OrderStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loaded,
      T Function()? loading,
      T Function()? error,
      T Function()? updateOrder,
      T Function()? confirmRemoveProduct,
      T Function()? emptyBag}) {
    final v = this;
    if (v == OrderStatus.initial && initial != null) {
      return initial();
    }

    if (v == OrderStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == OrderStatus.loading && loading != null) {
      return loading();
    }

    if (v == OrderStatus.error && error != null) {
      return error();
    }

    if (v == OrderStatus.updateOrder && updateOrder != null) {
      return updateOrder();
    }

    if (v == OrderStatus.confirmRemoveProduct && confirmRemoveProduct != null) {
      return confirmRemoveProduct();
    }

    if (v == OrderStatus.emptyBag && emptyBag != null) {
      return emptyBag();
    }

    return any();
  }
}
