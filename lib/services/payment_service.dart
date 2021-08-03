class StripeTransactionResponse {
  String message;
  bool success;
  StripeTransactionResponse({required this.message, required this.success});
}

class StripeService {
  static String apiBase = 'https://api.base.com//v1';
  static String secret = '';

  static StripeTransactionResponse payWithNewCard({required String amount, required String currency}){
    return StripeTransactionResponse(message: 'Transaction Successful', success: true);
  }
}