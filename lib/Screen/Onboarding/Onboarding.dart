import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:utsav/Screen/welcome.dart';

import '../../utils/AppUrl.dart';
import '../../utils/Utils.dart';
import '../../utils/app_color.dart';
import '../mixlandingpage/bloc/data/posts_service.dart';
import '../mixlandingpage/bloc/mix_landing_page_bloc.dart';
import 'bloc/category/categories_bloc.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;


class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  var dio = Dio();
  var latitude;
  var longitude;


  CategoriesBloc _CategoriesBloc = CategoriesBloc();

  @override
  void initState() {
    countryList();
    getLocation();
    _CategoriesBloc..add(LoadUserEvent());
    super.initState();
  }
  getLocation() async {
    // _getUserLocation();
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition();

    latitude = position.latitude;
    longitude = position.longitude;

    _getAddress();
  }

  String getCurrency(countryName) {
    var format = NumberFormat.simpleCurrency(
      locale: countryName,
    );

    if (kDebugMode) {
      print("CURRENCY SYMBOL ${format.currencySymbol}");
    } // $
    if (kDebugMode) {
      print("CURRENCY NAME ${format.currencyName}");
    }
    Utils.currencyName = format.currencyName!;
    Utils.currencySymbol = format.currencySymbol;
    return format.currencySymbol;
  }

  Locale myLocale = ui.window.locale;
  _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(latitude, longitude);
      Placemark place = p[0];

      var currentAddress =
          "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
      var currentAdd = currentAddress;
      Utils.loaction = place.country!;
      var isoCountryCode = place.isoCountryCode!;

      var localscode = "${myLocale.languageCode}_$isoCountryCode";
      getCurrency(localscode);
      // currency(Utils.loaction,isoCountryCode);

    } catch (e) {}
  }



  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: BlocProvider(
              create: (context) => _CategoriesBloc,
              child: BlocBuilder<CategoriesBloc, CategoriesState>(
                  builder: (context, state) {
                if (state is CategoriesLoadingState) {
                  return _loadingIndicator();
                }
                else if (state is CategoriesLoadedState) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: height * 0.25,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 91, right: 20),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //         const WelcomeScreen()));
                                    },
                                    child: Text(
                                      'Skip',
                                      style: TextStyle(
                                        decoration:
                                            TextDecoration.underline,
                                        fontFamily: 'SourceSansPro',
                                        color: AppColors.Textcolorheading,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Image.asset(
                                  'assets/images/SplashScreenLogo.png',
                                  height: height * 0.30,
                                  width: width * 0.30,
                                ),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            "assets/images/500Off.png",
                            height: height * 0.200,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.040,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Don’t miss out".toUpperCase(),
                            style: const TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 18,
                                color: AppColors.primaryColorpink,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Register and start your fashion \n journey to get -",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 16,
                                color: AppColors.Textcolorheading,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "Get extra 500 Off* on your first order when you log in. Offers & updates on fresh Indian fashion trends. Seamless sync of wishlist on all devices. Faster browsing and checkout while you shop. All your orders & status updates in one place..",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  height: 1.5,
                                  fontSize: 15,
                                  color: AppColors.Textcolorheading,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.060,
                        ),
                        InkWell(
                            child: Container(
                              width: width / 2,
                              height: height / 12,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.bordergrey,
                                      width: 1),
                                  shape: BoxShape.circle,
                                  color: Colors.white),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: AppColors.primaryColorpink,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const welcome()));
                              // (Route<dynamic> route) => false);
                            }),
                      ],
                    ),
                  );
                }
                else if(state is CategoriesErrorState){
                  return Text('Connection not found');
                }
            return Container();
              }),
            ),
          ),
        ));
  }

  Widget _loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Future countryList() async {
    var dio = Dio();
    final response = await dio.get(AppUrl.directory_countries,);
    if (response.statusCode == 200) {
      Utils.sidemenulist = response.data;
      if (kDebugMode) {
        print("here is my data >>>${Utils.sidemenulist}");
      }
    } else {
      if (kDebugMode) {
        print('Data not found');
      }
    }
  }
}
