class SongModel {
  final int id;
  final String title;
  final String artist;
  final String path;
  final int duration;

  SongModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.path,
    required this.duration,
  });

  factory SongModel.fromQuery(Map<String, dynamic> data) {
    return SongModel(
      id: data['id'] ?? 0,
      title: data['title'] ?? 'Desconocido',
      artist: data['artist'] ?? 'Desconocido',
      path: data['data'] ?? '',
      duration: data['duration'] ?? 0,
    );
  }
}
