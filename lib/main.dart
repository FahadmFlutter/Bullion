import 'package:bullion/Bloc/login/login_bloc.dart';
import 'package:bullion/Bloc/register/register_bloc.dart';
import 'package:bullion/views/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Bullion',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF231F20),
        ),
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
