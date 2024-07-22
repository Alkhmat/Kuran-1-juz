// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:xzelaphone_app/screen/list_of_surah_and_name.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(),
//       home: const HolophoneApp(),
//     );
//   }
// }

// class HolophoneApp extends StatefulWidget {
//   const HolophoneApp({super.key});

//   @override
//   State<HolophoneApp> createState() => _HolophoneAppState();
// }

// class _HolophoneAppState extends State<HolophoneApp> {
//   final AudioPlayer _player = AudioPlayer();
//   final SurahPlayer _mp3 = SurahPlayer();
//   final named = SurahNamed();

//   @override
//   void dispose() {
//     _player.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SizedBox(
//       width: double.infinity,
//       height: 1000,
//       child: ListView.builder(
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               InkWell(
//                 onTap: () async {
//                   try {
//                     await _player.play(AssetSource(_mp3.mp3[index]));
//                   } catch (e) {
//                     print('Ошибка при воспроизведении аудио: $e');
//                   }
//                 },
//                 child: ListTile(
//                   title: Text(
//                     named.named[index],
//                   ),
//                 ),
//               ),
//               const Divider(
//                 color: Colors.black,
//                 height: 1,
//               )
//             ],
//           );
//         },
//         itemCount: _mp3.mp3.length,
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//       ),
//     ));
//   }
// }
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
  int _currentIndex = -1; // Хранит индекс текущего воспроизведения
  bool _isPlaying = false; // Хранит состояние воспроизведения

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
      // Если проигрывается другой трек, сначала остановить текущий
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: 1000,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () async {
                  if (_currentIndex == index) {
                    // Если нажата та же кнопка, переключаем состояние воспроизведения
                    await _playPauseAudio(index);
                  } else {
                    // Запустить или перезапустить трек, если выбран новый
                    await _restartAudio(index);
                  }
                },
                child: ListTile(
                  trailing: IconButton(
                      onPressed: () {
                        _restartAudio(index);
                      },
                      icon: const Icon(Icons.restart_alt)),
                  title: Text(
                    _named.named[index],
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                height: 1,
              )
            ],
          );
        },
        itemCount: _mp3.mp3.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
      ),
    ));
  }
}
