part of 'register_bloc.dart';

abstract class RegisterEvent {}

class FetchRegister extends RegisterEvent {
  final String email;
  final String passWord;

  FetchRegister({
    required this.email,
    required this.passWord,
  });
}
