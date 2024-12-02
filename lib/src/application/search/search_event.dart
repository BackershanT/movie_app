part of 'search_bloc.dart';
//

@freezed
abstract class SearchEvent with _$SearchEvent {
  // const factory SearchEvent.initialize() = InitializeSearch;
  // const factory SearchEvent.queryChanged(String query) = SearchQueryChanged;
  const factory SearchEvent.initialize() = Initialize;
  const factory SearchEvent.searchMovie({
    required String movieQuery,
  }) = SearchMovie;
}
