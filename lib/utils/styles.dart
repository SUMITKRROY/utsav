import 'package:flutter/material.dart';

import 'app_color.dart';

class Styles {
  static TextStyle h1() {
    return const TextStyle(
        fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white);
  }
  static const SidemenuTextStyle = TextStyle(
      fontFamily: 'NotoSans',
      fontSize: 16,
      color: AppColors.Textcolorheading,
      fontWeight: FontWeight.w400);
  static const drwerStyle500 =  TextStyle(
      fontFamily: 'NotoSans',
      fontSize: 16,
      color: AppColors.Textcolorheading,
      fontWeight: FontWeight.w600);

  static friendsBox() {
    return const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)));
  }

  static messagesCardStyle(check) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: check ? Colors.indigo.shade300: Colors.grey.shade300,
    );
  }

  static messageFieldCardStyle() {
    return BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.indigo),
        borderRadius: BorderRadius.circular(10));
  }

  static messageTextFieldStyle({required Function() onSubmit}) {
    return InputDecoration(
      border: InputBorder.none,
      hintText: 'Enter Message',
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      suffixIcon: IconButton(onPressed: onSubmit, icon: const Icon(Icons.send)),
    );
  }
  static searchTextFieldStyle() {
    return InputDecoration(
      border: InputBorder.none,
      hintText: 'Search here',
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded)),
    );
  }
  static searchField({Function(String)? onChange}) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
       onChanged: onChange,
        decoration: Styles.searchTextFieldStyle(),
      ),
      decoration: Styles.messageFieldCardStyle(),
    );
  }
  static const H1Headings = TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 18,
      color: AppColors.Textcolorheadingblack,
      fontWeight: FontWeight.w600);
  static const SkUStyle = TextStyle(
    fontFamily: 'SourceSansPro',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.Textcolorgreay,
    // decoration: TextDecoration.lineThrough,
  );
  static const headingStyle = TextStyle(
      fontFamily: 'NotoSans',
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold);
  static const chipstextStyle =  TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w400);


  static const Readmore = TextStyle(
    fontFamily: 'SourceSansPro',
    color: Colors.blue,
    fontWeight: FontWeight.w400,
    fontSize: 15,
  );
  static const prizeStyle3 = TextStyle(
    color:
    AppColors.pricecolor,
    fontSize: 16,
    fontFamily:
    "SourceSansPro",
    fontWeight:
    FontWeight.w600,
  );
  static const FreeStyle = TextStyle(
    color:
    AppColors.pricecolor,
    fontSize: 15,
    fontFamily:
    "SourceSansPro",
    fontWeight:
    FontWeight.w600,
  );
  static const prizeStyle5 = TextStyle(
    fontFamily:
    'SourceSansPro',
    fontSize: 14,
    fontWeight:
    FontWeight.w400,
    color: AppColors.Textcolorgreay,
    decoration: TextDecoration
        .lineThrough,
  );
  static const offprizeStyle = TextStyle(
    color: AppColors.pricecolor,
    fontSize: 14,
    fontFamily: "SourceSansPro",
    fontWeight: FontWeight.w400,
  );
  static const inculedingStyle = TextStyle(
    color: Colors.grey,
    fontFamily: 'SourceSansPro',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    // decoration: TextDecoration.lineThrough,
  );
  static const decStyle = TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 15,
      color: AppColors.Textcolorheadingblack,
      fontWeight: FontWeight.w400);

  static const dropdownin = TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 16,
      color: Colors.black,
      fontWeight:
      FontWeight.w600);
  static const H1Headings15 = TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 15,
      color: AppColors.Textcolorheadingblack,
      fontWeight: FontWeight.w600);


  static const formfieldHeadingText = TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 14,
      color: AppColors.Textcolorheadingblack,
      fontWeight: FontWeight.w600
  );
  static const formfieldHeadingText16 = TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 16,
      color: AppColors.Textcolorheading,
      fontWeight: FontWeight.w600);
  static const formfieldhintStyle = TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 16,
      // color: AppColors.Textcolorheadingblack,
      color:Colors.grey,
      fontWeight: FontWeight.w400
    // fontWeight: FontWeight.bold
  );
}
