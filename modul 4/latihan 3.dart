class BankAccount {
  String _accountHolder;
  double _balance;
  int _pin;

  BankAccount(this._accountHolder, this._balance, this._pin);

  String get accountHolder => _accountHolder;
  double get balance => _balance;

  void deposit(double amount) {
    if (amount <= 0) {
      throw ArgumentError("Deposit harus lebih dari 0");
    }
    _balance += amount;
    print("Deposit berhasil: $amount");
  }

  void withdraw(double amount, int pin) {
    if (pin != _pin) {
      throw ArgumentError("PIN salah! Tidak bisa withdraw.");
    }
    if (amount > _balance) {
      throw ArgumentError("Saldo tidak cukup.");
    }
    if (amount <= 0) {
      throw ArgumentError("Withdraw harus lebih dari 0");
    }

    _balance -= amount;
    print("Withdraw berhasil: $amount");
  }

  void changePin(int oldPin, int newPin) {
    if (oldPin != _pin) {
      throw ArgumentError("PIN lama salah!");
    }
    _pin = newPin;
    print("PIN berhasil diganti.");
  }
}

void main() {
  var account = BankAccount("Pia", 1000000, 1234);

  print("Pemilik akun: ${account.accountHolder}");
  print("Saldo awal: ${account.balance}");

  account.deposit(250000);
  print("Saldo sekarang: ${account.balance}");

  account.withdraw(300000, 1234);
  print("Saldo sekarang: ${account.balance}");

  account.changePin(1234, 5678);

  account.withdraw(100000, 5678);
  print("Saldo sekarang: ${account.balance}");
}
