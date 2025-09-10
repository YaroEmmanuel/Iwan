enum Action {
  create,
  update,
  delete,
  view;

  static Action fromString(String value) {
    try {
      return Action.values
          .where(
            (item) => item.name.toString().toLowerCase() == value.toLowerCase(),
          )
          .first;
    } catch (e) {
      throw ArgumentError(
        "Invalid input $e:\nValue: $value,\nClass: enum Action",
      );
    }
  }
}
