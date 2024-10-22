
import 'package:bullion/Repository/API/register_api.dart';
import 'package:bullion/Repository/Models/register_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterApi registerApi = RegisterApi();
  late RegisterModel registerModel;

  RegisterBloc() : super(RegisterInitial()) {
    on<FetchRegister>((event, emit) async {
      emit(RegisterLoading());
      try {
        registerModel = await registerApi.getRegister(
          email: event.email,
          passWord: event.passWord,
        );
        emit(RegisterLoaded());
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(RegisterError());
      }
    });
  }
}
