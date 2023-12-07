import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';
import 'package:voice_message_package/voice_message_package.dart';

class Check extends StatefulWidget {
  const Check({Key? key}) : super(key: key);
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  bool isRecording = false;
  bool isTyping = false;
  TextEditingController? controller;
  String? path;
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlay = false;

  Future<void> playRecord(String url) async {
    setState(() {
      isPlay = true;
      audioPlayer.play(UrlSource(url));
      print("this is url ----------------------------------> $url");
    });
  }

  Future<void> pauseRecord() async {
    setState(() {
      isPlay = false;
      audioPlayer.pause();
    });
  }

  onChanged(String value) {
    if (value.isNotEmpty) {
      setState(() {
        isTyping = true;
      });
    } else {
      setState(() {
        isTyping = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isRecording;
    isTyping;
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 140, left: 4, right: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                isRecording
                    ? Container()
                    : Expanded(
                        flex: 2,
                        child: TextFormField(
                          onChanged: (val) {
                            onChanged(val);
                          },
                          style: const TextStyle(color: Colors.black),
                          controller: controller,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.redAccent, width: 2.0))),
                        ),
                      ),
                isRecording || isTyping
                    ? Container()
                    : const Icon(Icons.camera_sharp),

                //Spacer(),
                isTyping
                    ? Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        padding: const EdgeInsets.all(10),
                        // height: 50,
                        child: const CircleAvatar(
                          radius: 20,
                          child: Icon(
                            Icons.send,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      )
                    : Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            
                            onLongPressDown: (details) {
                              setState(() {
                                isRecording = true;
                              });
                            },
                            onTap: () {
                              setState(() {
                                isRecording = true;
                              });
                            },
                            onLongPress: () {
                              setState(() {
                                isRecording = true;
                              });
                            },
                            onLongPressUp: () {
                              setState(() {
                                isRecording = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: SocialMediaRecorder(
                                recordIconBackGroundColor: Colors.red,
                                recordIconWhenLockBackGroundColor: Colors.teal,
                                sendRequestFunction: (File soundFile) {
                                  path = soundFile.path;
                                  
                                  setState(() {
                                    isRecording = false;
                                  });
                                },
                                // maxRecordTimeInSecond: 5,
                                encode: AudioEncoderType.OPUS,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                isPlay ? pauseRecord() : playRecord(path!);
                print("path from function ..... ");
              },
              icon: Icon(isPlay ? Icons.pause : Icons.play_arrow))

          /*  VoiceMessage(
            mePlayIconColor: Colors.black,

            contactPlayIconColor: Colors.brown,
            contactPlayIconBgColor: Colors.blue,
            audioSrc: path ?? "",
            played: false, // To show played badge or not.
            me: true, // Set message side.
            onPlay: () {
              setState(() {
                AudioPlayer audioPlayer = AudioPlayer();
                audioPlayer.play(AssetSource(path!));
              });
            }, // Do something when voice played.
          ), */
        ],
      ),
    );
  }
}
