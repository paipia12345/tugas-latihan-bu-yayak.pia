abstract class Refundable {
  void refund(double amount);
}
class PaymentMethod {
  String methodName;

  PaymentMethod(this.methodName);

  void printDetails() {
    print("Payment Method: $methodName");
  }
}

class CreditCardPayment extends PaymentMethod implements Refundable {
  String cardNumber;

  CreditCardPayment(this.cardNumber) : super("Credit Card");

  @override
  void refund(double amount) {
    print("Refunded \$$amount to card $cardNumber");
  }

  @override
  void printDetails() {
    super.printDetails();
    print("Card Number: $cardNumber");
    print("Supports Refund: Yes");
  }
}

class CryptocurrencyPayment extends PaymentMethod {
  String walletAddress;
  String coinType;

  CryptocurrencyPayment(this.walletAddress, this.coinType)
      : super("Cryptocurrency");

  @override
  void printDetails() {
    super.printDetails();
    print("Coin Type: $coinType");
    print("Wallet Address: $walletAddress");
    print("Supports Refund: No");
  }
}

void main() {
  CreditCardPayment credit = CreditCardPayment("1234-5678-9012-3456");
  credit.printDetails();
  credit.refund(50.0);

  print("");

  CryptocurrencyPayment crypto =
      CryptocurrencyPayment("1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa", "Bitcoin");
  crypto.printDetails();
}
