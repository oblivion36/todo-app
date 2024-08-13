import 'dart:ui';

abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNotePostFailState extends AddNoteState {}

class AddNotePostInitial extends AddNoteState {}

class AddNoteEmptystate extends AddNoteState {}

class AddNotePostSuccessState extends AddNoteState {}

class AddNoteEditFailState extends AddNoteState {}

class AddNoteEditEmptyState extends AddNoteState {}

class AddNoteEditInitial extends AddNoteState {}

class AddNoteEditSuccessState extends AddNoteState {}

class AddNoteColorUpdated extends AddNoteState {
  final Color color;

  AddNoteColorUpdated({required this.color});
}
