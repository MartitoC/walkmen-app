import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkmen_app/widgets/song_tile.dart';
import 'package:walkmen_app/widgets/nav_bar.dart';
import 'package:walkmen_app/blocs/music/music_state.dart';
import 'package:walkmen_app/blocs/music/music_event.dart';
import 'package:walkmen_app/blocs/music/music_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<MusicBloc>().add(FetchSongsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: Stack(
        children: [
          Container(
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
          ),
          SafeArea(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  title: const Text(
                    'HOME',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<MusicBloc, MusicState>(
                    builder: (context, state) {
                      if (state is MusicLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is MusicLoaded) {
                        if (state.songs.isEmpty) {
                          return const Center(
                            child: Text(
                              'No se encontraron canciones',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: state.songs.length,
                          itemBuilder: (context, index) {
                            final song = state.songs[index];
                            return SongTile(
                              title: song.title,
                              artist: song.artist,
                              imagePath: 'assets/images/blur.png', // temporal
                            );
                          },
                        );
                      } else if (state is MusicError) {
                        return Center(
                          child: Text(
                            state.message,
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
