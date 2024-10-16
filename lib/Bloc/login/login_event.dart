part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class FetchLogin extends LoginEvent {
  final String email;
  final String passWord;

  FetchLogin({
    required this.email,
    required this.passWord,
  });
}
