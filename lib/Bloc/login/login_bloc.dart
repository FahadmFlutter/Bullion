import 'package:bullion/Repository/Models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Repository/API/login_api.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginApi loginApi = LoginApi();
  late LoginModel loginModel;

  LoginBloc() : super(LoginInitial()) {
    on<FetchLogin>((event, emit) async {
      emit(LoginBlocLoading());
      try {
        loginModel = await loginApi.getLogIn(
          email: event.email,
          passWord: event.passWord,
        );
        emit(LoginBlocLoaded());
      } catch (e) {
        print(e);
        emit(LoginBlocError());
      }
    });
  }
}
