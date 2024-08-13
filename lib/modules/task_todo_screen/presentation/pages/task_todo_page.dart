import 'package:dms/modules/add_note_screen/presentation/bloc/add_note_bloc/add_note_bloc.dart';
import 'package:dms/modules/add_note_screen/presentation/bloc/detail_view_bloc/detail_view_bloc.dart';
import 'package:dms/modules/list_screen/presentation/bloc/list_screen_bloc.dart';
import 'package:dms/modules/list_screen/presentation/bloc/list_screen_event.dart';
import 'package:dms/modules/list_screen/presentation/views/list_screen.dart';
import 'package:dms/modules/task_todo_screen/presentation/views/task_todo_screen.dart';
import 'package:dms/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListToDoPage extends StatelessWidget {
  const ListToDoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String taskName =
        ModalRoute.of(context)?.settings.arguments as String;

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                serviceLocator<ListScreenBloc>()..add(ListScreenInitialEvent()),
          ),
          BlocProvider(
            create: (context) => serviceLocator<ListScreenBloc>()
              ..add(StatusFilterEvent(status: taskName)),
          ),
          BlocProvider(
              create: (context) => serviceLocator<DetailViewDeleteBloc>()),
          BlocProvider(create: (context) => serviceLocator<AddNoteBloc>()),
        ],
        child: TaskTodoScreen(
          pageName: taskName,
        ));
  }
}
