import 'package:dms/modules/list_screen/domain/repositories/list_screen_repository.dart';
import 'package:dms/utils/error/failure.dart';
import 'package:dms/utils/network/api_provider.dart';
import 'package:either_dart/either.dart';

class ListScreenRepoImpl implements ListScreenRepo {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> listScreenData(int currentPage) async {
    dynamic response;

    try {
      response = await _apiProvider.getData(
        baseUrl: "https://api.nstack.in/v1",
        subUrl: "/todos?page=$currentPage&limit=20",
      );
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
