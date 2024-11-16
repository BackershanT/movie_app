import 'package:movie_app/src/domain/core/failure/main_failure.dart';
import 'package:movie_app/src/domain/downloads/models/downloads_model.dart';

import 'package:dartz/dartz.dart';

abstract class IDownloadRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadimages();
}
