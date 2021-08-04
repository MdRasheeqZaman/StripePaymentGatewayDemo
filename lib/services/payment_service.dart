import 'dart:convert';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeTransactionResponse {
  String message;
  bool success;
  StripeTransactionResponse({required this.message, required this.success});
}

class StripeService {
  static String apiBase = 'https://api.stripe.com/v1';
  static String paymentApiUrl = '$apiBase/payment_intents';
  static String secret = 'sk_test_51JK5VvALelVI1KeUM3EZ40GpxXHR8BN7cAuyGlkc613zIpH6WDKO3r5NqYjqzP9NwNgvCrOBZliMuzNWPzei9oUZ00QEM50CBT';
  static Map<String, String> headers = {
    'Authorization': 'Bearer $secret',
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  static Future<StripeTransactionResponse> payWithNewCard({required String amount, required String currency}) async {
    try{
      PaymentMethod paymentMethod = await Stripe.instance.createPaymentMethod(PaymentMethodParams.card());
      print('C2: $paymentMethod');

      Map<String, dynamic>? paymentIntent = await createPaymentIntent(amount, currency);
      print('C6: $paymentIntent');

      PaymentIntent response = await Stripe.instance.confirmPayment(
          paymentIntent?['client_secret'],
          PaymentMethodParams.cardFromMethodId(paymentMethodId: paymentMethod.id)
      );
      print('C8: $response');

      return StripeTransactionResponse(message: 'Transaction Successful', success: true);
    }catch(err){
      print('C3: $err');
      return StripeTransactionResponse(message: 'Transaction Failed', success: false);
    }
  }

  static Future<Map<String, dynamic>?> createPaymentIntent(String amount, String currency) async {
    try{
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      http.Response response = await http.post(
          Uri.parse(paymentApiUrl),
          body: body,
          headers: headers
      );
      return jsonDecode(response.body);
    }catch(err){
      print('C4: $err');
    }
    return null;
  }
}