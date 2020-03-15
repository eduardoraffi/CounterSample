import 'package:counter_sample/model/counter_model.dart';
import 'package:flutter/material.dart';

class CounterItem extends StatelessWidget {
  CounterItem({@required this.counterModel});

  final CounterModel counterModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      margin: EdgeInsets.only(left: 32, right: 32, bottom: 16, top: 16),
      padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 5,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Text(
                (counterModel.counterTitle != null &&
                        counterModel.counterTitle != '')
                    ? counterModel.counterTitle
                    : 'Counter ${counterModel.counterNumber}',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black54)),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(_getCounterWithPadding(),
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.black)),
          ),
        ],
      ),
    );
  }

  _getCounterWithPadding() {
    if (counterModel.counter < 10) {
      return '000${counterModel.counter}';
    } else if (counterModel.counter < 100) {
      return '00${counterModel.counter}';
    } else if (counterModel.counter < 1000) {
      return '0${counterModel.counter}';
    } else
      return counterModel.counter;
  }
}
