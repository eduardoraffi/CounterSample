import 'package:flutter/cupertino.dart';

class CounterModel {
  CounterModel(
      {@required this.counter,
      this.counterNumber,
      this.isSelected,
      this.counterTitle});

  int counter;
  int counterNumber;
  String counterTitle;
  bool isSelected;

  @override
  String toString() {
    return '[Counter: $counter\nCounterNumber: $counterNumber\nisSelected: $isSelected\ncounterTitle: $counterTitle]';
  }

  factory CounterModel.fromJSON(Map<String, Object> data) => CounterModel(
        counter: data['counter'] as int,
        counterNumber: data['counterNumber'] as int,
        isSelected: data['isSelected'] as bool,
        counterTitle: data['counterTitle'] as String,
      );

  Map<String, dynamic> toJson() => {
        'counter': counter,
        'counterNumber': counterNumber,
        'isSelected': isSelected,
        'counterTitle': counterTitle,
      };
}
