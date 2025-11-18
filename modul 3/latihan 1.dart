class Budget {
  String category;
  double limit;
  int month;
  int year;

  Budget({
    required this.category,
    required this.limit,
    required this.month,
    required this.year,
  });

  Budget.monthly({
    required this.category,
    required this.limit,
  })  : month = DateTime.now().month,
        year = DateTime.now().year;

  void describe() {
    print('Kategori: $category | Batas: ${limit.toStringAsFixed(2)} '
          '| Periode: $month/$year');
  }
}

void main() {
  var dailyBudget = Budget.monthly(category: 'Transport', limit: 300.0);

  var customBudget = Budget(
    category: 'Hiburan',
    limit: 750.0,
    month: 11,
    year: 2026,
  );

  dailyBudget.describe();
  customBudget.describe();
}
