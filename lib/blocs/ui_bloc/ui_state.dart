import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'ui_item.dart';

@immutable
abstract class UiState extends Equatable {
  final List<UIItem> list;

  UiState(this.list) : super();
}

class InitialUiState extends UiState {
  @override
  List<Object> get props => [];

  InitialUiState(List<UIItem> list) : super(list);
}
