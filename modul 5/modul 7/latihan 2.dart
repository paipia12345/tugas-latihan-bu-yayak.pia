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

class TravelExpense extends Expense {
  String destination;
  int tripDuration;
  TravelExpense(
    String description,
    double amount,
    String category,
    this.destination,
    this.tripDuration,
  ) : super(description, amount, category);

  double getDailyCost() {
    if (tripDuration == 0) return 0;
    return amount / tripDuration;
  }

  bool isInternational() {
    return destination.toLowerCase() != "indonesia";
  }

  @override
  void printDetails() {
    super.printDetails();
    print("Destination: $destination");
    print("Trip Duration: $tripDuration days");
    print("Daily Cost: ${getDailyCost()}");
    print("International Trip: ${isInternational() ? "Yes" : "No"}");
  }
}

void main() {
  TravelExpense travel = TravelExpense(
    "Business Trip",
    3000.0,
    "Travel",
    "Singapore",
    3,
  );

  travel.printDetails();
}
