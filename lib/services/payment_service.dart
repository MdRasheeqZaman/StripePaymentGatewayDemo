import 'package:flutter_stripe/flutter_stripe.dart';

class StripeTransactionResponse {
  String message;
  bool success;
  StripeTransactionResponse({required this.message, required this.success});
}

class StripeService {
  static String apiBase = 'https://api.base.com//v1';
  static String secret = '';

  static Future<StripeTransactionResponse> payWithNewCard({required String amount, required String currency}) async {
    try{
      PaymentMethod paymentMethod = await Stripe.instance.createPaymentMethod(PaymentMethodParams.card());
      print('C2: $paymentMethod');
      return StripeTransactionResponse(message: 'Transaction Successful', success: true);
    }catch(err){
      print('C3: $err');
      return StripeTransactionResponse(message: 'Transaction Failed', success: false);
    }
  }
}