import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('res/assets/no_data.png',
              color: Theme.of(context).colorScheme.secondaryVariant),
          SizedBox(height: 64),
          Text(
            'You don\'t have any counters yet.\n\nGo to \'Configurations\' in bottom tab and add new counters',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondaryVariant,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
