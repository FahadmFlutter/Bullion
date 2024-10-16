part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginBlocLoading extends LoginState {}
class LoginBlocLoaded extends LoginState {}
class LoginBlocError extends LoginState {}