import 'package:bloc/bloc.dart';
import 'package:fluent_hands/features/sign_up/cubit/sign_up_states.dart';
import 'package:fluent_hands/features/sign_up/data/repository/sign_up_repo.dart';
import 'package:flutter/material.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(this.singUpRepo) : super(SignUpInitial());
  final singUpFormKey = GlobalKey<FormState>();

  final SingUpRepo singUpRepo;
  // Sign Up Name
  TextEditingController nameController = TextEditingController();
  //Sign Up Email
  TextEditingController emailController = TextEditingController();
  //Sign Up Password
  TextEditingController passwordController = TextEditingController();

  //Sign Up Confirm Password
  TextEditingController confirmPasswordController = TextEditingController();
  signUp() async {
    emit(SignUpLoading());

    final response = await singUpRepo.signUp(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text);
  }
}
