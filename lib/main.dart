import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:xzelaphone_app/screen/list_of_surah_and_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const HolophoneApp(),
    );
  }
}

class HolophoneApp extends StatefulWidget {
  const HolophoneApp({super.key});

  @override
  State<HolophoneApp> createState() => _HolophoneAppState();
}

class _HolophoneAppState extends State<HolophoneApp> {
  final AudioPlayer _player = AudioPlayer();
  final SurahPlayer _mp3 = SurahPlayer();
  final SurahNamed _named = SurahNamed();
  int _currentIndex = -1;
  bool _isPlaying = false;
  bool _isLooping = false;

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _playPauseAudio(int index) async {
    if (_currentIndex == index) {
      if (_isPlaying) {
        await _player.pause();
      } else {
        await _player.resume();
      }
      setState(() {
        _isPlaying = !_isPlaying;
      });
    } else {
      await _player.stop();
      await _player.play(AssetSource(_mp3.mp3[index]));
      setState(() {
        _currentIndex = index;
        _isPlaying = true;
      });
    }
  }

  Future<void> _restartAudio(int index) async {
    await _player.stop();
    await _player.play(AssetSource(_mp3.mp3[index]));
    setState(() {
      _currentIndex = index;
      _isPlaying = true;
    });
  }

  Future<void> _toggleLoop() async {
    if (_isLooping) {
      await _player.setReleaseMode(ReleaseMode.release);
    } else {
      await _player.setReleaseMode(ReleaseMode.loop);
    }
    setState(() {
      _isLooping = !_isLooping;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: 1000,
        child: ListView.builder(
          itemCount: _mp3.mp3.length,
          itemBuilder: (context, index) {
            if (index >= _named.named.length) {
              return const SizedBox.shrink();
            }
            return Column(
              children: [
                InkWell(
                    onTap: () async {
                      if (_currentIndex == index) {
                        await _playPauseAudio(index);
                      } else {
                        await _restartAudio(index);
                      }
                    },
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      color: Colors.white38,
                      child: Row(
                        children: [
                          FittedBox(
                            child: Text(
                              _named.named[index],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 35,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              _restartAudio(index);
                            },
                            icon: const Icon(
                              Icons.repeat,
                              size: 25,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: _toggleLoop,
                            icon: Icon(
                              _isLooping ? Icons.repeat_one : Icons.repeat,
                              size: 30,
                              color: _isLooping ? Colors.blue : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )),
                const Divider(
                  color: Colors.black,
                  height: 1,
                )
              ],
            );
          },
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }
}
