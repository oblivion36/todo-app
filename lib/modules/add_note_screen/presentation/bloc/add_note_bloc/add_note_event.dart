import 'package:flutter/material.dart';

abstract class AddNoteEvent {}

class AddNotePostInitialEvent extends AddNoteEvent {}

class AddNoteEditInitialEvent extends AddNoteEvent {
  TextEditingController? titleController = TextEditingController();
  TextEditingController? descriptionController = TextEditingController();
  // TextEditingController searchTextController = TextEditingController();
  TextEditingController? dateController = TextEditingController();
  TextEditingController? timeController = TextEditingController();
  String? uid;
  bool? isCompleted;
  AddNoteEditInitialEvent({
    required this.uid,
    required this.dateController,
    required this.descriptionController,
    required this.timeController,
    required this.titleController,
    required this.isCompleted,
  });
}

class AddNoteColorSelectedEvent extends AddNoteEvent {
  final Color color;

  AddNoteColorSelectedEvent(this.color);
}
