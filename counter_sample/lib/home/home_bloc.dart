import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:counter_sample/model/counter_model.dart';
import 'bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  List<CounterModel> _counterList;

  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    ///Hold item click event
  }
}
