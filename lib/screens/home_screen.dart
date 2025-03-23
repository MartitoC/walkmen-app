import 'package:flutter/material.dart';
import 'package:walkmen_app/widgets/song_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'HOME',
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0x33000000),
              Color(0x33FF6200),
            ],
          ),
        ),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return SongTile(
              title: 'Canción ${index + 1}',
              artist: 'Artista ${index + 1}',
              imagePath: index % 1 == 0 ? 'assets/images/blur.png' : '',
            );
          },
        ),
      ),
    ));
  }
}
