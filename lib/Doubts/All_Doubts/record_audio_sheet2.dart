import 'dart:io';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class RecordAudioSheet2 extends StatefulWidget {
  const RecordAudioSheet2({super.key});

  @override
  State<RecordAudioSheet2> createState() => _RecordAudioSheet2State();
}

class _RecordAudioSheet2State extends State<RecordAudioSheet2> {
  final AudioRecorder audioRecorder = AudioRecorder();
  final AudioPlayer audioPlayer = AudioPlayer();

  String? recordingPath;
  bool isRecording = false, isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5),
          Text(
            'Record your audio',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Icon(Icons.mic, size: 100, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 10),
          if (recordingPath != null)
            MaterialButton(
              onPressed: () async {
                if (audioPlayer.playing) {
                  audioPlayer.stop();
                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  await audioPlayer.setFilePath(recordingPath!);
                  audioPlayer.play();
                  setState(() {
                    isPlaying = true;
                  });
                }
              },
              color: Theme.of(context).colorScheme.primary,
              child: Text(
                isPlaying
                    ? "Stop Playing Recording"
                    : "Start Playing Recording",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          if (recordingPath == null)
            const Text(
              "No Recording Found. :(",
            ),
          const SizedBox(height: 20),
          _recordingButton(),
        ],
      ),
    );
  }

  Widget _recordingButton() {
    return isRecording
        ? ElevatedButton(
      onPressed: () async {
        String? filePath = await audioRecorder.stop();
        if (filePath != null) {
          setState(() {
            isRecording = false;
            recordingPath = filePath;
          });
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red, // Customize the background color
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
      ),
      child: const Text(
        'Stop',
        style: TextStyle(
          color: Colors.white, // Customize the text color
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    )
        : ElevatedButton(
      onPressed: () async {
        if (await audioRecorder.hasPermission()) {
          final Directory appDocumentsDir =
          await getApplicationDocumentsDirectory();
          final String filePath =
          p.join(appDocumentsDir.path, "recording.wav");
          await audioRecorder.start(
            const RecordConfig(),
            path: filePath,
          );
          setState(() {
            isRecording = true;
            recordingPath = null;
          });
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFd63031), // Customize the background color
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
      ),
      child: const Text(
        'Start',
        style: TextStyle(
          color: Colors.white, // Customize the text color
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
