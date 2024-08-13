import 'package:dms/modules/add_note_screen/data/models/add_note_request_model.dart';
import 'package:dms/utils/error/failure.dart';
import 'package:either_dart/either.dart';

abstract class AddNoteEditRepo {
  Future<Either<Failure, dynamic>> editAddNoteData(
      AddNoteRequestModel body, String uid);
}
