import 'package:match/match.dart';

part 'register_state.g.dart';

@match
enum RegisterStatus {
  initial,
  register,
  success,
  error,
}

class RegisterState {
  final RegisterStatus status;
  //final String error;

  RegisterState({required this.status});

  RegisterState.initial() : status = RegisterStatus.initial;

  RegisterState copyWith({RegisterStatus? status}) {
    return RegisterState(status: status ?? this.status);
  }
}