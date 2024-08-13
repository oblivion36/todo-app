import 'package:dms/modules/list_screen/domain/repositories/list_screen_repository.dart';
import 'package:dms/services/locator.dart';
import 'package:dms/utils/error/failure.dart';
import 'package:dms/utils/usecase/use_case.dart';
import 'package:either_dart/either.dart';

class ListScreenUsecase implements UseCaseOneInput {
  @override
  Future<Either<Failure, dynamic>> invoke(currentPage) async {
    return await serviceLocator
        .get<ListScreenRepo>()
        .listScreenData(currentPage);
  }
}
