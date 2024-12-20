import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/src/domain/core/failure/main_failure.dart';
import 'package:movie_app/src/domain/hot_and_new/hot_new_resp/i_hot_new_repo.dart';
import 'package:movie_app/src/domain/hot_and_new/hot_new_resp/models/hot_new_resp.dart';

part 'hotand_new_event.dart';
part 'hotand_new_state.dart';
part 'hotand_new_bloc.freezed.dart';

@injectable
class HotandNewBloc extends Bloc<HotandNewEvent, HotandNewState> {
  final IHotNewRepo _hotNewRepo;
  HotandNewBloc(this._hotNewRepo) : super(HotandNewState.initial()) {
    on<LoadDataInComingSoon>((event, emit) async {
      emit(HotandNewState(
          comingSoonList: [],
          everyOneWatchingList: [],
          isLoading: true,
          isError: false, ));

      final _result = await _hotNewRepo.getHotAndNewMovieData();
      final _newState = _result.fold((MainFailure failure) {
        return HotandNewState(
            comingSoonList: [],
            everyOneWatchingList: [],
            isLoading: false,
            isError: true);
      }, (HotNewResp resp) {
        return   HotandNewState(
            comingSoonList: resp.results,
            everyOneWatchingList: state.everyOneWatchingList,
            isLoading: false,
            isError: false);
      });
      // TODO: implement event handler
      emit(_newState);
    });

    on<LoadDataInEveryOneWatching>((event, emit) async {
      emit(HotandNewState(
          comingSoonList: [],
          everyOneWatchingList: [],
          isLoading: true,
          isError: false));

      final _result = await _hotNewRepo.getHotAndNewTvData();
      final _newStates = _result.fold((MainFailure failure) {
        return HotandNewState(
            comingSoonList: [],
            everyOneWatchingList: [],
            isLoading: false,
            isError: true);
      }, (HotNewResp resp) {
        return HotandNewState(
            comingSoonList: state.comingSoonList,
            everyOneWatchingList: resp.results ,
            isLoading: false,
            isError: false);
      });
      // TODO: implement event handler
      emit(_newStates);
    });
  }
}
