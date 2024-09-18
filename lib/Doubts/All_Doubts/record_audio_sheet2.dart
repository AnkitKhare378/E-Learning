import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:e_learning/Doubts/audio_playback_screen.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

class RecordAudioSheet2 extends StatefulWidget {
  const RecordAudioSheet2({super.key});

  @override
  State<RecordAudioSheet2> createState() => _RecordAudioSheet2State();
}

class _RecordAudioSheet2State extends State<RecordAudioSheet2> {
  final RecorderController _controller = RecorderController();
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioRecorder _audioRecorder = AudioRecorder();

  String? _recordingPath;
  bool _isRecording = false, _isPlaying = false, _isPaused = false;
  Timer? _timer;
  Duration _elapsed = Duration.zero;
  late String _recordingFileName;

  @override
  void dispose() {
    _timer?.cancel();
    _audioPlayer.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 18),
          const Text(
            'Record your audio',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Icon(Icons.mic, size: 100, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 10),
          if (_recordingPath != null)
            MaterialButton(
              onPressed: () async {
                if (_audioPlayer.playing) {
                  _audioPlayer.stop();
                  setState(() {
                    _isPlaying = false;
                  });
                } else {
                  await _audioPlayer.setFilePath(_recordingPath!);
                  _audioPlayer.play();
                  setState(() {
                    _isPlaying = true;
                  });
                }
              },
              color: Theme.of(context).colorScheme.primary,
              child: Text(
                _isPlaying
                    ? "Stop Playing Recording"
                    : "Start Playing Recording",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          if (_recordingPath == null)
            const Text(
              'Tap on Start to Record',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(height: 20),
          Text(
            '${_elapsed.toString().split('.').first.substring(2)}', // Format the elapsed time
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _recordingButton(),
          const SizedBox(height: 20),
          if (!_isRecording && _recordingPath != null)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AudioPlaybackScreen(
                      filePath: _recordingPath!,
                      controller: _controller,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Expanded(
            child: AudioWaveforms(
              size: Size(MediaQuery.of(context).size.width, 200.0),
              recorderController: _controller,
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
        ],
      ),
    );
  }

  Widget _recordingButton() {
    return _isRecording
        ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            if (_isPaused) {
              await _audioRecorder.resume();
              _resumeTimer(); // Resuming the timer
              setState(() {
                _isPaused = false;
              });
            } else {
              await _audioRecorder.pause();
              _pauseTimer(); // Pausing the timer
              setState(() {
                _isPaused = true;
              });
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _isPaused ? Colors.green : Colors.orange,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            _isPaused ? 'Resume' : 'Pause',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: () async {
            String? filePath = await _audioRecorder.stop();
            _timer?.cancel();
            if (filePath != null) {
              setState(() {
                _isRecording = false;
                _isPaused = false;
                _recordingPath = filePath;
                _recordingFileName = p.basename(filePath);
              });
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Stop',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    )
        : ElevatedButton(
      onPressed: () async {
        if (await _audioRecorder.hasPermission()) {
          final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
          final String filePath = p.join(appDocumentsDir.path, "recording-${DateTime.now().millisecondsSinceEpoch}.wav");
          await _audioRecorder.start(
            const RecordConfig(),
            path: filePath,
          );
          setState(() {
            _isRecording = true;
            _isPaused = false;
            _recordingPath = null;
          });

          // Start the timer
          _elapsed = Duration.zero;
          _startTimer();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFd63031),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Start',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (_isRecording) {
        setState(() {
          _elapsed += const Duration(seconds: 1);
        });
      } else {
        t.cancel();
      }
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
  }

  void _resumeTimer() {
    _startTimer();
  }
}
