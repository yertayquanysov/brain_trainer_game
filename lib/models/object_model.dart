class ObjectModel {
  final int index;
  bool isActive;
  bool isTapped;
  bool isColored;
  bool isError;

  ObjectModel({
    required this.index,
    this.isActive = false,
    this.isTapped = false,
    this.isColored = false,
    this.isError = false,
  });

  ObjectModel resetState() {
    return ObjectModel(
      index: this.index,
      isActive: false,
      isTapped: false,
      isColored: false,
      isError: false,
    );
  }

  Object errorTap() {
    this.isError = true;
    this.isColored = false;
    return this;
  }

  ObjectModel hideColor() {
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
