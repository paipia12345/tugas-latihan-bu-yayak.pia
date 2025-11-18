class Expense {
  String description;
  double amount;
  String category;
  DateTime date;
  String? notes;

  Expense(
    this.description,
    this.amount,
    this.category,
    this.date, {
    this.notes,
  });

  Expense.splitBill(
    String description,
    double totalAmount,
    int numberOfPeople,
  )   : description = '$description (split $numberOfPeople)',
        amount = totalAmount / numberOfPeople,
        category = 'Shared',
        date = DateTime.now(),
        notes = 'Split bill untuk $numberOfPeople orang';

  Expense.tip(
    String description,
    double baseAmount,
    double tipPercent,
  )   : description = '$description + tip',
        amount = baseAmount + (baseAmount * (tipPercent / 100)),
        category = 'Food & Drinks',
        date = DateTime.now(),
        notes = 'Tip sebesar $tipPercent%';

  Expense.recurring(
    String description,
    double amount,
    String frequency,
  )   : description = description,
        amount = amount,
        category = 'Subscription',
        date = DateTime.now(),
        notes = 'Recurring: $frequency';
}

void main() {
  var bill = Expense.splitBill('Makan bareng teman', 200000, 4);
  var lunch = Expense.tip('Lunch', 50000, 15);
  var netflix = Expense.recurring('Netflix', 55000, 'monthly');

  print('${bill.description}: Rp${bill.amount} - ${bill.notes}');
  print('${lunch.description}: Rp${lunch.amount} - ${lunch.notes}');
  print('${netflix.description}: Rp${netflix.amount} - ${netflix.notes}');
}
