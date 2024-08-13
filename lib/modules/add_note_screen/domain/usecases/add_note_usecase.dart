import 'package:dms/modules/add_note_screen/domain/repositories/add_note_repository.dart';
import 'package:dms/services/locator.dart';
import 'package:dms/utils/error/failure.dart';
import 'package:dms/utils/usecase/use_case.dart';
import 'package:either_dart/either.dart';

class AddNoteUsecase implements UseCaseOneInput {
  @override
  Future<Either<Failure, dynamic>> invoke(body) async {
    return await serviceLocator.get<AddNoteRepository>().addNoteToDoData(body);
  }
}
