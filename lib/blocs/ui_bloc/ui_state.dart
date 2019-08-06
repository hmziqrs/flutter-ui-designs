import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'ui_item.dart';

@immutable
abstract class UiState extends Equatable {
  final List<UIItem> list;

  UiState(this.list, [List props = const []]) : super([list]..addAll(props));
}

class InitialUiState extends UiState {
  InitialUiState(List<UIItem> list) : super(list);
}
