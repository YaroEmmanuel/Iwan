enum Status {
  completed,
  cancelled,
  refunded;

  static Status fromString(String value) {
    try {
      return Status.values
          .where(
            (item) => item.name.toString().toLowerCase() == value.toLowerCase(),
          )
          .first;
    } catch (e) {
      throw ArgumentError(
        "Invalid input $e:\nValue: $value,\nClass: enum Status",
      );
    }
  }
}
