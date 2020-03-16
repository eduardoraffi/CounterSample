import 'package:counter_sample/configurations/configurations_screen.dart';
import 'package:counter_sample/count_list/widgets/count_list_screen.dart';
import 'package:counter_sample/model/counter_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex;
  List<Widget> screenList;
  List<CounterModel> _counterList;


  @override
  void initState() {
    _selectedIndex = 0;
    _counterList = List();
    screenList = [
      CountListScreen(counterList: _counterList),
      ConfigurationsScreen(
        counterList: _counterList,
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: _getApplicationBar(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: screenList.elementAt(_selectedIndex),
        bottomNavigationBar: _getBottomNavigationBar());
  }

  _getBottomNavigationBar() => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted), title: Text('List')),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Configurations'),
          )
        ],
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 5,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedIndex,
        onTap: _onListTap,
      );

  _onListTap(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _getApplicationBar() => AppBar(
        title: Text((_selectedIndex == 0) ? 'Counters' : 'Config'),
        elevation: 5,
        backgroundColor: Theme.of(context).colorScheme.primary,
      );
}
