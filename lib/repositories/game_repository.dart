import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamx/components/grid_item.dart';
import 'package:gamx/config.dart';
import 'package:gamx/extensions.dart';

import '../models/object_model.dart';

abstract class GameRepository {
  void generateGridItems();

  void setGridCount(int count);

  void showClickableItems();

  Stream<List<GridItem>> stream();

  void dispose();
}

class GameRepositoryImpl implements GameRepository {
  int gridCount = defaultGridCount;

  final StreamController<List<GridItem>> _streamController = StreamController();

  List<ObjectModel> _generatedObjects = [];
  List<int> lastPositions = [];
  int successTapCount = 0;

  @override
  void setGridCount(int count) => gridCount = count;

  GameRepositoryImpl() {
    _generatedObjects =
        List.generate(gridCount, (idx) => ObjectModel(index: idx)).toList();
  }

  List<ObjectModel> clearActiveObjects() {
    return _generatedObjects.map((e) => e.changeState()).toList();
  }

  @override
  Stream<List<GridItem>> stream() => _streamController.stream;

  @override
  void showClickableItems() {
    successTapCount = 0;

    lastPositions = generateItemPositions(positionCount: 3, max: gridCount);

    print("showClickableItems: $lastPositions");

    final List<ObjectModel> newObjects = clearActiveObjects();

    lastPositions.forEach(
      (index) => newObjects[index].isShowed = true,
    );

    print(newObjects.where((element) => element.isShowed == true).length);

    _generatedObjects = newObjects;

    generateGridItems();
  }

  void onGridTap(ObjectModel gridItem) {
    if (gridItem.isShowed && !gridItem.isClicked) {
      successTapCount++;
      _generatedObjects[gridItem.index].isClicked = true;
    }

    if (successTapCount >= 3) {
      showClickableItems();
    }
  }

  @override
  void generateGridItems() {
    final gridItems = _generatedObjects
        .map(
          (e) => GridItem(
            color: e.isShowed ? Colors.greenAccent : Colors.white,
            onPressed: () => onGridTap(e),
          ),
        )
        .toList();
    _streamController.sink.add(gridItems);
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
