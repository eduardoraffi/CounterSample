import 'package:counter_sample/configurations/bloc/bloc.dart';
import 'package:counter_sample/configurations/widgets/add_remove_counter_button.dart';
import 'package:counter_sample/configurations/widgets/edit_values_dialog.dart';
import 'package:counter_sample/configurations/widgets/editable_counter_item.dart';
import 'package:counter_sample/model/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ConfigurationsScreen extends StatefulWidget {
  ConfigurationsScreen({Key key, @required this.counterList}) : super(key: key);

  List<CounterModel> counterList;

  @override
  ConfigurationsScreenState createState() => ConfigurationsScreenState();
}

class ConfigurationsScreenState extends State<ConfigurationsScreen> {
  ConfigurationsBloc _configurationsBloc;

  CounterModel _counterModel;

  @override
  void initState() {
    _configurationsBloc = ConfigurationsBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocListener(
        bloc: _configurationsBloc,
        listener: (BuildContext context, ConfigurationsState state) {
          print(state);
        },
        child: BlocBuilder(
          bloc: _configurationsBloc,
          builder: (context, state) {
            if (state is ConfigurationsEditCountState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  child: Dialog(
                      backgroundColor: Colors.transparent,
                      child: EditValuesDialog(
                        counterModel: _counterModel,
                        configurationsBloc: _configurationsBloc,
                      )),
                );
              });
            }
            return _getScreen();
          },
        ),
      ),
    );
  }

  _getScreen() => Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: _getTopWidgets()),
            (widget.counterList.isNotEmpty)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: _getBottomWidgets())
                : Container(),
          ]);

  _getTopWidgets() {
    List<Widget> widgetList = List();
    widgetList.add(_getTextWidget('Counters'));
    widgetList.add(_getButtons());
    if(widget.counterList.isEmpty){
      widgetList.add(_getNoListIndicator());
    }
    return widgetList;
  }

  _getNoListIndicator() => Padding(
        padding: const EdgeInsets.only(left: 32,right: 32),
        child: Row(
          children: <Widget>[
            Image.asset(
              'res/assets/arrow_up.png',
              height: 150,
              width: 150,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Image.asset(
              'res/assets/click_add.png',
              height: 150,
              width: 150,
              color: Color(0xFF444749),
            )
          ],
        ),
      );

  _getTextWidget(String text) => Padding(
      padding: EdgeInsets.only(left: 32, top: 16, bottom: 16),
      child: Text(text,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.title));

  _getButtons() => Padding(
        padding: EdgeInsets.only(left: 32, right: 32),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AddRemoveCounterButton(text: 'Add\ncounter', onTap: _addTapped),
            SizedBox(width: 8),
            AddRemoveCounterButton(
                text: 'Remove\ncounter', onTap: _removeTapped)
          ],
        ),
      );

  _removeTapped() {
    setState(() {
      if (widget.counterList.isNotEmpty) {
        int indexToRemove = 0;
        widget.counterList.forEach((counter) {
          if (counter.isSelected) {
            counter.isSelected = false;
          } else {
            indexToRemove++;
          }
        });
        widget.counterList[0].isSelected = true;
        widget.counterList.removeAt(indexToRemove);
      } else {
        _configurationsBloc.add(ConfigurationsInitialEvent());
      }
    });
  }

  _addTapped() {
    setState(() {
      widget.counterList.forEach((counter) {
        if (counter.isSelected) {
          counter.isSelected = false;
        }
      });
      widget.counterList.add(CounterModel(
          counter: 0,
          counterNumber: widget.counterList.length,
          isSelected: true));
    });
  }

  _getBottomWidgets() {
    List<Widget> widgetList = List();
    widgetList.add(_getTextWidget('Selected counter'));
    widget.counterList.forEach((CounterModel counterModel) {
      if (counterModel.isSelected) {
        _counterModel = counterModel;
        widgetList.add(EditableCounterItem(
            counterModel: counterModel,
            onTap: () {
              setState(() {
                _configurationsBloc
                    .add(ConfigurationsEditSelectedCounterEvent());
              });
            }));
      }
    });
    return widgetList;
  }
}
