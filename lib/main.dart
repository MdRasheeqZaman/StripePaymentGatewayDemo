import 'package:flutter/material.dart';
import 'package:stripe_payment_gateway_demo/pages/existing_cards.dart';
import 'package:stripe_payment_gateway_demo/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: '/home',
      routes: {
        '/home' : (context) => HomePage(),
        '/existing-cards' : (context) => ExistingCardsPage(),
      },
    );
  }
}