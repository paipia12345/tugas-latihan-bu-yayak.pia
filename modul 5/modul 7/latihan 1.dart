class Expense {
  String description;
  double amount;
  String category;

  Expense(this.description, this.amount, this.category);

  void printDetails() {
    print("Description: $description");
    print("Amount: $amount");
    print("Category: $category");
  }
}

class BusinessExpense extends Expense {
  String client;
  bool isReimbursable;

  BusinessExpense(
    String description,
    double amount,
    String category,
    this.client,
    this.isReimbursable,
  ) : super(description, amount, category);

  @override
  void printDetails() {
    super.printDetails();
    print("Client: $client");
    print("Reimbursable: ${isReimbursable ? "Yes" : "No"}");
  }
}

void main() {
  BusinessExpense expense = BusinessExpense(
    "Meeting Lunch",
    150.0,
    "Food",
    "PT Maju Bersama",
    true,
  );

  expense.printDetails();
}
