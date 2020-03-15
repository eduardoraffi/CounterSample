import 'package:counter_sample/commons/common_widgets.dart';
import 'package:counter_sample/count_list/widgets/counter_item.dart';
import 'package:counter_sample/model/counter_model.dart';
import 'package:flutter/material.dart';

class CountListScreen extends StatefulWidget {
  List<CounterModel> counterList;

  CountListScreen({Key key, this.counterList}) : super(key: key);

  @override
  _CountListScreenState createState() => _CountListScreenState();
}

class _CountListScreenState extends State<CountListScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 32),
        child: ListView(
          children: getItemList(),
        ));
  }

  getItemList() {
    List<Widget> widgetList = List();
    widget.counterList.forEach((CounterModel counterModel) {
      widgetList.add(CounterItem(counterModel: counterModel));
    });
    return widgetList;
  }
}
