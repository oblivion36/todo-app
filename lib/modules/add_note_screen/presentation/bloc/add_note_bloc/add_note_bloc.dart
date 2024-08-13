import 'dart:async';

import 'package:dms/modules/add_note_screen/data/models/add_note_request_model.dart';
import 'package:dms/modules/add_note_screen/domain/usecases/add_note_usecase.dart';
import 'package:dms/modules/add_note_screen/domain/usecases/add_note_edit_usecase.dart';
import 'package:dms/modules/add_note_screen/presentation/bloc/add_note_bloc/add_note_event.dart';
import 'package:dms/modules/add_note_screen/presentation/bloc/add_note_bloc/add_note_state.dart';
import 'package:dms/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController searchTextController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  String message = "";

  AddNoteBloc() : super(AddNoteInitial()) {
    on<AddNoteEvent>((event, emit) {});

    on<AddNotePostInitialEvent>(addNotePostInitialEvent);
    on<AddNoteEditInitialEvent>(detailViewEditInitialEvent);
    on<AddNoteColorSelectedEvent>((event, emit) {
      emit(AddNoteColorUpdated(color: event.color));
    });
  }

  FutureOr<void> addNotePostInitialEvent(
      AddNotePostInitialEvent event, Emitter<AddNoteState> emit) async {
    emit(AddNotePostInitial());

    final repository = serviceLocator<AddNoteUsecase>();
    final response = await repository.invoke(AddNoteRequestModel(
        description: descriptionController.text,
        title: titleController.text,
        createdAt: getFormattedDateTime(),
        isCompleted: false));

    //2024-07-16T18:56:00.470Z

    if (response.isLeft) {
      emit(AddNotePostFailState());
    } else {
      try {
        if (response.right == []) {
          emit(AddNoteEmptystate());
        } else {
          descriptionController.clear();
          titleController.clear();

          emit(AddNotePostSuccessState());
        }
      } catch (e) {
        emit(AddNotePostFailState());
      }
    }
  }

  FutureOr<void> detailViewEditInitialEvent(
      AddNoteEditInitialEvent event, Emitter<AddNoteState> emit) async {
    emit(AddNoteEditInitial());
    final repository = serviceLocator<AddNoteEditUsecase>();
    final response = await repository.invoke(
        event.uid ?? "",
        AddNoteRequestModel(
            description: event.descriptionController?.text,
            title: event.titleController?.text,
            createdAt: DateTime.now().toIso8601String(),
            isCompleted: event.isCompleted));

    if (response.isLeft) {
      emit(AddNoteEditFailState());
    } else {
      try {
        if (response.right == []) {
          emit(AddNoteEditEmptyState());
        } else {
          event.uid?.isEmpty;
          event.descriptionController?.clear();
          event.titleController?.clear();
          emit(AddNoteEditSuccessState());
        }
      } catch (e) {
        emit(AddNoteEditFailState());
      }
    }
  }

  String getFormattedDateTime() {
    String date = dateController.text;
    String time = timeController.text;

    DateTime combinedDateTime = DateTime.parse('$date $time:00');

    String formattedDateTime = combinedDateTime.toIso8601String() + 'Z';

    return formattedDateTime;
  }
}
