import 'package:flutter/material.dart';
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
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView.separated(
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
        ),
      ),
    );
  }

  onItemPress(BuildContext context, int index) {
    switch(index){
      case 0:
        StripeTransactionResponse response = StripeService.payWithNewCard(amount: '15000', currency: 'USD');
        if(response.success){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.message), duration: Duration(milliseconds: 2000),)
          );
        }
        break;
      case 1:
        Navigator.pushNamed(context, '/existing-cards');
        break;
    }
  }
}
