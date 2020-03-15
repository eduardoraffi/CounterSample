import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:counter_sample/model/counter_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc.dart';

class ConfigurationsBloc
    extends Bloc<ConfigurationsEvent, ConfigurationsState> {
  @override
  ConfigurationsState get initialState => InitialConfigurationsState();

  @override
  Stream<ConfigurationsState> mapEventToState(
    ConfigurationsEvent event,
  ) async* {
    if (event is ConfigurationsEditSelectedCounterEvent) {
      yield* _mapEditSelectedCounterToState();
    } else if (event is ConfigurationsInitialEvent) {
      yield InitialConfigurationsState();
    }
  }

  Stream<ConfigurationsState> _mapEditSelectedCounterToState() async* {
    yield ConfigurationsEditCountState();
  }

  Stream<ConfigurationsState> _mapInitializeEventToState() async* {
//    String recoveredData = (await SharedPreferences.getInstance()).getString('counterList');
//    Map<String, dynamic> recoverMap = Map();
//    var jsonencode = jsonEncode(recoveredData);
//    recoverMap = jsonDecode(jsonencode);
//    recoverMap.forEach((key, value){

//    });
  }
}
