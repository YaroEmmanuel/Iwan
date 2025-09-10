enum PaymentMethod {
  cash,
  mobile;

  static PaymentMethod fromString(String value) {
    try {
      return PaymentMethod.values
          .where(
            (item) => item.name.toString().toLowerCase() == value.toLowerCase(),
          )
          .first;
    } catch (e) {
      throw ArgumentError(
        "Invalid input $e:\nValue: $value,\nClass: enum PaymentMethod",
      );
    }
  }
}
