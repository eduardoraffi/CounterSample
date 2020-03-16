import 'package:flutter/material.dart';

class AddRemoveCounterButton extends StatefulWidget {

  final String text;
  final Function onTap;

  const AddRemoveCounterButton({Key key, @required this.text, @required this.onTap}) : super(key: key);

  @override
  _AddRemoveCounterButtonState createState() => _AddRemoveCounterButtonState();
}

class _AddRemoveCounterButtonState extends State<AddRemoveCounterButton> {

  String get buttonText => widget.text;
  Function get onTap => widget.onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.only(top: 25, bottom: 25),
        onPressed: onTap,
        textColor: Theme.of(context).colorScheme.primary,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
            side: BorderSide(color: Colors.black)),
      ),
    );
  }
}
