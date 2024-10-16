part of 'register_bloc.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}
 class RegisterLoaded extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterError extends RegisterState {}