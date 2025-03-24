import 'package:flutter_bloc/flutter_bloc.dart';
import 'music_state.dart';
import 'music_event.dart';
import 'package:walkmen_app/services/audio_service.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final AudioService audioService;

  MusicBloc(this.audioService) : super(MusicInitial()) {
    on<FetchSongsEvent>((event, emit) async {
      emit(MusicLoading());

      try {
        final songs = await audioService.getLocalSongs();
        emit(MusicLoaded(songs));
      } catch (e) {
        emit(MusicError("No se pudieron cargar las canciones"));
      }
    });
  }
}
