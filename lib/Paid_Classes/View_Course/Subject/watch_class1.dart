import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchClass1 extends StatefulWidget {
  const WatchClass1({super.key});

  @override
  State<WatchClass1> createState() => _WatchClass1State();
}

class _WatchClass1State extends State<WatchClass1> {
 late YoutubePlayerController _controller;

   @override
   void initState() {
     super.initState();


     _controller = YoutubePlayerController(
       initialVideoId: '0GfC-2AkChA',
       flags: const YoutubePlayerFlags(
         autoPlay: true,
         mute: true,
         //isLive: false,
       ),
     );
   }

   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
      ),
    );

  }
}
