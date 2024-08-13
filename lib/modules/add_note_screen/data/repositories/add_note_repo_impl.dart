import 'package:dms/modules/add_note_screen/data/models/add_note_request_model.dart';
import 'package:dms/modules/add_note_screen/domain/repositories/add_note_repository.dart';
import 'package:dms/utils/error/failure.dart';
import 'package:dms/utils/network/api_provider.dart';
import 'package:either_dart/either.dart';

class AddNoteRepositoryImpl implements AddNoteRepository {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> addNoteToDoData(
      AddNoteRequestModel body) async {
    dynamic response;

    try {
      response = await _apiProvider.postData(
          baseUrl: "https://api.nstack.in/v1",
          subUrl: "/todos",
          body: body.toJson());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }

    if (response == null) {
      return Left(ServerFailure(message: "No Response"));
    } else {
      return Right(response);
    }
  }
}
