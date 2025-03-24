import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkmen_app/screens/home_screen.dart';
import 'package:walkmen_app/blocs/music/music_bloc.dart';
import 'package:walkmen_app/services/audio_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MusicBloc(AudioService()),
      child: MaterialApp(
        title: 'Walkman',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}
