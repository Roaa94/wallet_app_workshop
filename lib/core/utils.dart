import 'package:flutter/material.dart';

Offset getThrowOffsetFromDragLocation(Offset drag, double min) {
  return Offset(
    drag.dx.abs() / drag.dy.abs() < 0.2 ? 0 : min * drag.dx.sign,
    drag.dy.abs() / drag.dx.abs() < 0.2 ? 0 : min * drag.dy.sign,
  );
}

/// To achieve infinite lists, we build each child widget of the list on demand
/// and provide it with the index of the child that we want to see instead of
/// the actual list index
/// For the case of the stack of cards, we want to see the active card,
/// and when that card is dismissed, the one before it is now the active card
/// and should be built at the end of the list
///
/// We have several inputs to consider:
/// - The `index` which is the original index of the list
/// - The `count` which is the number of items in the list
/// - The `activeIndex` which is the index of the item to be shown
/// - We want to reverse the list, such that when the stack is meant to display
///   a list of widgets, the first provided widget should be on the surface
///   and the first to be dismissed, hence it's at the end of the list
///
/// This `activeIndex` value is incremented by 1 everytime a card is dismissed
/// So to show the correct widget for every list item, we determine the distance
/// between this item and the active item and use % to reset the index
/// when it exceeds the length of the list
/// Lastly, if `isReversed` is `true`,  we subtract this value from the
/// last index (count - 1), to display the list in reverse
int getModIndexFromActiveIndex(
  int index,
  int activeIndex,
  int count, {
  bool isReversed = true,
}) {
  final modIndex = (index - activeIndex) % count;
  return isReversed ? count - 1 - modIndex : modIndex;
}

/// To gradually scale down widgets, limited by min and max scales
double getScaleByIndex(int index, double min, double max, int count) {
  return min + ((max - min) / count) * (index + 1);
}
