import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_payment_gateway_demo/pages/home.dart';
import 'package:stripe_payment_gateway_demo/pages/new_card.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51JK5VvALelVI1KeUNDlGnKLsMmH0cUrgxMr8SuEHDOdxJxcUa3wyrcc2xh4s3UEe2JlPQ70D32droyAW47vslR1E00a21OQ7Lg';
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
        HomePage.routeName : (context) => HomePage(),
        NewCard.routeName : (context) => NewCard(),
      },
    );
  }
}