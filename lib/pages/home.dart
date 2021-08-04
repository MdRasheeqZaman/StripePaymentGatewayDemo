import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stripe_payment_gateway_demo/pages/new_card.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final payController = TextEditingController();

  @override
  void dispose() {
    payController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: payController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Amount',
                    prefixIcon: Icon(Icons.money)
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ]
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: (){
                int payment = int.parse(payController.text);
                Navigator.pushNamed(context, NewCard.routeName, arguments: (payment*100).toString());
              },
              child: Text('Pay'),
            ),
          )
        ],
      ),
    );
  }
}
