import 'dart:developer';

import 'package:dw_vakinha/app/core/exceptions/anauthorized_exception.dart';
import 'package:dw_vakinha/app/pages/auth/login/login_state.dart';
import 'package:dw_vakinha/app/repositories/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginController(this._authRepository) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    try {
      emit(state.copyWith(status: LoginStatus.login));
      final authModel = await _authRepository.login(email, password);
      final sp = await SharedPreferences.getInstance();
      sp.setString('acessToken', authModel.accessToken);
      sp.setString('refreshToken', authModel.refreshToken);
      emit(state.copyWith(status: LoginStatus.success));
    } on UnauthorizedException catch (e, s) {
      emit(state.copyWith(
          status: LoginStatus.loginError,
          errorMessage: "Login ou senha inválido(s)"));
      log("Login ou senha inválido(s)", error: e, stackTrace: s);
    } catch (e, s) {
      log("Erro ao realizar login", error: e, stackTrace: s);
      emit(state.copyWith(
          status: LoginStatus.error, errorMessage: "Erro ao realizar login"));
    }
  }
}
