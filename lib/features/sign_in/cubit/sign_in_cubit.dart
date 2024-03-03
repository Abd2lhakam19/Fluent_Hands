import 'package:bloc/bloc.dart';
import 'package:fluent_hands/core/api/end_points.dart';
import 'package:fluent_hands/features/sign_in/cubit/sign_in_states.dart';
import 'package:fluent_hands/features/sign_in/data/repository/sign_in_repo.dart';
import 'package:flutter/material.dart';

import '../../../core/cashe/cashe_helper.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit({required this.singInRepo}) : super(SignInInitial());
  SingInRepo singInRepo;
  TextEditingController singInEmail = TextEditingController();
  TextEditingController singInPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  signIn() async {
    emit(SignInLoading());
    final response = await singInRepo.signIn(
      email: singInEmail.text,
      password: singInPassword.text,
    );

    response
        .fold((errorMessage) => emit(SignInFailure(errormessage: errorMessage)),
            (signInModel) {
      CacheHelper.sharedPreferences.setBool('isLogIn', true);
      return emit(SignInSuccess(response: signInModel));
    });
  }
}
