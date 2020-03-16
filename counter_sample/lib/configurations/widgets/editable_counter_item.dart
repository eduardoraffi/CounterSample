import 'package:counter_sample/model/counter_model.dart';
import 'package:flutter/material.dart';

class EditableCounterItem extends StatefulWidget {
  final CounterModel counterModel;
  final Function onTap;

  const EditableCounterItem(
      {Key key, @required this.counterModel, @required this.onTap})
      : super(key: key);

  @override
  _EditableCounterItemState createState() => _EditableCounterItemState();
}

class _EditableCounterItemState extends State<EditableCounterItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.2,
        margin: EdgeInsets.only(left: 32, right: 32, bottom: 16, top: 16),
        padding: EdgeInsets.only(top: 0, left: 16, right: 0, bottom: 16),
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
            _getCounterNameWidget(),
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: SizedBox(
                width: double.infinity,
                child: Text(_getCounterWithPadding(),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getCounterNameWidget() => Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Text(
                  (widget.counterModel.counterTitle == null &&
                          widget.counterModel.counterTitle != '')
                      ? 'Counter ${widget.counterModel.counterNumber}'
                      : widget.counterModel.counterTitle,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black54)),
            ),
            IconButton(
              onPressed: widget.onTap,
              icon: Icon(Icons.mode_edit),
            )
          ]);

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
}
