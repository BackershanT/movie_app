part of 'downloads_bloc.dart';

@freezed
class DownloadsEvent with _$DownloadsEvent {
  const factory DownloadsEvent.started() = _Started;
}
