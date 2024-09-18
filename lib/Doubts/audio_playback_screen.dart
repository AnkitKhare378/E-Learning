import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:simple_waveform_progressbar/simple_waveform_progressbar.dart';

class AudioPlaybackScreen extends StatefulWidget {
  final String filePath;
  final RecorderController controller;

  const AudioPlaybackScreen({
    super.key,
    required this.filePath,
    required this.controller,
  });

  @override
  _AudioPlaybackScreenState createState() => _AudioPlaybackScreenState();
}

class _AudioPlaybackScreenState extends State<AudioPlaybackScreen> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer()
      ..setFilePath(widget.filePath)
      ..playbackEventStream.listen((event) {
        setState(() {
          _duration = event.duration ?? Duration.zero;
          _position = _audioPlayer.position;
        });
      })
      ..positionStream.listen((position) {
        setState(() {
          _position = position;
        });
      });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _togglePlayback() async {
    try {
      if (_isPlaying) {
        await _audioPlayer.stop();
      } else {
        await _audioPlayer.play();
      }
      setState(() {
        _isPlaying = !_isPlaying;
      });
    } catch (e) {
      // Handle errors here
      print('Error occurred while toggling playback: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Playback'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: AudioWaveforms(
                size: Size(MediaQuery.of(context).size.width, 200.0),
                recorderController: widget.controller,
                enableGesture: true,
                waveStyle: WaveStyle(
                  waveColor: Colors.black,
                  showDurationLabel: true,
                  spacing: 8.0,
                  showBottom: false,
                  extendWaveform: true,
                  showMiddleLine: false,
                  gradient: ui.Gradient.linear(
                    const Offset(70, 50),
                    Offset(MediaQuery.of(context).size.width / 2, 0),
                    [Colors.black, Colors.green],
                  ),
                ),
              ),
            ),
            Slider(
              min: 0.0,
              max: _duration.inSeconds.toDouble(),
              value: _position.inSeconds.toDouble(),
              onChanged: (value) {
                setState(() {
                  _position = Duration(seconds: value.toInt());
                });
                _audioPlayer.seek(_position);
              },
              activeColor: Colors.red,
              inactiveColor: Colors.grey,
            ),
            MaterialButton(
              onPressed: _togglePlayback,
              color: Theme.of(context).colorScheme.primary,
              child: Text(
                _isPlaying ? 'Stop Playing' : 'Start Playing',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            if (_audioPlayer.playing && _audioPlayer.position == _duration)
              const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
