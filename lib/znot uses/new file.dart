import 'package:flutter/material.dart';
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
      // update UI with payment success status
    });
  }

  void handlePaymentError(PaymentFailureResponse response) {
    setState(() {

    });
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    // handle external wallet response
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void startPayment() {
    final options = {
      'key': '<your-key-id>',
      'amount': 1000, // amount in paisa
      'name': 'Acme Corp.',
      'description': 'Test payment',
      'prefill': {'contact': '9876543210', 'email': 'john.doe@example.com'},
    };

    razorpay.open(options);
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
            Text('Total Amount: \$10.00'),
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
