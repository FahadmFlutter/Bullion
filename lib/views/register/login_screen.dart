import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Bloc/login/login_bloc.dart';
import '../../components/bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool isVisible = true;
final emailController = TextEditingController();
final userController = TextEditingController();
final passwordController = TextEditingController();
final phoneController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Icon(
                    Icons.lock,
                    size: 100,
                    color: Color(0xffD4AF37),
                  ),
                ),
              ),
              Text(
                'Log In',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Enter your emails and password',
                style: TextStyle(
                  color: Color(0xFF7C7C7C),
                  fontSize: 16,
                  fontFamily: 'Gilroy-Medium',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'enter email',
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Color(0xffD4AF37))),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                  prefixIcon: Icon(Icons.email_outlined,color: Color(0xffD4AF37),),
                ),
              ),
              SizedBox(height: 12,),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                textInputAction: TextInputAction.done,
                obscureText: isVisible,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'enter password',
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Color(0xffD4AF37))),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                  prefixIcon: Icon(Icons.lock_open,color: Color(0xffD4AF37),),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      child: isVisible == true
                          ? Icon(
                              Icons.visibility_off_outlined,
                              color: Color(0xffD4AF37),
                            )
                          : Icon(
                              Icons.visibility_outlined,
                              color: Color(0xffD4AF37),
                            )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Gilroy-Medium',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.70,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginBlocLoaded) {
                    token(BlocProvider.of<LoginBloc>(context)
                        .loginModel
                        .accessToken!
                        .toString());
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => BottomNavBar()),
                      (Route<dynamic> route) => false,
                    );
                  } else if (state is LoginBlocError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        action: SnackBarAction(
                            label: 'Register',
                            textColor: Colors.red[50],
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        content: Text(
                          'Login failed. Please try again.',
                          style: TextStyle(color: Colors.red[50]),
                        ),
                        backgroundColor: Colors.red[900],
                      ),
                    );
                  }
                },
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<LoginBloc>(context).add(FetchLogin(
                      email: emailController.text,
                      passWord: passwordController.text,
                    ));
                  },
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: ShapeDecoration(
                        color: Color(0xffD4AF37),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Log In',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavBar(),
                        ));
                  },
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: ShapeDecoration(
                        color: Color(0xffD4AF37),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Log In',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.70,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.of(context).pop();
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Color(0xffD4AF37),
                          fontSize: 14,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.70,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void token(String token) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Token", token);
  }
}
