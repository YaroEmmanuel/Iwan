abstract class BasicModel {
  int? id;
  BasicModel({this.id});

  Map<String, dynamic> toJson();
  @override
  String toString();
}
