
import 'package:dms/modules/todo_app/data/repository_impl/todo_delete_repository_impl.dart';
import 'package:dms/modules/todo_app/data/repository_impl/todo_edit_repository_impl.dart';
import 'package:dms/modules/todo_app/data/repository_impl/todo_post_repository_imp.dart';
import 'package:dms/modules/todo_app/data/repository_impl/todo_repository_impl.dart';
import 'package:dms/modules/todo_app/domain/repository/todo_repository.dart';
import 'package:dms/modules/todo_app/domain/usecase/todo_usecase.dart';
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
}
