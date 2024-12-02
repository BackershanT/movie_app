import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/src/domain/downloads/i_download_repo.dart';
import 'package:movie_app/src/domain/downloads/models/downloads_model.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final _vedioUrls = [
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
];

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadRepo _downloadService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      emit(const FastLaughState(videoList: [], isLoading: true, isError: false));
      final _result = await _downloadService.getDownloadimages();
      final _state = _result.fold((l) {
        return const FastLaughState(videoList: [], isLoading: false, isError: true);
      }, (r) => FastLaughState(videoList: r, isLoading: false, isError: false));
      emit(_state);
      print(_result);
    });
  }
}
