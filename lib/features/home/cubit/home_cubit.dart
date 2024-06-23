import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:fluent_hands/features/home/cubit/home_states.dart';
import 'package:fluent_hands/features/home/data/repos/home_repo.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit({required this.homeRepo}) : super(LoadingScannedState());
  HomeRepo homeRepo;
  Dio dio = Dio();
  XFile? imageFile;
  XFile? videoFile;

  Map<String, String> arabicAlphabets = {
    'أ': 'حرف الألف',
    'ب': 'حرف الباء',
    'ت': 'حرف التاء',
    'ث': 'حرف الثاء',
    'ج': 'حرف الجيم',
    'ح': 'حرف الحاء',
    'خ': 'حرف الخاء',
    'د': 'حرف الدال',
    'ذ': 'حرف الذال',
    'ر': 'حرف الراء',
    'ز': 'حرف الزاي',
    'س': 'حرف السين',
    'ش': 'حرف الشين',
    'ص': 'حرف الصاد',
    'ض': 'حرف الضاد',
    'ط': 'حرف الطاء',
    'ظ': 'حرف الظاء',
    'ع': 'حرف العين',
    'غ': 'حرف الغين',
    'ف': 'حرف الفاء',
    'ق': 'حرف القاف',
    'ك': 'حرف الكاف',
    'ل': 'حرف اللام',
    'م': 'حرف الميم',
    'ن': 'حرف النون',
    'ه': 'حرف الهاء',
    'و': 'حرف الواو',
    'ي': 'حرف الياء',
    // Add more if needed
  };

  // zoomIn() {
  //   // emit(ZoomInState());
  //
  //   zoomLevel += 0.1;
  //   controller.setZoomLevel(zoomLevel);
  // }
  //
  // zoomOut() {
  //   zoomLevel -= 0.1;
  //   controller.setZoomLevel(zoomLevel);
  // }

  getPredict() async {
    emit(LoadingScannedState());
    final response = await homeRepo.getPredict(image: imageFile!);
    response.fold(
      (errorMessage) => emit(FailureScannedState()),
      (homeModel) => emit(
        SuccessScannedState(message: homeModel.result),
      ),
    );
    print(response);
  }

  videoPredict() async {
    emit(LoadingRecordingState());

    final response = await homeRepo.getWordPredict(videoPath: videoFile!);
    response.fold(
      (errorMessage) => emit(FailureRecordingState()),
      (homeModel) => emit(
        SuccessRecordingState(message: homeModel.result),
      ),
    );
  }
}
