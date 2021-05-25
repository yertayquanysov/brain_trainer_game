import 'package:flutter/material.dart';

class ObjectModel {
  final int index;
  bool isShowed;
  bool isClicked;

  ObjectModel({
    required this.index,
    this.isShowed = false,
    this.isClicked = false,
  });

  ObjectModel changeState() {
    return ObjectModel(
      index: this.index,
      isShowed: false,
      isClicked: false,
    );
  }

  @override
  String toString() {
    return {
      "index": index.toString(),
      "isShowed": isShowed,
      "isClicked": isClicked,
    }.toString();
  }
}
