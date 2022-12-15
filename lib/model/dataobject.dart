class DataObject {
  DataObject(
      {required this.type,
      required this.category,
      required this.info1,
      required this.info2,
      required this.renewed,
      required this.date,
      this.due});

  final String type;
  final String category;
  final String info1;
  final String info2;
  final String date;
  final bool renewed;
  String? due = "";

  factory DataObject.fromMap(Map data) {
    return DataObject(
        type: data["type"],
        category: data["category"],
        info1: data["info1"],
        info2: data["info2"],
        date: data["date"],
        renewed: data["renewed"],
        due: data["due"].toString());
  }
}
