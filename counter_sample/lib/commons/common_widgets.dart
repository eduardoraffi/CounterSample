import 'package:counter_sample/model/counter_model.dart';
import 'package:flutter/material.dart';

class CommonWidgets {
  static getCommonButton(Function onTap, String buttonText) => Expanded(
        child: RaisedButton(
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.only(top: 25, bottom: 25),
          onPressed: onTap,
          textColor: Colors.indigo,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
              side: BorderSide(color: Colors.black)),
        ),
      );

}
