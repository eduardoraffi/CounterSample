import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class CountListBloc extends Bloc<CountListEvent, CountListState> {
  @override
  CountListState get initialState => InitialCountListState();

  @override
  Stream<CountListState> mapEventToState(
    CountListEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
