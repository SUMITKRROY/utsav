import 'package:flutter/material.dart';
import 'package:utsav/Screen/Login/Login_Screen.dart';
import 'dart:developer';

import '../utils/Utils.dart';
import '../utils/app_color.dart';
import 'navbarbottom.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {



  @override
  void initState() {
    filterdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: ListView(
              children: [
                SizedBox(
                  height: height * 0.020,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/welcome.png',
                    width: 97,
                    height: 90,
                  ),

                ),
                SizedBox(
                  height: height * 0.020,
                ),
                Align(
                  alignment: Alignment.center,
                  child:  Text(
                    "Welcome",
                    style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 40,
                        color: AppColors.Textcolorheading,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: height * 0.010,
                ),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Utsav ',
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 20,
                            )),
                        const TextSpan(
                          text: 'fashion',
                          style: TextStyle(
                            color: AppColors.primaryColorpink,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.030,
                ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      color: AppColors.bordercontainergreyinside,
                      border: Border.all(color: AppColors.bordergrey)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Image.asset('assets/search.png'),
                          iconSize: 25,
                          onPressed: () {},
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                        child: Text(
                          "Continue with Google",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      color: AppColors.bordercontainergreyinside,
                      border: Border.all(color: AppColors.bordergrey)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Image.asset('assets/Facebook.png'),
                          iconSize: 25,
                          onPressed: () {},
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                        child: Text(
                          "Continue with Facebook",
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: const <Widget>[
                    Expanded(
                      child: Divider(
                        indent: 20.0,
                        endIndent: 10.0,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 10.0,
                        endIndent: 20.0,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                InkWell(
                    child: Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          color: AppColors.bordercontainergreyinside,
                          border: Border.all(color: AppColors.bordergrey)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              icon: Image(
                                image: AssetImage('assets/Shape.png'),
                              ),
                              iconSize: 25,
                              onPressed: () {

                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                            child: Text(
                              "Continue with Email",
                              style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                       Utils.checkLogin=true;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const LoginScreen()));
                       //(Route<dynamic> route) => true);
                    }),
                SizedBox(
                  height: height * 0.010,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Utils.checkLogin=false;
                      // PrefUtils.setLogin(false);
                       Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const dashboardScreen(selectedIndex: 0,)),
                              (Route<dynamic> route) => false
                      );
                      // (Route<dynamic> route) => false);
                      //signup screen
                    },
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(30, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.centerLeft),
                    child: const Text(
                      "Continue as a Guest",
                      style: TextStyle(
                        shadows: [
                          Shadow(
                              color: AppColors.underlineTextcolorheading,
                              offset: Offset(0, -2))
                        ],
                        decoration: TextDecoration.underline,
                        fontFamily: 'SourceSansPro',
                        color: Colors.transparent,
                        fontWeight: FontWeight.w600,
                        decorationColor: AppColors.underlineTextcolorheading,
                        decorationThickness: 1.5,
                        fontSize: 17,
                        decorationStyle:
                        TextDecorationStyle.solid,
                      ),
                      // style: TextStyle(
                      //   decoration: TextDecoration.underline,
                      //   fontFamily: 'SourceSansPro',
                      //   color: AppColors.underlineTextcolorheading,
                      //   decorationStyle: TextDecorationStyle.solid,
                      //   fontWeight: FontWeight.w600,
                      //   decorationThickness: 1.0,
                      //   fontSize: 17,
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }


  void filterdata(){
    List <dynamic> filtervalue=[];
    for(   int  i=0; i<Utils.categoriesList['children_data'][i].length;i++){
      if(Utils.categoriesList['children_data'][i]['is_active']==true &&
          Utils.categoriesList['children_data'][i]['name']!='Discover' &&
          Utils.categoriesList['children_data'][i]['product_count']==0){
        filtervalue.add( Utils.categoriesList['children_data'][i]);
      }
    }
    Utils.FilteredData.addAll(filtervalue);
    print("filtervalue>>>${Utils.FilteredData}");

  }
}
