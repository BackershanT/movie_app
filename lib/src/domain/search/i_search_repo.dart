import 'package:movie_app/src/domain/search/models/search_respo/search_respo.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/src/domain/core/failure/main_failure.dart';


abstract class ISearchRepo{
  Future<Either<MainFailure , SearchRespo>> searchMovies({
required String movieQuery,
  });
}