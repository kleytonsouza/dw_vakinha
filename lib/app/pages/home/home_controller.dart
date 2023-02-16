import 'package:bloc/bloc.dart';
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
} on Exception catch (e) {
  // TODO
}
  }
}
