import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_hands/core/theming/app_colors.dart';
import 'package:fluent_hands/features/home/cubit/home_cubit.dart';
import 'package:fluent_hands/features/home/cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/api/dio_consumer.dart';
import '../../../../core/helper/app_assets.dart';
import '../../../../core/helper/font_weight_helper.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../main.dart';
import '../../data/repos/home_repo.dart';

class FullTextScan extends StatefulWidget {
  FullTextScan({super.key, required this.training, this.word});
  bool training;
  String? word;

  @override
  State<FullTextScan> createState() => _FullTextScanState();
}

class _FullTextScanState extends State<FullTextScan> {
  late CameraController controller;
  FlutterTts flutterTts = FlutterTts();
  HomeCubit homeCubit =
      HomeCubit(homeRepo: HomeRepo(api: DioConsumer(dio: Dio())));
  late Future<void> initializeControllerFuture;
  bool isRecording = false;
  String? videoPath;
  XFile? videoFile;
  int selectedCameraIndex = 0;
  bool isClicked = false;
  int _counter = 3;
  late Timer _timer;
  void _startTimer() {
    if (_counter != 5) {
      isClicked = true;
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 1) {
          _counter--;
        } else {
          _counter = 1;
          _timer.cancel();
          isClicked = false;
        }
      });
    });
  }

  @override
  void initState() {
    controller = CameraController(cameras![0], ResolutionPreset.low);
    initializeControllerFuture = controller.initialize();
    flutterTts.getVoices.then((value) {
      List<Map> voices = List<Map>.from(value);
      voices.where((voice) => voice["name"].contains("ar")).toList();
      setVoice(voices.first);
    });
    super.initState();
  }

  void initTTS() {
    flutterTts.getVoices.then((data) {
      try {
        List<Map> voices = List<Map>.from(data);
        setState(() {
          voices =
              voices.where((voice) => voice["name"].contains("ar")).toList();

          setVoice(voices.first);
        });
      } catch (e) {
        print(e);
      }
    });
  }

  void setVoice(Map voice) {
    flutterTts.setVoice({"name": voice["name"], "locale": voice["locale"]});
  }

  speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  void dispose() {
    controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  toggleCamera() async {
    //emit(RotateCameraState());
    // Dispose of the old controller and switch to the new camera
    await controller.dispose();
    selectedCameraIndex = (selectedCameraIndex + 1) % cameras!.length;
    controller =
        CameraController(cameras![selectedCameraIndex], ResolutionPreset.low);
    controller.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  Future<void> startRecording() async {
    if (!controller.value.isInitialized) {
      return;
    }
    _startTimer();

    await Future.delayed(const Duration(seconds: 3));
    final directory = await getTemporaryDirectory();
    final filePath =
        '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';

    try {
      await controller.startVideoRecording();
      setState(() {
        isRecording = true;
        _counter = 5;
        _startTimer();
        videoPath = filePath;
      });
    } catch (e) {
      print(e);
    }
    await Future.delayed(const Duration(seconds: 5));
    stopRecording();
  }

  Future<void> stopRecording() async {
    if (!controller.value.isRecordingVideo) {
      return;
    }

    try {
      videoFile = await controller.stopVideoRecording();
      setState(() {
        isRecording = false;
        _counter = 3;
        if (videoFile != null) {
          homeCubit.videoFile = videoFile;
          homeCubit.videoPredict();
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      bloc: homeCubit,
      listener: (context, state) {
        if (state is SuccessRecordingState && widget.training == false) {
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  desc: state.message,
                  btnOkText: "ok",
                  btnOkOnPress: () {})
              .show();
          speak(state.message);
        } else if (state is SuccessRecordingState &&
            widget.training == true &&
            widget.word != null) {
          if (state.message == widget.word) {
            AwesomeDialog(
                    context: context,
                    dialogType: DialogType.success,
                    desc: "أحسنت لقد أديت الكلمة بنجاح",
                    btnOkOnPress: () {})
                .show();
          } else {
            AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    desc: "من فضلك تدرب على الكلمة جيدا وحاول مرة أخرى",
                    btnCancelOnPress: () {})
                .show();
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(AppAssets.add)),
            ],
            centerTitle: true,
            title: Text(
              "Scan".tr(),
              style: TextStyles.medium24Black.copyWith(
                  color: Colors.white, fontWeight: FontWeightHelper.semiBold),
            ),
            leading: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                isClicked ? _counter.toString() : "",
                style: TextStyles.medium24Black.copyWith(
                    color: Colors.white, fontWeight: FontWeightHelper.semiBold),
              ),
            ),
          ),
          body: FutureBuilder<void>(
              future: initializeControllerFuture,
              builder: (builder, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(
                    children: [
                      // const Positioned(child: Text("3")),
                      Positioned.fill(child: CameraPreview(controller)),
                      Positioned(
                        bottom: 50.h,
                        left: 10.w,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 50.w,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 48.h,
                                width: 48.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xffc4c4c4)
                                        .withOpacity(0.19)),
                                child: const Center(
                                    child: Text("sp",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20))),
                              ),
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            FloatingActionButton(
                              backgroundColor: AppColors.blueColor,
                              onPressed: startRecording,
                              child: isRecording
                                  ? Text(
                                      _counter.toString(),
                                      style: TextStyles.medium24Black.copyWith(
                                          color: Colors.white,
                                          fontWeight:
                                              FontWeightHelper.semiBold),
                                    )
                                  : const Icon(
                                      Icons.video_call,
                                      color: Colors.white,
                                    ),
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            GestureDetector(
                                onTap: () {
                                  toggleCamera();
                                },
                                child: Image.asset(AppAssets.rotateCamera)),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        );
      },
    );
  }
}
