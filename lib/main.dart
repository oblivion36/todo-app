import 'package:dms/modules/Dashboard/presentation/views/home_screen.dart';
import 'package:dms/modules/add_note_screen/presentation/pages/add_note_screen.dart';
import 'package:dms/modules/add_note_screen/presentation/views/details_view.dart';
import 'package:dms/modules/list_screen/presentation/pages/list_screen_page.dart';
import 'package:dms/modules/task_todo_screen/presentation/pages/task_todo_page.dart';
import 'package:dms/services/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await Hive.initFlutter();

  // // Hive.registerAdapter(GetDetailsModelAdapter());
  // // Hive.registerAdapter(DataHiveAdapter());
  // Hive.registerAdapter(ToDoHiveModelAdapter());
  // Hive.registerAdapter(HiveItemAdapter());
  // Hive.registerAdapter(HiveMetaAdapter());
  // // await Hive.openBox<GetDetailsModel>('datas');
  // await Hive.openBox<ToDoHiveModel>('datas');
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
        '/addNote': (context) => AddNoteScreen(),
        '/listScreen': (context) => const ListScreenPage(),
        '/homeScreen': (context) => HomeScreen(),
        '/taskToDOScreen': (context) => const ListToDoPage(),
        '/detailsView': (context) => DetailsView(),
      },
      home: ProviderScope(
        // create: (context) => DashboardBloc(),
        child: HomeScreen(),
      ),
    );
  }
}
