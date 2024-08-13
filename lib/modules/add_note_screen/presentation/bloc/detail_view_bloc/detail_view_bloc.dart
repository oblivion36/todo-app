import 'dart:async';
import 'package:dms/modules/add_note_screen/domain/usecases/detail_view_delete_usecase.dart';
import 'package:dms/modules/add_note_screen/presentation/bloc/detail_view_bloc/detail_view_event.dart';
import 'package:dms/modules/add_note_screen/presentation/bloc/detail_view_bloc/detail_view_state.dart';
import 'package:dms/services/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailViewDeleteBloc
    extends Bloc<DetailViewDeleteEvent, DetailViewState> {
  DetailViewDeleteBloc() : super(DetailViewDeleteInitial()) {
    on<DetailViewDeleteEvent>((event, emit) {});
    on<DetailViewDeleteInitialEvent>(detailViewDeleteInitialEvent);
  }

  FutureOr<void> detailViewDeleteInitialEvent(
      DetailViewDeleteInitialEvent event, Emitter<DetailViewState> emit) async {
    emit(DetailViewDeleteInitial());

    final repository = serviceLocator<DetailViewDeleteUsecase>();
    final response = await repository.invoke(event.uid ?? "");

    emit(DetailViewDeleteSuccessState());
  }
}
