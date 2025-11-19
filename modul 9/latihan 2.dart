class BudgetManager {
  final Map<String, double> _budgets = {};
  final Map<String, double> _expenses = {};

  void setBudget(String category, double amount) {
    _budgets[category] = amount;
    print("Budget untuk '$category' di-set sebesar \$${amount.toStringAsFixed(2)}");
  }

  void addExpense(String category, double amount) {
    if (!_budgets.containsKey(category)) {
      print("Kategori '$category' belum memiliki budget, silakan set budget terlebih dahulu.");
      return;
    }

    _expenses[category] = (_expenses[category] ?? 0) + amount;

    double spent = _expenses[category]!;
    double limit = _budgets[category]!;

    print("Pengeluaran \$${amount.toStringAsFixed(2)} ditambahkan ke '$category' (Total: \$${spent.toStringAsFixed(2)})");

    if (spent >= limit) {
      print("⚠️ Anda telah melebihi budget untuk '$category'!");
    } else if (spent >= 0.9 * limit) {
      print("⚠️ Peringatan: Pengeluaran '$category' mendekati limit (90%)");
    }
  }
  void generateReport() {
    print("\n=== Laporan Budget Bulanan ===");
    for (var category in _budgets.keys) {
      double spent = _expenses[category] ?? 0;
      double limit = _budgets[category]!;
      double remaining = limit - spent;

      print("Kategori: $category");
      print("  Budget: \$${limit.toStringAsFixed(2)}");
      print("  Pengeluaran: \$${spent.toStringAsFixed(2)}");
      print("  Sisa: \$${remaining.toStringAsFixed(2)}");

      if (spent >= limit) {
        print("  Status: ❌ Melebihi budget");
      } else if (spent >= 0.9 * limit) {
        print("  Status: ⚠️ Hampir penuh");
      } else {
        print("  Status: ✅ Aman");
      }
      print("-------------------------");
    }
  }
}

void main() {
  BudgetManager manager = BudgetManager();

  manager.setBudget("Makanan", 500);
  manager.setBudget("Transportasi", 200);
  manager.setBudget("Hiburan", 300);

  print("");

  manager.addExpense("Makanan", 100);
  manager.addExpense("Makanan", 350);
  manager.addExpense("Transportasi", 180);
  manager.addExpense("Hiburan", 290);
  manager.addExpense("Makanan", 80);

  manager.generateReport();
}
