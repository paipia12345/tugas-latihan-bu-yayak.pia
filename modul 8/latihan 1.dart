class PaymentMethod {
  String methodName;

  PaymentMethod(this.methodName);

  bool validate() {
    return true;
  }

  void printDetails() {
    print("Payment Method: $methodName");
  }
}

class Cryptocurrency extends PaymentMethod {
  String walletAddress;
  String coinType;

  Cryptocurrency(this.walletAddress, this.coinType)
      : super("Cryptocurrency");

  @override
  bool validate() {
    return walletAddress.isNotEmpty;
  }

  @override
  void printDetails() {
    super.printDetails();
    print("Coin Type    : $coinType");
    print("Wallet Address: $walletAddress");
    print("Valid Wallet : ${validate() ? "Yes" : "No"}");
  }
}

void main() {
  Cryptocurrency crypto = Cryptocurrency(
    "1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa",
    "Bitcoin",
  );

  crypto.printDetails();
}
