import 'package:dms/modules/add_note_screen/domain/repositories/detail_view_delete_repository.dart';
import 'package:dms/services/locator.dart';
import 'package:dms/utils/error/failure.dart';
import 'package:dms/utils/usecase/use_case.dart';
import 'package:either_dart/either.dart';

class DetailViewDeleteUsecase implements UseCaseOneInput {
  @override
  Future<Either<Failure, dynamic>> invoke(uid) async {
    return await serviceLocator
        .get<DetailViewDeleteRepo>()
        .deleteDetailViewData(uid);
  }
}
