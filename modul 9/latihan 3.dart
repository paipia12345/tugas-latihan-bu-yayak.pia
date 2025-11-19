class Expense {
  String description;
  double amount;
  String category;

  Expense(this.description, this.amount, this.category);

  void printDetails() {
    print("- $description: \$${amount.toStringAsFixed(2)} [$category]");
  }
}

class User {
  String username;
  String email;
  List<Expense> _expenses = [];

  User(this.username, this.email);

  void addExpense(String description, double amount, String category) {
    _expenses.add(Expense(description, amount, category));
    print("Pengeluaran '$description' sebesar \$${amount.toStringAsFixed(2)} ditambahkan untuk $username");
  }

  void viewExpenses() {
    print("\n--- Pengeluaran $username ---");
    if (_expenses.isEmpty) {
      print("Belum ada pengeluaran.");
      return;
    }
    for (var e in _expenses) {
      e.printDetails();
    }
    print("---------------------------\n");
  }

  void viewProfile() {
    double total = _expenses.fold(0, (sum, e) => sum + e.amount);
    print("\n=== Profil User: $username ===");
    print("Email: $email");
    print("Jumlah pengeluaran: \$${total.toStringAsFixed(2)}");
    print("Jumlah transaksi: ${_expenses.length}");
    print("==============================\n");
  }

  List<Expense> get expenses => List.unmodifiable(_expenses);
}
class UserManager {
  final Map<String, User> _users = {};

  User login(String username, String email) {
    if (_users.containsKey(username)) {
      print("Login berhasil: $username");
      return _users[username]!;
    } else {
      print("User '$username' tidak ditemukan. Membuat akun baru...");
      User user = User(username, email);
      _users[username] = user;
      return user;
    }
  }

  List<User> get allUsers => List.unmodifiable(_users.values);
}

void main() {
  UserManager userManager = UserManager();

  User user1 = userManager.login("deffa", "deffa@example.com");
  User user2 = userManager.login("ria", "ria@example.com");

  user1.addExpense("Makan siang", 50, "Makanan");
  user1.addExpense("Transportasi ojek", 20, "Transportasi");

  user2.addExpense("Langganan Netflix", 15, "Hiburan");
  user2.addExpense("Snack", 10, "Makanan");

  user1.viewExpenses();
  user2.viewExpenses();

  user1.viewProfile();
  user2.viewProfile();
}
