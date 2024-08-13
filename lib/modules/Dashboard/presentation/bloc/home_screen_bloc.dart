import 'dart:async';
import 'package:dms/modules/Dashboard/presentation/bloc/home_screen_event.dart';
import 'package:dms/modules/Dashboard/presentation/bloc/home_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  bool isSeeAll = true;

  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<HomeScreenSeeAllEvent>(homeScreenSeeAllEvent);
  }

  FutureOr<void> homeScreenSeeAllEvent(
      HomeScreenSeeAllEvent event, Emitter<HomeScreenState> emit) {
    isSeeAll = !isSeeAll;
    emit(HomeScreenSuccessState());
  }
}
