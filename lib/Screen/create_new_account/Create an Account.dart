import 'package:flutter/material.dart';
import 'package:utsav/utils/styles.dart';

import '../../utils/app_color.dart';
import '../Login/Login_Screen.dart';
import '../navbarbottom.dart';
import '../welcome.dart';


 class CreateNewAccount extends StatefulWidget {
   const CreateNewAccount({Key? key}) : super(key: key);

   @override
   State<CreateNewAccount> createState() => _CreateNewAccountState();
 }

 class _CreateNewAccountState extends State<CreateNewAccount> {
   final formKey = GlobalKey<FormState>();
   bool isChecked = false;
   bool passwordVisible = false;
   bool passwordVisible1 = false;
   @override
   void initState() {
     super.initState();
     passwordVisible = true;
     passwordVisible1 = true;
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
         body: SizedBox(
           height: height,
           width: width,
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: ListView(
               children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                   child: Align(
                     alignment: Alignment.bottomCenter,
                     child: Image.asset(
                       "assets/welcome.png",
                       height: height * 0.065,
                       width: height * 0.070,
                     ),
                   ),
                 ),
                 SizedBox(
                   height: height * 0.010,
                 ),
                 const Text(
                   "Create an Account",
                   textAlign: TextAlign.center,
                   style: Styles.headingStyle,
                 ),
                 SizedBox(
                   height: height * 0.020,
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     children: [
                       Form(
                         key: formKey,
                         child: Column(
                           children: [
                             Align(
                               alignment: Alignment.topLeft,
                               child: Row(
                                 children: const [
                                   Text(
                                     "First Name",
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
                             TextFormField(
                               decoration: const InputDecoration(
                                 hintText: 'First  Name',
                                 hintStyle: Styles.formfieldhintStyle,
                               ),
                               validator: (value) {
                                 if (value == null || value.isEmpty) {
                                   return 'This is a required field.';
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
                                 children: const [
                                   Text(
                                     "Last Name",
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
                             TextFormField(
                               decoration: const InputDecoration(
                                 hintText: 'Last Name',
                                 hintStyle: Styles.formfieldhintStyle,
                               ),
                               validator: (value) {
                                 if (value == null || value.isEmpty) {
                                   return 'This is a required field.';
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
                                 children: const [
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
                             TextFormField(
                               autovalidateMode: AutovalidateMode.onUserInteraction,
                               keyboardType: TextInputType.emailAddress,
                               decoration: const InputDecoration(
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
                                 children: const [
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
                             TextFormField(
                               validator: (value) {
                                 if (value == null || value.isEmpty) {
                                   return 'This is a required field.';
                                 }
                                 return null;
                               },
                               obscureText: passwordVisible,
                               decoration: InputDecoration(
                                 hintText: 'XXXXXXXXXX',
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
                             ),
                             SizedBox(
                               height: height * 0.020,
                             ),
                           ],
                         ),
                       ),
                       SizedBox(
                         height: height * 0.010,
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
                         height: height * 0.020,
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
                                     backgroundImage: AssetImage(
                                         'images/socialImg/Facebook.png'),
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
                                     backgroundImage: AssetImage(
                                         'images/socialImg/Google.png'),
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
                       SizedBox(
                         height: height * 0.020,
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
                                 // (Route<dynamic> route) => false);
                                 //
                                 if (formKey.currentState!.validate()) {
                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) =>
                                           const dashboardScreen(
                                               selectedIndex: 0)));
                                 }
                               },
                               style: ElevatedButton.styleFrom(
                                 backgroundColor: AppColors.primaryColorpink, // background
                               ),
                               icon: const Icon(
                                 Icons.arrow_back,
                               ),
                               label: const Align(
                                   child: Text(
                                     "REGISTER",
                                     style: TextStyle(
                                         fontFamily: 'NotoSans',
                                         fontSize: 18,
                                         color: AppColors.buttongrey,
                                         fontWeight: FontWeight.w700),
                                   )),
                             )),
                       ),
                       const SizedBox(
                         height: 20,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           const Text(
                             'Already have an account? ',
                             style: TextStyle(
                               fontFamily: 'SourceSansPro',
                               color: Colors.black,
                             ),
                           ),
                           InkWell(
                             child: const Text(
                               'Login',
                               style: TextStyle(
                                   decoration: TextDecoration.underline,
                                   color: AppColors.underlineTextcolorheading
                                 // fontSize: 20
                               ),
                             ),
                             onTap: () {
                               Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                       builder: (context) =>
                                       const LoginScreen()));
                               // (Route<dynamic> route) => false);
                               //signup screen
                             },
                           )
                         ],
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),
           // mainAxisAlignment: MainAxisAlignment.center,
         ),
       ),
     );
   }
 }
