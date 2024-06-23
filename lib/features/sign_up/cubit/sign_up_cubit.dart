import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluent_hands/core/cashe/cashe_helper.dart';
import 'package:fluent_hands/features/sign_up/cubit/sign_up_states.dart';
import 'package:flutter/material.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitial());
  final singUpFormKey = GlobalKey<FormState>();

  // Sign Up Name
  TextEditingController nameController = TextEditingController();
  //Sign Up Email
  TextEditingController emailController = TextEditingController();
  //Sign Up Password
  TextEditingController passwordController = TextEditingController();

  //Sign Up Confirm Password
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> signUpWithEmailAndPassword(var context) async {
    final form = singUpFormKey.currentState;
    if (form!.validate()) {
      emit(SignUpLoading());
      final email = emailController.text;
      final password = passwordController.text;
      final confirmPassword = confirmPasswordController.text;

      if (password != confirmPassword) {
        emit(SignUpFailure(errormessage: "Password doesn't match"));
        return;
      }

      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        CacheHelper.sharedPreferences.setBool('isLogIn', true);

        emit(SignUpSuccess(successMessage: "Sign Up Succesful"));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(SignUpFailure(
              errormessage: "The password provided is too weak."));
        } else if (e.code == 'email-already-in-use') {
          emit(SignUpFailure(
              errormessage: "The account already exists for that email."));
        } else {
          emit(SignUpFailure(errormessage: e.message.toString()));
        }
      }
    }
  }
}
