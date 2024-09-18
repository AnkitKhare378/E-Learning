import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_voice_recorder/flutter_voice_recorder.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class RecordAudioSheet extends StatefulWidget {
  @override
  _RecordAudioSheetState createState() => _RecordAudioSheetState();
}

class _RecordAudioSheetState extends State<RecordAudioSheet> {
  FlutterVoiceRecorder? _recorder;
  bool _isRecording = false;
  bool _isPaused = false;
  bool _isStopped = false;
  Duration _recordingTime = Duration.zero;
  Timer? _timer;
  String _filePath = 'file_path';

  @override
  void initState() {
    super.initState();
    _initRecorder();
  }

  Future<void> _initRecorder() async {
    try {
      bool? hasPermission = await FlutterVoiceRecorder.hasPermissions;
      if (!hasPermission!) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Permission required to record audio.')),
        );
        return;
      }

      final directory = await getApplicationDocumentsDirectory();
      _filePath = '${directory.path}/audio.mp4';

      _recorder = FlutterVoiceRecorder(_filePath, audioFormat: AudioFormat.AAC);
      await _recorder!.initialized;
    } catch (e) {
      print('Error initializing recorder: $e');
    }
  }

  Future<void> _startRecording() async {
    try {
      if (_recorder == null) return;

      await _recorder!.start();
      setState(() {
        _isRecording = true;
        _isPaused = false;
        _isStopped = false;
      });

      _timer = Timer.periodic(Duration(milliseconds: 50), (Timer t) async {
        var current = await _recorder!.current(channel: 0);
        if (current != null) {
          setState(() {
            _recordingTime = current.duration ?? Duration.zero;
          });
        }
      });
    } catch (e) {
      print('Error starting recording: $e');
    }
  }

  Future<void> _pauseRecording() async {
    try {
      if (_recorder == null) return;

      await _recorder!.pause();
      setState(() {
        _isPaused = true;
      });
    } catch (e) {
      print('Error pausing recording: $e');
    }
  }

  Future<void> _resumeRecording() async {
    try {
      if (_recorder == null) return;

      await _recorder!.resume();
      setState(() {
        _isPaused = false;
      });
    } catch (e) {
      print('Error resuming recording: $e');
    }
  }

  Future<void> _stopRecording() async {
    try {
      if (_recorder == null) return;

      var result = await _recorder!.stop();
      _timer?.cancel();
      setState(() {
        _isRecording = false;
        _isPaused = false;
        _isStopped = true;
      });

      await _initRecorder();
    } catch (e) {
      print('Error stopping recording: $e');
    }
  }

  Future<void> _submitRecording() async {
    try {
      if (_filePath.isEmpty) return;

      final file = File(_filePath);
      if (await file.exists()) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Audio file saved successfully at $_filePath.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save audio file.')),
        );
      }
    } catch (e) {
      print('Error submitting recording: $e');
    }
  }

  @override
  void dispose() {
    if (_isRecording) {
      _recorder?.stop();
    }
    _timer?.cancel();
    super.dispose();
  }

  String getFormattedTime(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Record your audio',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: _isRecording
                ? _isPaused
                ? Icon(Icons.pause, size: 100, color: Colors.grey.shade700)
                : Icon(Icons.stop, size: 100, color: Colors.grey.shade700)
                : Icon(Icons.mic, size: 100, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              getFormattedTime(_recordingTime),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: _isRecording ? null : _startRecording,
                child: const Text(
                  "Start",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFd63031),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _isRecording && !_isPaused ? _pauseRecording : (_isPaused ? _resumeRecording : null),
                child: Text(
                  _isPaused ? "Resume" : "Pause",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFd63031),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _isRecording ? _stopRecording : null,
                child: const Text(
                  "Stop",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFd63031),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (_isStopped)
            Center(
              child: ElevatedButton(
                onPressed: _submitRecording,
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFd63031),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
