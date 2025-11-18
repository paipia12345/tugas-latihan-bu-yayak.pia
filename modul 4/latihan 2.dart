class User {
  String _name;
  String _email;
  int _age;

  User(this._name, this._email, this._age) {
    if (!_email.contains("@")) {
      throw ArgumentError("Email tidak valid: harus mengandung '@'");
    }

    if (_age < 13 || _age > 120) {
      throw ArgumentError("Usia harus antara 13 dan 120 tahun");
    }
  }

  String get name => _name;
  String get email => _email;
  int get age => _age;

  bool get isAdult => _age >= 18;

  String get displayName {
    String kategori = _age < 18 ? " (Teen)" : " (Adult)";
    return _name + kategori;
  }
}

void main() {
  var user = User("Pia", "pia3652@gmail.com", 17);

  print("Name: ${user.name}");
  print("Email: ${user.email}");
  print("Age: ${user.age}");
  print("Is Adult: ${user.isAdult}");
  print("Display Name: ${user.displayName}");
}
