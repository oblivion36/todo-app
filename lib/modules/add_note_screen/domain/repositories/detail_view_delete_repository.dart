import 'package:dms/utils/error/failure.dart';
import 'package:either_dart/either.dart';

abstract class DetailViewDeleteRepo {
  Future<Either<Failure, dynamic>> deleteDetailViewData(String uid);
}
