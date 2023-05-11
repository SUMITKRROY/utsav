import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

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

  void startPayment() {
    final options = {
      'key': 'rzp_test_A9vIQElA3Cv9O7',
      'amount': 1000, // amount in paisa
      'name': 'sumit',
      'description': 'Test payment',
      'prefill': {'contact': '9876543210', 'email': 'john.doe@example.com'},
    };

    try {
      razorpay!.open(options);
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
              child: Text('Pay Now'),
              onPressed: startPayment,
            ),
          ],
        ),
      ),
    );
  }
}
