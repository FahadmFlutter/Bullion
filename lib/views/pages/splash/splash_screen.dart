import 'package:bullion/views/register/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/bottom_nav_bar.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed( const Duration(seconds: 3),()async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.containsKey("Token")){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>  BottomNavBar()));
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>  LoginScreen()));}
    });
    // TODO: implement initState

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bullion',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffD4AF37),
                fontSize: 65,
                fontFamily: 'Gilroy-Medium',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'simple trading app',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Gilroy-Medium',
                fontWeight: FontWeight.w400,
                letterSpacing:4.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}