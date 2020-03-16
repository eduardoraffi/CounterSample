import 'package:counter_sample/count_list/widgets/counter_item.dart';
import 'package:counter_sample/count_list/widgets/empty_list.dart';
import 'package:counter_sample/model/counter_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
        child: (widget.counterList != null && widget.counterList.isNotEmpty)
            ? ListView(children: getItemList())
            : SingleChildScrollView(
                controller: ScrollController(),
                scrollDirection: Axis.vertical,
                child: EmptyList()));
  }

  getItemList() {
    List<Widget> widgetList = List();
    widget.counterList.forEach((counterModel) {
      widgetList.add(_getGestureRecognizer(counterModel));
    });
    return widgetList;
  }

  _getGestureRecognizer(CounterModel counterModel) => GestureDetector(
        onTap: () {
          setState(() {
            widget.counterList.forEach((counterModelAux) {
              if (counterModelAux.counterNumber != counterModel.counterNumber) {
                counterModelAux.isSelected = false;
              } else
                counterModelAux.isSelected = true;
            });
          });
        },
        child: CounterItem(counterModel: counterModel),
      );
}
