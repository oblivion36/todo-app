import 'package:dms/utils/error/failure.dart';
import 'package:either_dart/either.dart';

abstract class ListScreenRepo {
  Future<Either<Failure, dynamic>> listScreenData(int currentPage);
}
