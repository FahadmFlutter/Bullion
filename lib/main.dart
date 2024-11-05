import 'package:bullion/Bloc/get_assets/get_assets_bloc.dart';
import 'package:bullion/Bloc/login/login_bloc.dart';
import 'package:bullion/Bloc/register/register_bloc.dart';
import 'package:bullion/views/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        ),
        BlocProvider(
          create: (context) => GetAssetsBloc(),
        )
      ],
      child: Builder(
        builder: (context) {
          return ScreenUtilInit(
            designSize: const Size(390, 844),
            enableScaleText: () => false,
            minTextAdapt: true,
            splitScreenMode: true,

            child: MaterialApp(
              title: 'Bullion',
              theme: ThemeData.dark(useMaterial3: true)
                  .copyWith(scaffoldBackgroundColor: const Color(0xFF231F20)),
              debugShowCheckedModeBanner: false,
              home: Splash(),
            ),
          );
        }
      ),
    );
  }
}
