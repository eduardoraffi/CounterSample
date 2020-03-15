import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter_sample/configurations/bloc/bloc.dart';
import 'package:counter_sample/model/counter_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditValuesDialog extends StatefulWidget {
  CounterModel counterModel;
  Bloc configurationsBloc;

  EditValuesDialog(
      {Key key, @required this.counterModel, @required this.configurationsBloc})
      : super(key: key);

  @override
  _EditValuesDialogState createState() => _EditValuesDialogState();
}

class _EditValuesDialogState extends State<EditValuesDialog> {
  Timer _timer;
  TextEditingController _textEditingController;
  FocusNode _focusNode;
  String _newText;

  @override
  void initState() {
    _focusNode = FocusNode();
    _textEditingController = TextEditingController();
    _newText = '';
    super.initState();
  }

  Future<bool> _onWillPopScope() async{
    setState(() {
      Navigator.pop(context);
      widget.configurationsBloc.add(ConfigurationsInitialEvent());
    });
}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black87, width: 1),
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _getWidgetList(),
        ),
      ),
    );
  }

  _getWidgetList() {
    List<Widget> widgetList = List();

    ///Counter name
    widgetList.add(_getTextLabel('Update your counter name'));
    widgetList.add(_getEditText());

    ///Counter number
    widgetList.add(_getTextLabel('Update your counter'));
    widgetList.add(_getEditCounterWidget());
    widgetList.add(_getResetButton());

    ///Button done
    widgetList.add(Container(
      margin: EdgeInsets.only(top: 32),
      child: Divider(
        color: Colors.black26,
        height: 1,
      ),
    ));
    widgetList.add(_getDoneButton());
    return widgetList;
  }

  _getResetButton() => Center(
        child: FlatButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              widget.counterModel.counter = 0;
            });
          },
        ),
      );

  _getEditText() => Padding(
        padding: EdgeInsets.only(left: 32, right: 32),
        child: TextFormField(
          controller: _textEditingController,
          focusNode: _focusNode,
          onChanged: (text) {
            widget.counterModel.counterTitle = text;
          },
          decoration: InputDecoration(
              hintText: (widget.counterModel.counterTitle != null)
                  ? widget.counterModel.counterTitle
                  : 'Counter ${widget.counterModel.counterNumber}'),
          maxLines: 1,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 18, color: Colors.black87),
          cursorColor: Colors.blue,
        ),
      );

  _getDoneButton() => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5))),
        child: SizedBox(
          width: double.infinity,
          child: FlatButton(
            child: Text(
              'DONE',
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              Navigator.pop(context);
              widget.configurationsBloc.add(ConfigurationsInitialEvent());
            }
              ,
          ),
        ),
      );

  _getEditCounterWidget() => Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _getIncrementOrDecrementButtonWidget(false),
          _getCounterText(),
          _getIncrementOrDecrementButtonWidget(true)
        ],
      );

  _getCounterText() => Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Text(
          _getCounterWithPadding(),
          style: TextStyle(fontSize: 40),
        ),
      );

  _getCounterWithPadding() {
    if (widget.counterModel.counter < 10) {
      return '000${widget.counterModel.counter}';
    } else if (widget.counterModel.counter < 100) {
      return '00${widget.counterModel.counter}';
    } else if (widget.counterModel.counter < 1000) {
      return '0${widget.counterModel.counter}';
    } else
      return widget.counterModel.counter;
  }

  _getTextLabel(String text) => Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 32),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black54),
          textAlign: TextAlign.left,
        ),
      );

  _incrementOrDecrement(isToAdd) {
    if (widget.counterModel.counter == 0 && !isToAdd ||
        widget.counterModel.counter == 9999) {
      return;
    } else if (isToAdd) {
      widget.counterModel.counter += 1;
    } else
      widget.counterModel.counter -= 1;
  }

  _getIncrementOrDecrementButtonWidget(bool isToAdd) => GestureDetector(
        onTapDown: (TapDownDetails details) {
          _timer = Timer.periodic(Duration(milliseconds: 150), (t) {
            setState(() {
              _incrementOrDecrement(isToAdd);
            });
          });
        },
        onTapUp: (TapUpDetails details) {
          _timer.cancel();
        },
        onTapCancel: () {
          _timer.cancel();
        },
        onTap: () {
          setState(() {
            _incrementOrDecrement(isToAdd);
          });
        },
        onHorizontalDragCancel: null,
        onVerticalDragCancel: null,
        child: Container(
          decoration: BoxDecoration(
              color: (isToAdd) ? Colors.blue : Colors.black26,
              borderRadius: (!isToAdd)
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10))
                  : BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10))),
          padding: EdgeInsets.all(10),
          child: Text(
            (isToAdd) ? '+' : '-',
            style: TextStyle(
                color: (isToAdd) ? Colors.white : Colors.black45,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
}
