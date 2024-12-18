import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/src/domain/downloads/i_download_repo.dart';
import 'package:movie_app/src/domain/downloads/models/downloads_model.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
];

ValueNotifier<Set<int>> likedVideosNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadRepo _downloadService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      emit(FastLaughState(
        videoList: [],
        isLoading: true,
        isError: false,
        // likedVideoListIds: []
      ));
      final _result = await _downloadService.getDownloadimages();
      final _state = _result.fold((l) {
        return FastLaughState(
          videoList: [],
          isLoading: false,
          isError: true,
          // likedVideoListIds: []
        );
      },
          (r) => FastLaughState(
                videoList: r,
                isLoading: false,
                isError: false,
                // likedVideoListIds: state.likedVideoListIds
              ));
      emit(_state);
      print(_result);
    });

    on<LikeVideo>((event, emit) async {
      likedVideosNotifier.value.add(event.id);
      // emit(state.copyWith(likedVideoListIds: list));
    });
    on<UnLikeVideo>((event, emit) async {
      likedVideosNotifier.value.remove(event.id);

      // emit(state.copyWith(likedVideoListIds: list));
    });
  }
}
