import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_hands/features/home/cubit/home_cubit.dart';
import 'package:fluent_hands/features/home/cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  HomeCubit homeCubit =
      HomeCubit(homeRepo: HomeRepo(api: DioConsumer(dio: Dio())));
  late Future<void> initializeControllerFuture;
  bool isRecording = false;
  String? videoPath;
  XFile? videoFile;
  int selectedCameraIndex = 0;
  @override
  void initState() {
    controller = CameraController(cameras![0], ResolutionPreset.high);
    initializeControllerFuture = controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  toggleCamera() async {
    //emit(RotateCameraState());
    // Dispose of the old controller and switch to the new camera
    await controller.dispose();
    selectedCameraIndex = (selectedCameraIndex + 1) % cameras!.length;
    controller =
        CameraController(cameras![selectedCameraIndex], ResolutionPreset.high);
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

    final directory = await getTemporaryDirectory();
    final filePath =
        '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';

    try {
      await controller.startVideoRecording();
      setState(() {
        isRecording = true;
        videoPath = filePath;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> stopRecording() async {
    if (!controller.value.isRecordingVideo) {
      return;
    }

    try {
      videoFile = await controller.stopVideoRecording();
      setState(() {
        isRecording = false;
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
                  btnOkOnPress: () {})
              .show();
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
          ),
          body: FutureBuilder<void>(
              future: initializeControllerFuture,
              builder: (builder, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(
                    children: [
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
                              backgroundColor: Colors.red,
                              onPressed:
                                  isRecording ? stopRecording : startRecording,
                              child: Icon(
                                  isRecording ? Icons.stop : Icons.video_call),
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
