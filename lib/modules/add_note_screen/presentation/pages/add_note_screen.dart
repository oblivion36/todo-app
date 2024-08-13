import 'package:dms/modules/add_note_screen/presentation/bloc/add_note_bloc/add_note_bloc.dart';
import 'package:dms/modules/add_note_screen/presentation/views/add_note.dart';
import 'package:dms/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteScreen extends StatelessWidget {
  final TextEditingController? titleController;
  final TextEditingController? dateController;
  final TextEditingController? timeController;
  final TextEditingController? descriptionController;
  String? uid;

  AddNoteScreen(
      {Key? key,
      this.uid,
      this.titleController,
      this.dateController,
      this.timeController,
      this.descriptionController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => serviceLocator<AddNoteBloc>(),
          ),
        ],
        child: AddTaskPage(
          uid: uid,
          dateEditController: dateController,
          descriptionEditController: descriptionController,
          timeEditController: timeController,
          titleEditController: titleController,
        ));
  }
}
