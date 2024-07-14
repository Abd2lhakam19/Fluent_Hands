import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluent_hands/core/api/dio_consumer.dart';
import 'package:fluent_hands/features/home/cubit/home_cubit.dart';
import 'package:fluent_hands/features/home/cubit/home_states.dart';
import 'package:fluent_hands/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/app_assets.dart';
import '../../../../core/helper/font_weight_helper.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../main.dart';

class ScanSign extends StatefulWidget {
  ScanSign({super.key, required this.training, this.word});
  bool training;
  String? word;
  final Map<String, String> alphabets = {
    'حرف الالف': 'أ',
    'حرف الباء': "ب",
    'حرف التاء': "ت",
    'حرف الثاء': "ث",
    'حرف الجيم': "ج",
    'حرف الحاء': "ح",
    'حرف الخاء': "خ",
    'حرف الدال': "د",
    'حرف الذال': "ذ",
    'حرف الراء': "ر",
    'حرف الزاي': "ز",
    'حرف السين': "س",
    'حرف الشين': "ش",
    'حرف الصاد': "ص",
    'حرف الضاد': "ض",
    'حرف الطاء': "ط",
    'حرف الظاء': "ظ",
    'حرف العين': "ع",
    'حرف الغين': "غ",
    'حرف الفاء': "ف",
    'حرف القاف': "ق",
    'حرف الكاف': "ك",
    'حرف اللام': "ل",
    'حرف الميم': "م",
    'حرف النون': "ن",
    'حرف الهاء': "ه",
    'حرف الواو': "و",
    'حرف الياء': "ي",
  };

  @override
  State<ScanSign> createState() => _ScanSignState();
}

class _ScanSignState extends State<ScanSign> {
  String res = "";
  HomeCubit homeCubit =
      HomeCubit(homeRepo: HomeRepo(api: DioConsumer(dio: Dio())));
  late CameraController controller;
  int selectedCameraIndex = 0;
  double zoomLevel = 1.0;
  bool flashed = false;
  @override
  void initState() {
    controller = CameraController(cameras![0], ResolutionPreset.low);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
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
        CameraController(cameras![selectedCameraIndex], ResolutionPreset.low);
    controller.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  takePicture() async {
    // emit(TakePictureState());
    try {
      if (flashed == false) {
        await controller.setFlashMode(FlashMode.off);
      }

      final XFile picture = await controller.takePicture();
      setState(() {
        homeCubit.imageFile = picture;
        homeCubit.getPredict();
        // If you want to do something with the captured image, you can use `picture.path`
        print('Picture saved to: ${homeCubit.imageFile!.path}');
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        bloc: homeCubit,
        listener: (context, state) {
          if (state is SuccessScannedState && widget.training == false) {
            if (state.message != "not clear") {
              if (state.message == "أ" && res.isNotEmpty) {
                res += "ا";
              } else {
                res += state.message;
              }
            }

            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              desc: res,
              btnOkOnPress: () {},
              btnOkText: "Ok",
              btnOkColor: AppColors.blueColor,
            ).show();
          } else if (state is SuccessScannedState &&
              widget.training == true &&
              widget.word != null) {
            if (state.message != "not clear") {
              if (state.message == widget.alphabets[widget.word!]) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  desc: "أحسنت لقد أديت الحرف بشكل صحيح",
                  btnOkOnPress: () {},
                  btnOkText: "Ok",
                  btnOkColor: AppColors.blueColor,
                ).show();
              } else if (state.message != widget.alphabets[widget.word!]) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  desc: "من فضلك تدرب على الحرف جيدا وحاول مرة أخرى",
                  btnCancelOnPress: () {},
                ).show();
              }
            }
          } else if (state is FailureScannedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Error While Scanning"),
              ),
            );
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
            body: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.blueColor.withOpacity(0.1),
                    AppColors.blueColor.withOpacity(0.1),
                    AppColors.blueBerry.withOpacity(0.1),
                  ],
                  stops: const [0.18, 0.02, 0.29],
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AspectRatio(
                      aspectRatio: MediaQuery.of(context).size.aspectRatio,
                      child: CameraPreview(controller),
                    ),
                  ),
                  // if(imagePath!=null) Image.file(File(imagePath!.path)),
                  Positioned(
                    bottom: 50,
                    left: 10,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            res += " ";
                          },
                          child: Container(
                            height: 48.h,
                            width: 48.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    const Color(0xffc4c4c4).withOpacity(0.19)),
                            child: const Center(
                                child: Text("sp",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))),
                          ),
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            takePicture();
                          },
                          child: Image.asset(AppAssets.takePhoto),
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
              ),
            ),
          );
        });
  }
}
