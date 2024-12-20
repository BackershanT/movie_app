part of 'hotand_new_bloc.dart';

@freezed
class HotandNewState with _$HotandNewState {
  const factory HotandNewState({
  required List <HotAndNewData> comingSoonList,
  required List<HotAndNewData> everyOneWatchingList,
  required bool isLoading,
  required bool isError,
} ) = _Initial;

  factory HotandNewState.initial() => HotandNewState(
      comingSoonList: [],
      everyOneWatchingList: [],
      isLoading: false,
      isError: false, );
}
