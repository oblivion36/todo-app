import 'package:dms/modules/add_note_screen/data/repositories/add_note_repo_impl.dart';
import 'package:dms/modules/add_note_screen/data/repositories/detail_view_delete_repo_impl.dart';
import 'package:dms/modules/add_note_screen/data/repositories/detail_view_edit_repo_impl.dart';
import 'package:dms/modules/add_note_screen/domain/repositories/add_note_repository.dart';
import 'package:dms/modules/add_note_screen/domain/repositories/detail_view_delete_repository.dart';
import 'package:dms/modules/add_note_screen/domain/repositories/add_note_edit_repository.dart';
import 'package:dms/modules/add_note_screen/domain/usecases/add_note_usecase.dart';
import 'package:dms/modules/add_note_screen/domain/usecases/detail_view_delete_usecase.dart';
import 'package:dms/modules/add_note_screen/domain/usecases/add_note_edit_usecase.dart';
import 'package:dms/modules/add_note_screen/presentation/bloc/add_note_bloc/add_note_bloc.dart';
import 'package:dms/modules/add_note_screen/presentation/bloc/detail_view_bloc/detail_view_bloc.dart';
import 'package:dms/modules/list_screen/data/repositories/list_screen_repo_impl.dart';
import 'package:dms/modules/list_screen/domain/repositories/list_screen_repository.dart';
import 'package:dms/modules/list_screen/domain/usecases/list_screen_usecase.dart';
import 'package:dms/modules/list_screen/presentation/bloc/list_screen_bloc.dart';
import 'package:dms/modules/todo_app/data/repository_impl/todo_delete_repository_impl.dart';
import 'package:dms/modules/todo_app/data/repository_impl/todo_edit_repository_impl.dart';
import 'package:dms/modules/todo_app/data/repository_impl/todo_post_repository_imp.dart';
import 'package:dms/modules/todo_app/data/repository_impl/todo_repository_impl.dart';
import 'package:dms/modules/todo_app/domain/repository/todo_repository.dart';
import 'package:dms/modules/todo_app/domain/usecase/todo_usecase.dart';
import 'package:dms/services/database.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void initializeDependencies() async {
  // **************************** Get Details ****************************

  serviceLocator.registerSingleton<ToDoRepo>(ToDORepoImpl());
  serviceLocator.registerLazySingleton<ToDOUsecase>(() => ToDOUsecase());
  serviceLocator.registerSingleton<ToDoAddRepo>(ToDOPostRepoImpl());
  serviceLocator.registerLazySingleton<ToDOAddUsecase>(() => ToDOAddUsecase());
  serviceLocator.registerSingleton<ToDoDeleteRepo>(ToDODeleteRepoImpl());
  serviceLocator
      .registerLazySingleton<ToDODeleteUsecase>(() => ToDODeleteUsecase());
  serviceLocator.registerSingleton<ToDoEditRepo>(ToDOEditRepoImpl());
  serviceLocator
      .registerLazySingleton<ToDOEditUsecase>(() => ToDOEditUsecase());
  serviceLocator.registerSingleton<AddNoteRepository>(AddNoteRepositoryImpl());
  serviceLocator.registerLazySingleton<AddNoteUsecase>(() => AddNoteUsecase());
  serviceLocator.registerFactory<AddNoteBloc>(() => AddNoteBloc());
  serviceLocator.registerSingleton<ListScreenRepo>(ListScreenRepoImpl());
  serviceLocator
      .registerLazySingleton<ListScreenUsecase>(() => ListScreenUsecase());
  serviceLocator.registerFactory<ListScreenBloc>(() => ListScreenBloc());
  serviceLocator
      .registerSingleton<DetailViewDeleteRepo>(DetailViewDeleteRepoImpl());
  serviceLocator.registerLazySingleton<DetailViewDeleteUsecase>(
      () => DetailViewDeleteUsecase());
  serviceLocator
      .registerFactory<DetailViewDeleteBloc>(() => DetailViewDeleteBloc());
  serviceLocator.registerSingleton<AddNoteEditRepo>(AddNoteEditRepoImpl());
  serviceLocator
      .registerLazySingleton<AddNoteEditUsecase>(() => AddNoteEditUsecase());
  serviceLocator.registerLazySingleton<DatabaseMethod>(() => DatabaseMethod());
}
