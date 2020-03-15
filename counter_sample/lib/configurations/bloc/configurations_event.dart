import 'package:equatable/equatable.dart';

abstract class ConfigurationsEvent extends Equatable{
  const ConfigurationsEvent();

  @override
  List<Object> get props => [];
}

class ConfigurationsInitialEvent extends ConfigurationsEvent {

  @override
  String toString() {
    return 'ConfigurationsInitialEvent';
  }
}

class ConfigurationsEditSelectedCounterEvent extends ConfigurationsEvent{

   @override
  String toString() {
    return 'ConfigurationsEditSelectedCounterEvent';
  }

}