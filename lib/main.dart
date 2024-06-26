import 'package:dms/modules/Dashboard/presentation/views/home_screen.dart';
import 'package:dms/modules/add_note_screen/presentation/views/add_note.dart';
import 'package:dms/modules/add_note_screen/presentation/views/details_view.dart';
import 'package:dms/modules/list_screen/presentation/views/list_screen.dart';
import 'package:dms/modules/task_todo_screen/presentation/views/task_todo_screen.dart';
import 'package:dms/modules/add_note_screen/presentation/views/add_note.dart';
import 'package:dms/modules/todo_app/data/model/todo_hive_model.dart';
import 'package:dms/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  // Hive.registerAdapter(GetDetailsModelAdapter());
  // Hive.registerAdapter(DataHiveAdapter());
  Hive.registerAdapter(ToDoHiveModelAdapter());
  Hive.registerAdapter(HiveItemAdapter());
  Hive.registerAdapter(HiveMetaAdapter());
  // await Hive.openBox<GetDetailsModel>('datas');
  await Hive.openBox<ToDoHiveModel>('datas');
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/addNote': (context) => const AddTaskPage(),
        '/listScreen': (context) => const ListScreen(),
        '/homeScreen': (context) => const HomeScreen(),
        '/taskToDOScreen': (context) => const TaskTodoScreen(),
        '/detailsView': (context) => DetailsView(),
      },
      home: const ProviderScope(
        // create: (context) => DashboardBloc(),
        child: HomeScreen(),
      ),
    );
  }
}
