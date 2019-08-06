import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UiEvent extends Equatable {
  UiEvent([List props = const []]) : super(props);
}
