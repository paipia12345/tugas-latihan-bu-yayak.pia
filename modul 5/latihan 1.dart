class Expense {
  String description;
  double amount;
  String category;
  DateTime date;
  String? notes;

  Expense(this.description, this.amount, this.category, this.date, {this.notes});

  int getWeekNumber() {
    final firstDay = DateTime(date.year, 1, 1);
    final difference = date.difference(firstDay).inDays;
    return (difference / 7).floor() + 1;
  }

  int getQuarter() {
    return ((date.month - 1) ~/ 3) + 1;
  }

  bool isWeekend() {
    return date.weekday == DateTime.saturday ||
           date.weekday == DateTime.sunday;
  }
}

void main() {
  var expense = Expense('Belanja', 150000, 'Kebutuhan', DateTime.now());

  print('Week number: ${expense.getWeekNumber()}');
  print('Quarter: ${expense.getQuarter()}');
  print('Is weekend: ${expense.isWeekend()}');
}
