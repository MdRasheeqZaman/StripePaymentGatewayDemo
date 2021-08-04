import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_payment_gateway_demo/services/payment_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          CardField(
            onCardChanged: (card) {
              print('C1: $card');
            },
          ),
          TextButton(
            onPressed: (){ onPayPress(context);},
            child: Text('pay'),
          )
          /*ListView.separated(
              itemBuilder: (context, index){
                Icon icon = Icon((index == 0) ? Icons.add_rounded : Icons.credit_card, color: themeData.primaryColor,);
                Text text = Text((index == 0) ? 'Pay via New Card' : 'Pay via Existing Card');
                return InkWell(
                  onTap: () => onItemPress(context, index),
                  child: ListTile(
                    title: text,
                    leading: icon,
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: themeData.primaryColor,
              ),
              itemCount: 2
          )*/
        ],
      ),
    );
  }

  onPayPress(BuildContext context) async {
    StripeTransactionResponse response = await StripeService.payWithNewCard(amount: '15000', currency: 'USD');
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.message), duration: Duration(milliseconds: 3000),)
    );
  }
}
