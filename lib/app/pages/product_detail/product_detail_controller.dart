import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailController extends Cubit<int> {
  late final bool _hasOrder;

  ProductDetailController() : super(1);

  void initial(int amount, bool hasOrder) {
    _hasOrder = hasOrder;
    emit(amount);
  }

  void increment() => emit(state + 1);
  void decrement() => emit(state > 1 ? state - 1 : 1);
}
