import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class demopage extends StatefulWidget {
  const demopage({Key? key}) : super(key: key);

  @override
  State<demopage> createState() => _demopageState();
}

class _demopageState extends State<demopage> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        SharedPreferences prefs = snapshot.data!;
        String firstName = prefs.getString('firstName') ?? '';
        String lastName = prefs.getString('lastName') ?? '';
        String email = prefs.getString('email') ?? '';

        return Column(
          children: [
            Text('First Name: $firstName'),
            Text('Last Name: $lastName'),
            Text('Email: $email'),
          ],
        );
      },
    );
  }
}
