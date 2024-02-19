import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fluent_hands/core/api/end_points.dart';
import 'package:fluent_hands/core/error/exceptions.dart';
import 'package:fluent_hands/features/sign_up/cubit/sign_up_states.dart';
import 'package:fluent_hands/features/sign_up/data/repository/sign_up_repo.dart';
import 'package:flutter/material.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(this.singUpRepo) : super(SignUpInitial());
  final singUpFormKey = GlobalKey<FormState>();

  final SingUpRepo singUpRepo;
  // Sign Up Name
  TextEditingController signUpName = TextEditingController();
  //Sign Up Email
  TextEditingController signUpEmail = TextEditingController();
  //Sign Up Password
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpConfirmPassword = TextEditingController();

  //Sign Up Confirm Password
  TextEditingController confirmPassword = TextEditingController();
  signUp() async {
    emit(SignUpLoading());

    final response = await singUpRepo.signUp(
        role: "user",
        name: signUpName.text,
        email: signUpEmail.text,
        password: signUpPassword.text,
        confirmPassword: signUpConfirmPassword.text);
    print("============+$response");
    response.fold(
      (errorMessage) => emit(SignUpFailure(errormessage: errorMessage)),
      (signUpModel) {
        if (signUpModel.status == ApiKey.success) {
          emit(SignUpSuccess(message: signUpModel.message));
          log(signUpModel.message);
        } else {
          emit(SignUpFailure(errormessage: signUpModel.listErrors.toString()));
          log("============================================");
          log(signUpModel.listErrors.toString());
        }
        //  print(signUpModel);
      },
    );
  }
}
