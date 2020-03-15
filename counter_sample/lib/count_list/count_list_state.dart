import 'package:equatable/equatable.dart';

abstract class CountListState extends Equatable{
  const CountListState();

  @override
  List<Object> get props => [];
}

class InitialCountListState extends CountListState {

  @override
  String toString() {
    return 'InitialCountListState';
  }
}


