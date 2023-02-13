import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/product_model.dart';
import 'products_repository.dart';

class ProductsRepositotyImpl implements ProductsRepository {
  final CustomDio dio;
  ProductsRepositotyImpl({required this.dio});

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final resul = await dio.unauth().get('/products');
      return resul.data
          .map<ProductModel>(
            (p) => ProductModel.fromMap(p),
          )
          .toList();
      // return resul.data.map<ProductModel>((p) => ProductModel.fromMap(p)).toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar produto', error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar Produto");
    }
  }
}
