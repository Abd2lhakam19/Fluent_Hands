import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:fluent_hands/core/api/dio_consumer.dart';
import 'package:fluent_hands/features/home/cubit/home_cubit.dart';
import 'package:fluent_hands/features/home/cubit/home_states.dart';
import 'package:fluent_hands/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/helper/app_assets.dart';
import '../../../../core/helper/font_weight_helper.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../main.dart';

class ScanSign extends StatefulWidget {
  ScanSign({super.key});

  @override
  State<ScanSign> createState() => _ScanSignState();
}

class _ScanSignState extends State<ScanSign> {
  HomeCubit homeCubit =
      HomeCubit(homeRepo: HomeRepo(api: DioConsumer(dio: Dio())));
  late CameraController controller;
  int selectedCameraIndex = 0;
  double zoomLevel = 1.0;
  bool flashed = false;
  @override
  void initState() {
    controller = CameraController(cameras![0], ResolutionPreset.medium);
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
        CameraController(cameras![selectedCameraIndex], ResolutionPreset.high);
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
      if (picture != null) {
        setState(() {
          homeCubit.imageFile = picture;
          homeCubit.getPredict();
          // If you want to do something with the captured image, you can use `picture.path`
          print('Picture saved to: ${homeCubit.imageFile!.path}');
        });
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      bloc: homeCubit,
      listener: (context, state) {
        if (state is SuccessScannedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Container(
                  alignment: Alignment.center,
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 60.h),
                  height: 354.h,
                  width: 330.w,
                  decoration: BoxDecoration(
                    color: AppColors.darkWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      state.message == "not clear"
                          ? Text(
                              "الصورة ليست واضحة",
                              style: GoogleFonts.cairo(
                                color: const Color(0xff332ba1),
                                fontWeight: FontWeightHelper.semiBold,
                                fontSize: 24.sp,
                              ),
                            )
                          : Text(
                              homeCubit.arabicAlphabets[state.message]!,
                              style: GoogleFonts.cairo(
                                color: const Color(0xff332ba1),
                                fontWeight: FontWeightHelper.semiBold,
                                fontSize: 24.sp,
                              ),
                            ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Image.asset(AppAssets.pigHand),
                    ],
                  )),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
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
            leading: GestureDetector(
              onTap: () {
                setState(() {
                  flashed = !flashed;
                });
              },
              child: ImageIcon(
                AssetImage(!flashed ? AppAssets.flashOff : AppAssets.flashOn),
                size: 40,
                color: Colors.white,
              ),
            ),
            actions: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(AppAssets.add)),
            ],
            centerTitle: true,
            title: Text(
              "Scan",
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
                    aspectRatio: MediaQuery.of(context).devicePixelRatio,
                    child: CameraPreview(controller),
                  ),
                ),
                // if(imagePath!=null) Image.file(File(imagePath!.path)),
                Positioned(
                  bottom: 50,
                  left: 10,
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50.w,
                      ),
                      Container(
                        height: 48.h,
                        width: 48.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xffc4c4c4).withOpacity(0.19)),
                        child: const Center(
                          child: ImageIcon(
                            AssetImage(AppAssets.gallery),
                            color: Colors.white,
                            size: 30,
                          ),
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
      },
    );
  }
}
