import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/src/domain/core/api_endpoints.dart';
import 'package:movie_app/src/domain/core/failure/main_failure.dart';
import 'package:movie_app/src/domain/hot_and_new/hot_new_resp/i_hot_new_repo.dart';
import 'package:movie_app/src/domain/hot_and_new/hot_new_resp/models/hot_new_resp.dart';

@LazySingleton()
class HotAndNewRepository implements IHotNewRepo {
  @override
  Future<Either<MainFailure, HotNewResp>> getHotAndNewMovieData() async {
    try {
      final response =
          await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewMovie);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return Left(MainFailure.severFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure());
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotNewResp>> getHotAndNewTvData() async {
    try {
      final response = await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewTv);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return Left(MainFailure.severFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure());
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure());
    }
  }
}
