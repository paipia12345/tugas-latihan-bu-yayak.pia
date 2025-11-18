class Expense {
  String description;
  double amount;
  String category;
  DateTime date;
  String? notes;

  Expense(this.description, this.amount, this.category, this.date, {this.notes});

  int getAmountRounded() {
    return amount.round();
  }

  double getDailyAverage(int days) {
    return amount / days;
  }

  double projectedYearly() {
    return amount * 12;
  }
}

void main() {
  var exp = Expense('Belanja bulanan', 850000, 'Kebutuhan', DateTime.now());

  print('Dibulatkan: ${exp.getAmountRounded()}');
  print('Rata-rata per hari (30 hari): ${exp.getDailyAverage(30)}');
  print('Total tahunan: ${exp.projectedYearly()}');
}
