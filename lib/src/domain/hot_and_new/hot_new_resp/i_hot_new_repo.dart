import 'package:dartz/dartz.dart';
import 'package:movie_app/src/domain/core/failure/main_failure.dart';
import 'package:movie_app/src/domain/hot_and_new/hot_new_resp/models/hot_new_resp.dart';

abstract class IHotNewRepo {
  Future<Either<MainFailure, HotNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailure, HotNewResp>> getHotAndNewTvData();
}
