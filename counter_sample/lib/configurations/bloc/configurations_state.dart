import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConfigurationsState extends Equatable{
  const ConfigurationsState();

  @override
  List<Object> get props => [];
}

class InitialConfigurationsState extends ConfigurationsState {
  @override
  String toString() {
    return 'InitialConfigurationsState';
  }
}

class ConfigurationsEditCountState extends ConfigurationsState {
  @override
  String toString() {
    return 'ConfigurationsEditCountState';
  }
}
