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

class RecurringExpense extends Expense {
  RecurringExpense(String description, double amount, String category)
      : super(description, amount, category);
}

class SubscriptionExpense extends RecurringExpense {
  String provider;
  String plan;
  DateTime startDate;
  DateTime endDate;

  SubscriptionExpense(
    String description,
    double amount,
    String category,
    this.provider,
    this.plan,
    this.startDate,
    this.endDate,
  ) : super(description, amount, category);

  bool isActive() {
    DateTime now = DateTime.now();
    return now.isAfter(startDate) && now.isBefore(endDate);
  }

  int getRemainingMonths() {
    DateTime now = DateTime.now();
    if (now.isAfter(endDate)) return 0;

    int yearDiff = endDate.year - now.year;
    int monthDiff = endDate.month - now.month;
    int totalMonths = yearDiff * 12 + monthDiff;

    if (endDate.day >= now.day) totalMonths += 1;

    return totalMonths;
  }

  double getTotalCost() {
    int totalMonths = (endDate.year - startDate.year) * 12 +
        (endDate.month - startDate.month) +
        1;
    return totalMonths * amount;
  }

  @override
  void printDetails() {
    super.printDetails();
    print("Provider: $provider");
    print("Plan: $plan");
    print("Start Date: ${startDate.toIso8601String().split('T')[0]}");
    print("End Date: ${endDate.toIso8601String().split('T')[0]}");
    print("Active: ${isActive() ? "Yes" : "No"}");
    print("Remaining Months: ${getRemainingMonths()}");
    print("Total Cost: ${getTotalCost()}");
  }
}

void main() {
  SubscriptionExpense sub = SubscriptionExpense(
    "Spotify Subscription",
    5.0, 
    "Entertainment",
    "Spotify",
    "Premium",
    DateTime(2025, 1, 1),
    DateTime(2025, 12, 31),
  );

  sub.printDetails();
}
