



// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/AppUrl.dart';
import '../utils/Utils.dart';
import 'Onboarding/Onboarding.dart';



class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 03), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const Onboarding()
          ));
    });
    gettokenAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: (Image.asset(
              'assets/Rectangle.png',
              fit: BoxFit.cover,
            )),
          ),
          Container(
            alignment: Alignment.center,
            child: (Image.asset(
              'assets/images/SplashScreenLogo.png',
              height: 132,
              width: 132,
            )),
          ),


        ],
      ),
    );
  }


  gettokenAuth() async {
    final Dio dio = Dio();
    try {
      Response response = await dio.post(AppUrl.integration_admin_token,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer  ${Utils.userkey}',
            },
          ),
          data: {
            // "username": "arvind.kumar",
            //  "password": "test@123",
            "username": AppUrl.username,
            "password": AppUrl.password
          }
      );
      if (response.statusCode == 200) {
        Utils.userkey = response.data;
        if (kDebugMode) {
          print(Utils.userkey);
        }
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) => Utils.hideLoader());
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.error);
      }
    }
  }



}