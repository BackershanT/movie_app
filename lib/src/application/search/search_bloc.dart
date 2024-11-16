import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/src/domain/downloads/i_download_repo.dart';
import 'package:movie_app/src/domain/downloads/models/downloads_model.dart';
import 'package:movie_app/src/domain/search/i_search_repo.dart';
import 'package:movie_app/src/presentation/search/widget/search_result.dart';

part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadRepo _downloadServices;
  final ISearchRepo _searchServices;
  SearchBloc(this._downloadServices, this._searchServices)
      : super(SearchState.initial()) {
    on<Initialize>((event, emit) {
      _downloadServices.getDownloadimages();
    });

    on<SearchMovie>((event, emit) {
      _searchServices.searchMovies(movieQuery: event.movieQuery);
    });
  }
}
