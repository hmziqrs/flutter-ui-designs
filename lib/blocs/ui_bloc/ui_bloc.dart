import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';
import 'data.dart';

class UiBloc extends Bloc<UiEvent, UiState> {
  @override
  UiState get initialState => InitialUiState(uilist);

  @override
  Stream<UiState> mapEventToState(
    UiEvent event,
  ) async* {}
}
