import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startup_namer/main.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    fetchSomething(context);

    return Container(
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.9],
          colors: [
            Color(0xFFFC5C7D),
            Color(0xFF6A82FB),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 90.0),
      child: Image.asset(
        'assets/news-placeholder.png',
        fit: BoxFit.scaleDown,
      ),
    );
  }

  void fetchSomething(BuildContext context) async {
    print("start background job....");
    await new Future.delayed(const Duration(seconds: 2));
    print("background job completed!!!");

    //Navigator.pushReplacementNamed(context, '/home');
    Navigator.pushReplacementNamed(context, '/demoshimmer');
  }

  // void fetchSomething() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final _isHaveData = prefs.getString(Constants.sp_have_data) ?? "";

  //   //TODO Call API from server and do sth
  //   await new Future.delayed(const Duration(seconds: 2));

  //   if (_isHaveData.isEmpty) {
  //     await prefs.setString(Constants.sp_have_data, "just login");
  //     view.goToNextScreen(true);
  //   } else {
  //     view.goToNextScreen(false);
  //   }
  // }

  //  void goToNextScreen(context, bool shouldLogin) {
  //   if (shouldLogin) {
  //     Navigator.pushReplacementNamed(context, Constants.login_screen);
  //   } else {
  //     Navigator.pushReplacementNamed(context, Constants.main_screen);
  //   }
  // }

}