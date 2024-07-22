import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class InkwellApp extends StatelessWidget {
  String? text;
  String? paht;
  //
  InkwellApp(
      {super.key,
      this.text,
      //this.players

      this.paht});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final player = AudioPlayer();
        await player.play(AssetSource('$paht'));
      },
      child: Container(
        height: 82,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
            child: Text(
          '$text',
          style: const TextStyle(color: Colors.white, fontSize: 30),
        )),
      ),
    );
  }
}
