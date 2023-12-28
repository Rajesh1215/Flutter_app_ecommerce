import 'package:flutter/material.dart';

enum PaymentStatus {
  pending,
  completed,
}

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  List<PaymentTransaction> completedTransactions = [
    PaymentTransaction(
      orderId: '123456',
      status: PaymentStatus.completed,
      amount: 100,
      paymentProofImage: 'assets/images/payment_proof_1.png',
    ),
    PaymentTransaction(
      orderId: '789012',
      status: PaymentStatus.completed,
      amount: 200,
      paymentProofImage: 'assets/images/payment_proof_2.png',
    ),
    PaymentTransaction(
      orderId: '345678',
      status: PaymentStatus.completed,
      amount: 150,
      paymentProofImage: 'assets/images/payment_proof_3.png',
    ),
  ];

  Widget buildPaymentContainer(PaymentTransaction transaction) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Image.asset(transaction.paymentProofImage),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: ${transaction.orderId}'),
            SizedBox(height: 8.0),
            Text('Amount: \$${transaction.amount.toString()}'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: completedTransactions.length,
          itemBuilder: (context, index) {
            final transaction = completedTransactions[index];
            return buildPaymentContainer(transaction);
          },
        ),
      ),
    );
  }
}

class PaymentTransaction {
  final String orderId;
  final PaymentStatus status;
  final double amount;
  final String paymentProofImage;

  PaymentTransaction({
    required this.orderId,
    required this.status,
    required this.amount,
    required this.paymentProofImage,
  });
}

