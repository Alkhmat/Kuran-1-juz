import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HolophoneApp extends StatefulWidget {
  const HolophoneApp({super.key});

  @override
  State<HolophoneApp> createState() => _HolophoneAppState();
}

class _HolophoneAppState extends State<HolophoneApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            InkWell(
              onTap: () async {
                final player = AudioPlayer();
               await player.play(AssetSource('music/cola.Lana.mp3'));
              },
              child: Container(
              height: 82,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Text('DO', style: TextStyle(color: Colors.white, fontSize: 30),)),
                        ),
            ),
            InkWell(
              onTap: () async {
                final player = AudioPlayer();
               await player.play(AssetSource('music/call.mp3'));
              },
              child: Container(
              height: 82,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Text('RE', style: TextStyle(color: Colors.black, fontSize: 30),)),
                        ),
            ),
            InkWell(
              onTap: () async {
                final player = AudioPlayer();
               await player.play(AssetSource('music/chime.mp3'));
              },
              child: Container(
              height: 82,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Text('MI', style: TextStyle(color: Colors.white, fontSize: 30),)),
                        ),
            ),
            InkWell(
              onTap: () async {
                final player = AudioPlayer();
               await player.play(AssetSource('music/error.mp3'));
              },
              child: Container(
              height: 82,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Text('FA', style: TextStyle(color: Colors.black, fontSize: 30),)),
                        ),
            ),
            InkWell(
              onTap: () async {
                final player = AudioPlayer();
               await player.play(AssetSource('music/error2.mp3'));
              },
              child: Container(
              height: 82,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.
                  black,
                  borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Text('SO', style: TextStyle(color: Colors.white, fontSize: 30),)),
                        ),
            ),
            InkWell(
              onTap: () async {
                final player = AudioPlayer();
               await player.play(AssetSource('music/piano.mp3'));
              },
              child: Container(
              height: 82,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Text('LA', style: TextStyle(color: Colors.black, fontSize: 30),)),
                        ),
            ),
            InkWell(
              onTap: () async {
                final player = AudioPlayer();
               await player.play(AssetSource('music/scale.mp3'));
              },
              child: Container(
              height: 82,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Text('SI', style: TextStyle(color: Colors.white, fontSize: 30),)),
                        ),
            ),
            InkWell(
              onTap: () async {
                final player = AudioPlayer();
               await player.play(AssetSource('music/trumpet.mp3'));
              },
              child: Container(
              height: 82,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Text('DO', style: TextStyle(color: Colors.black, fontSize: 30),)),
                        ),
            ),
         
         
        ],
      ),
      
    );
  }
}

class BottomApp extends StatefulWidget {
  const BottomApp({super.key});

  @override
  State<BottomApp> createState() => _BottomAppState();
}

class _BottomAppState extends State<BottomApp> {

// ignore: unused_field
static int selecIndex_ = -0;
  

  OnTapScreeen( int i){
    setState(() {
      selecIndex_ = i;
    });
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 15,
            left: 50,
            right: 50,
            child: Card(
              elevation:10 ,
              shape: RoundedRectangleBorder(borderRadius: 
              BorderRadius.circular(18),
              ),
              child: BottomNavigationBar(
                currentIndex: selecIndex_,
                onTap: OnTapScreeen ,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.fork_left_outlined),
                label: 'under'
                ),
                  BottomNavigationBarItem(icon: Icon(Icons.pause),
                label: 'pause'
                ),
                  BottomNavigationBarItem(icon: Icon(Icons.fork_right_outlined),
                label: 'next'
                )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}