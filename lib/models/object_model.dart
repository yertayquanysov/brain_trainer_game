class ObjectModel {
  final int index;
  bool isActive;
  bool isTapped;
  bool isColored;

  ObjectModel({
    required this.index,
    this.isActive = false,
    this.isTapped = false,
    this.isColored = false,
  });

  ObjectModel resetState() {
    return ObjectModel(
      index: this.index,
      isActive: false,
      isTapped: false,
      isColored: false,
    );
  }

  ObjectModel hideColor(){
    this.isColored = false;
    return this;
  }

  @override
  String toString() {
    return {
      "index": index.toString(),
      "isActive": isActive,
      "isTapped": isTapped,
      "isColored": isColored,
    }.toString();
  }
}
