import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dw_vakinha/app/core/exceptions/anauthorized_exception.dart';
import 'package:dw_vakinha/app/core/exceptions/repository_exception.dart';
import 'package:dw_vakinha/app/core/rest_client/custom_dio.dart';
import 'package:dw_vakinha/app/models/auth_model.dart';
import 'package:dw_vakinha/app/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;

  AuthRepositoryImpl({required this.dio});

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final result = await dio.unauth().post("/auth", data: {
        "email": email,
        "password": password,
      });
      
      return AuthModel.fromMap(result.data);

    } on DioError catch (e, s) {
      if(e.response?.statusCode == 400){
        log("Premissão Negada", error: e, stackTrace: s);
        throw UnauthorizedException();
      }
      log("Erro ao realizar login", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao realizar login");
    }
  }

  @override
  Future<void> register(String name, String email, String password) async {
    try {
      await dio.auth().post("/users", data: {
        "name": name,
        "email": email,
        "password": password,
      });
    } on DioError catch (e, s) {
      log("Erro ao registrar usuário", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao registrar Usuário");
    }
  }
}
