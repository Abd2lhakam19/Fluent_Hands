import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluent_hands/core/api/end_points.dart';
import 'package:fluent_hands/features/sign_in/cubit/sign_in_states.dart';
import 'package:fluent_hands/features/sign_in/data/repository/sign_in_repo.dart';
import 'package:fluent_hands/layout/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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
      if (signInModel.status == ApiKey.error) {
        return emit(SignInFailure(errormessage: signInModel.message));
      } else {
        CacheHelper.sharedPreferences.setBool('isLogIn', true);
        CacheHelper.sharedPreferences.setString('token', signInModel.token);
        return emit(SignInSuccess(response: signInModel));
      }
    });
  }

  Future<void> signInWithFacebook(var context) async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    print("${loginResult.accessToken!.grantedPermissions}");

    // Once signed in, return the UserCredential
    FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential)
        .then((value) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const AppLayout(),
      ));
    });
  }

  signInWithGoogle() {}
}
