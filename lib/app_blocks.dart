import 'package:e_learnign_app/app_events.dart';
import 'package:e_learnign_app/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvents, AppSates> {
  AppBlocs() : super(InitStates()) {
    on<Increment>(
      (event, emit) {
        emit(AppSates(counter: state.counter + 1));
      },
    );

    on<Decrement>(
      (event, emit) {
        emit(AppSates(counter: state.counter - 1));
      },
    );
  }
}
