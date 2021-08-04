import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:stripe_payment_gateway_demo/services/payment_service.dart';

class NewCard extends StatefulWidget {
  static const routeName = '/new-card';

  const NewCard({Key? key}) : super(key: key);

  @override
  _NewCardState createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  final RoundedLoadingButtonController btnPayController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('New Card'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CardField(
              onCardChanged: (card) {},
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: RoundedLoadingButton(
              onPressed: (){ onPayPress(context, args);},
              controller: btnPayController,
              child: Text('Pay'),
            ),
          )
        ],
      ),
    );
  }

  onPayPress(BuildContext context, String amount) async {
    StripeTransactionResponse response = await StripeService.payWithNewCard(amount: amount, currency: 'USD');
    if(response.success) {
      btnPayController.success();
    }else{
      btnPayController.error();
    }
    int msgDuration= 3;
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.message), duration: Duration(milliseconds: msgDuration*1000),)
    );
    Timer(Duration(seconds: msgDuration), () {
      btnPayController.reset();
    });
  }
}
