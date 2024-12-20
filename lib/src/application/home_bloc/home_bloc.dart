import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/src/domain/core/failure/main_failure.dart';
import 'package:movie_app/src/domain/hot_and_new/hot_new_resp/i_hot_new_repo.dart';
import 'package:movie_app/src/domain/hot_and_new/hot_new_resp/models/hot_new_resp.dart';
import 'package:dartz/dartz.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHotNewRepo _homeRepo;

  HomeBloc(this._homeRepo) : super(HomeState.initial()) {
    on<GetHomeScreenData>((event, emit) async {
      emit(HomeState(isLoading: true, isError: false, pastYearMovieList: [], trendingMovieList: [], tenseMovieList: [], southIndianMovieList: [], trendingTvList: [],
  stateId: DateTime.now().millisecondsSinceEpoch.toString()
  ));
      final _movieResult =await _homeRepo.getHotAndNewMovieData();
      final _tvResult = await _homeRepo.getHotAndNewTvData();


     final state1=  _movieResult.fold((MainFailure failure){
        return HomeState(
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            isError: true,
            stateId: DateTime.now().millisecondsSinceEpoch.toString()
  );
      }, (HotNewResp resp) {
        final pastYear = resp.results;
        final trending = resp.results;
        final tense = resp.results;
        final southIndian = resp.results;
        pastYear.shuffle();
        trending.shuffle();
        tense.shuffle();
        southIndian.shuffle();
        return HomeState(pastYearMovieList: pastYear,
            trendingMovieList: trending,
            tenseMovieList: tense,
            southIndianMovieList: southIndian,
            trendingTvList: state.trendingTvList,
            isLoading: false,
            isError: false,
  stateId: DateTime.now().millisecondsSinceEpoch.toString()
  );
      });
     emit(state1);

     final state2= _tvResult.fold((MainFailure failure) {
        return HomeState(
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            isError: true,
  stateId: DateTime.now().millisecondsSinceEpoch.toString()
  );
      }, (HotNewResp resp) {
final top10List = resp.results;
        return HomeState(
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: state.trendingMovieList,
            tenseMovieList: state.tenseMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTvList: top10List,
            isLoading: false,
            isError: false,
  stateId: DateTime.now().millisecondsSinceEpoch.toString()
  );


      });
emit(state2);    });
  }
}
