import 'package:dms/modules/add_note_screen/domain/repositories/add_note_edit_repository.dart';
import 'package:dms/services/locator.dart';
import 'package:dms/utils/error/failure.dart';
import 'package:dms/utils/usecase/use_case.dart';
import 'package:either_dart/either.dart';

class AddNoteEditUsecase implements UseCaseTwoInput {
  @override
  Future<Either<Failure, dynamic>> invoke(uid, body) async {
    return await serviceLocator
        .get<AddNoteEditRepo>()
        .editAddNoteData(body, uid);
  }
}
