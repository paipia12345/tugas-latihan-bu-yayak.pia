class User {
  String name;
  String email;
  String currency;
  double monthlyBudget;
  bool notifications;

  User({
    required this.name,
    required this.email,
    required this.currency,
    required this.monthlyBudget,
    this.notifications = true,
  });

  User.quick(String name, String email)
      : name = name,
        email = email,
        currency = "USD",
        monthlyBudget = 2000,
        notifications = true;

  User.premium(String name, String email, double monthlyBudget)
      : name = name,
        email = email,
        currency = "USD",
        monthlyBudget = monthlyBudget,
        notifications = true;
}

void main() {
  var user1 = User(
    name: "Pia",
    email: "pia@email.com",
    currency: "IDR",
    monthlyBudget : 3500000,
  );

  var quickUser = User.quick("Budi", "budi@gmail.com");

  var premiumUser = User.premium("Sinta", "sinta@gmail.com", 5000);

  print("User 1: ${user1.name}, Currency: ${user1.currency}");
  print("Quick: ${quickUser.name}, Budget: ${quickUser.monthlyBudget}");
  print("Premium: ${premiumUser.name}, Notif: ${premiumUser.notifications}");
}
