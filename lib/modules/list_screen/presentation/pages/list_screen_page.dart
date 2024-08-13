import 'package:dms/modules/list_screen/presentation/bloc/list_screen_bloc.dart';
import 'package:dms/modules/list_screen/presentation/bloc/list_screen_event.dart';
import 'package:dms/modules/list_screen/presentation/views/list_screen.dart';
import 'package:dms/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ListScreenPage extends StatelessWidget {
  const ListScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) =>
              serviceLocator<ListScreenBloc>()..add(ListScreenInitialEvent())),
      BlocProvider(
        create: (context) => serviceLocator<ListScreenBloc>()
          ..add(DateTasksEvent(selectedDate: "2024-08-02")),
      ),
    ], child: ListScreen());
  }
}
