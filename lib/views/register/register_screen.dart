import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Bloc/login/login_bloc.dart';
import '../../components/bottom_nav_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

bool isVisible = true;
final emailController = TextEditingController();
final userController = TextEditingController();
final passwordController = TextEditingController();
final phoneController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 113,
                    height: 113,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(
                      child: Text(
                        'LOGO',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4, left: 40),
                  child: Text(
                    'EMAIL',
                    style: TextStyle(
                      color: Color(0xB2FBF4E4),
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,

                  controller: emailController,
                  cursorColor:  Color(0xffD4AF37),
                  decoration: InputDecoration(
                    hintText: '"admin@ \'mail\'.com"',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffD4AF37)),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color(0xffD4AF37),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4, left: 40, top: 16),
                  child: Text(
                    'PASSWORD',
                    style: TextStyle(
                      color: Color(0xB2FBF4E4),
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  obscureText: isVisible,
                  controller: passwordController,
                  cursorColor:  Color(0xffD4AF37),
                  decoration: InputDecoration(
                    hintText: '"password"',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffD4AF37)),
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xffD4AF37),
                    ),
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
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Center(
                    child: Text(
                      'Forgotten your password? ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFB6B1A6),
                        fontSize: 10,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 40,
                // ),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginBlocLoaded) {
                      token(BlocProvider.of<LoginBloc>(context)
                          .loginModel
                          .accessToken!);
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
                                // Navigator.pop(context);
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
                        height: 50,
                        decoration: ShapeDecoration(
                          color: Color(0xffD4AF37),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Center(
                          child:Text(
                            'Log In',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w900,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                //   child: GestureDetector(
                //     onTap: () {
                //       Navigator.pushReplacement(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => BottomNavBar(),
                //           ));
                //     },
                //     child: Center(
                //       child: Container(
                //         width: double.infinity,
                //         height: 60,
                //         decoration: ShapeDecoration(
                //           color: Color(0xffD4AF37),
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //         ),
                //         child: Center(
                //           child: Text(
                //             'Log In',
                //             textAlign: TextAlign.center,
                //             style: TextStyle(
                //               color: Colors.black,
                //               fontSize: 20,
                //               fontFamily: 'Gilroy',
                //               fontWeight: FontWeight.w800,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),





                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 12.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Text(
                //         'Don’t have an account?',
                //         style: TextStyle(
                //           fontSize: 14,
                //           fontFamily: 'Gilroy',
                //           fontWeight: FontWeight.w600,
                //           letterSpacing: 0.70,
                //         ),
                //       ),
                //       TextButton(
                //         onPressed: () {
                //           // Navigator.of(context).pop();
                //         },
                //         child: Text(
                //           'Register',
                //           style: TextStyle(
                //             color: Color(0xffD4AF37),
                //             fontSize: 14,
                //             fontFamily: 'Gilroy',
                //             fontWeight: FontWeight.w600,
                //             letterSpacing: 0.70,
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),


                // Center(
                //   child: TextButton(
                //     onPressed: () {
                //       Navigator.pushReplacement(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => BottomNavBar(),
                //         ),
                //       );
                //     },
                //     child: Text(
                //       'Go Home',
                //       style: TextStyle(
                //         color: Color(0xffD4AF37),
                //         fontSize: 14,
                //         fontFamily: 'Gilroy',
                //         fontWeight: FontWeight.w600,
                //         letterSpacing: 0.70,
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
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
