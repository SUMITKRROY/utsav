import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final razorpay = Razorpay();

  @override
  void initState() {
    super.initState();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    setState(() {
      Fluttertoast.showToast(
          msg: "SUCCESS: " + response.paymentId!, timeInSecForIosWeb: 4);
    });
  }

  void handlePaymentError(PaymentFailureResponse response) {
    setState(() {
      Fluttertoast.showToast(
          msg: "ERROR: " + response.code.toString() + " - " + response.message!,
          timeInSecForIosWeb: 4);
    });
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!, timeInSecForIosWeb: 4);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }
  /*Future<void> makePayment() async {
    final apiKey = 'YOUR_API_KEY';
    final apiSecret = 'YOUR_API_SECRET';

    final url = 'https://api.rogerpay.com/payments'; // The API endpoint for creating payments

    // Replace the following values with your desired payment details
    final amount = 10.0;
    final currency = 'USD';
    final description = 'Payment for goods';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey:$apiSecret',
    };

    final body = jsonEncode({
      'amount': amount,
      'currency': currency,
      'description': description,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        // Payment request was successful
        // You can handle the response here
      } else {
        // Handle errors or unexpected response codes
      }
    } catch (e) {
      // Handle network or API call errors
    }
  }*/

  void startPayment() {
    final options = {
      'key': 'rzp_test_zPZbyKzTSLfL4E',
      'amount': 1000, // amount in paisa
      'name': 'sumit',
      'description': 'Test payment',
      'prefill': {'contact': '7352120518', 'email': 'priencraj32@gmail.com'},
    };

    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Amount: \$1000.00'),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                startPayment();
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
