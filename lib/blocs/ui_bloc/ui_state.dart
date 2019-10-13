import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'ui_designer.dart';
import 'ui_item.dart';

@immutable
abstract class UiState extends Equatable {
  final List<UIItem> list;
  final List<UIDesigner> designers;

  UiState(this.list, this.designers) : super();
}

class InitialUiState extends UiState {
  @override
  List<Object> get props => [];

  InitialUiState(
    List<UIItem> list,
    List<UIDesigner> designers,
  ) : super(list, designers);
}
