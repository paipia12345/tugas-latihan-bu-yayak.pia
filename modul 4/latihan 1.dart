class Category {
  String _name;
  String _icon;
  double _budget;

  Category(this._name, this._icon, this._budget);

  String get name => _name;
  String get icon => _icon;
  double get budget => _budget;

  set budget(double value) {
    if (value > 0) {
      _budget = value;
    } else {
      throw ArgumentError("Budget harus bernilai positif");
    }
  }

  bool isOverBudget(double spent) => spent > _budget;
}

void main() {
  var cat = Category("Food", "🍔", 500000);

  print("Nama Category: ${cat.name}");
  print("Icon: ${cat.icon}");
  print("Budget: ${cat.budget}");

  double spent = 650000;
  print("Spent: $spent");
  print("Is Over Budget? ${cat.isOverBudget(spent)}");

  cat.budget = 700000;
  print("Budget Baru: ${cat.budget}");

}
