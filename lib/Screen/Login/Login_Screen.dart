import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utsav/Screen/Login/recoverPassword.dart';

import '../../utils/Utils.dart';
import '../../utils/app_color.dart';
import '../../utils/styles.dart';
import '../create_new_account/Create an Account.dart';
import '../navbarbottom.dart';
import '../welcome.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 26,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              // padding: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/welcome.png",
                  height: 55,
                  width: 60,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Login to Utsav Fashion",
              style:  Styles.headingStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height * 0.040,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Text(
                                "Email Address",
                                style: Styles.formfieldHeadingText,
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.010,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Example@gmail.com',
                            hintStyle: Styles.formfieldhintStyle,
                          ),
                          validator: (value) {
                            RegExp regex=RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if(value!.isEmpty){
                              return ("Email is required");
                            }
                            else if(!regex.hasMatch(value)){
                              return ("Invalid email address");
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * 0.020,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Text(
                                "Password",
                                style: Styles.formfieldHeadingText,
                              ),
                              Text(
                                "*",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.010,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(10),
                            // FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+'))
                          ],
                          keyboardType: TextInputType.text,
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                            hintText: 'XXXXXXXXXXX',
                            hintStyle: Styles.formfieldhintStyle,
                            suffixIcon: IconButton(
                              color: Colors.grey,
                              icon: Icon(passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(
                                      () {
                                    passwordVisible = !passwordVisible;
                                  },
                                );
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid password.';
                            }

                            return null;
                          },
                       /*   validator: (value) {
                            RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                            if(value!.isEmpty){
                              return ("Password is required");
                            }
                            else if(value.length<8){
                              return ("Password must be more than 7 characters");
                            }
                            else if(!regex.hasMatch(value)){
                              return ("Password should contain upper,lower,digit and special character ");
                            }
                            return null;
                          },*/
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: height * 0.050,
                      ),
                      Container(
                        // color: Colors.grey,
                        height: height * 0.033,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            child: Container(
                              child: Text(
                                'Recover Password ?',
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 16,
                                    color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const RecoverPassword()));
                            },
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        // color: Colors.grey,
                        // height: 33,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            child: Container(
                              child: Text(
                                'Create an Account',
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 16,
                                    color: AppColors.underlineTextcolorheading,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const CreateNewAccount()));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.030,
                  ),
                  SizedBox(
                    // height: 67,
                    // width: 362,
                    height: height * 0.067,
                    width: width * 362,
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              Utils.checkLogin = true;
                            });

                            // (Route<dynamic> route) => false);
                            //
                            if (formKey.currentState!.validate()) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const dashboardScreen(selectedIndex: 0)),
                                      (Route<dynamic> route) => false);
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(
                              //       content: Text('Processing Data')),
                              // );
                            }

                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryColorpink, // background
                          ),
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                          label: const Align(
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 18,
                                    color: AppColors.buttongrey,
                                    fontWeight: FontWeight.w700),
                              )),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.050,
                  ),
                  const Text(
                    "Or Easily Using",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      // fontSize: 20,
                      color: Colors.grey,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: height * 0.050,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          child: Container(
                            width: height * 0.060,
                            height: height * 0.060,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              // border: Border.all(color: Colors.grey, width: 1),
                              shape: BoxShape.circle,
                              // color: Colors.white
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 72.0,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                AssetImage('assets/Facebook.png'),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const welcome()));
                          }),
                      const SizedBox(
                        width: 25,
                      ),
                      InkWell(
                          child: Container(
                            width: height * 0.060,
                            height: height * 0.060,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[100],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 72.0,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                AssetImage('assets/search.png'),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const welcome()));
                          }),
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(height: height*0.00,),
          ],
        ),
      ),
    );

  }
}
