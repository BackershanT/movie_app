import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/src/domain/core/failure/main_failure.dart';
import 'package:movie_app/src/domain/downloads/i_download_repo.dart';
import 'package:movie_app/src/domain/downloads/models/downloads_model.dart';
import 'package:movie_app/src/domain/search/i_search_repo.dart';
import 'package:movie_app/src/domain/search/models/search_respo/search_respo.dart';


part 'search_bloc.freezed.dart';

part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadRepo _downloadServices;
  final ISearchRepo _searchServices;
  SearchBloc(this._downloadServices, this._searchServices)
      : super(SearchState.initial()) {
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(state);
        return;
      }
      emit(SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      final _result = await _downloadServices.getDownloadimages();
      final _state = _result.fold(
        (MainFailure f) {
          return SearchState(
              searchResultList: [],
              idleList: [],
              isLoading: false,
              isError: true);
        },
        (List<Downloads> list) {
          return SearchState(
              searchResultList: [],
              idleList: list,
              isLoading: false,
              isError: false);
        },
      );
      emit(_state);
    });

    on<SearchMovie>((event, emit) async {
      // print('Searching for ${event.movieQuery}');
      emit(SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      final _result =
          await _searchServices.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold((MainFailure f) {

        return SearchState(

            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (SearchRespo r) {
        // print(r.results);
        return SearchState(
            idleList: [],
            searchResultList: r.results!,
            isLoading: false,
            isError: false);
      });
      emit(_state);
      // print(_state.searchResultList);
    });
  }
}
