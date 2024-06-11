import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluent_hands/core/api/end_points.dart';
import 'package:fluent_hands/features/sign_in/cubit/sign_in_states.dart';
import 'package:fluent_hands/layout/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../../core/cashe/cashe_helper.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? provider;
  final signInFormKey = GlobalKey<FormState>();
  signInWithEmailAndPassword(var context) async {
    final form = signInFormKey.currentState;
    if (form!.validate()) {
      emit(SignInLoading());
      final email = emailController.text;
      final password = passwordController.text;

      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        CacheHelper.sharedPreferences.setBool('isLogIn', true);

        emit(SignInSuccess(successMessage: "Sign IN Succesful"));
        provider = "emailAndPassword";
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          emit(SignInFailure(
              errormessage: "The password provided is incorrect."));
        } else if (e.code == 'email-does-not-exist') {
          emit(SignInFailure(
              errormessage: "The account does not exist for that email."));
        } else {
          emit(SignInFailure(errormessage: e.message.toString()));
        }
      }
    }
  }

  Future<bool> internetAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result.first.address.isNotEmpty) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } on SocketException catch (e) {
      return Future.value(false);
    }
  }

  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final bool hasInternet = await internetAvailable();
      if (hasInternet) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);
        final userData = await FacebookAuth.instance.getUserData();
        imgUrl = userData['picture']['data']['url'];

        await FirebaseAuth.instance.signInWithCredential(credential);
        CacheHelper.sharedPreferences.setBool('isLogIn', true);
        await AwesomeDialog(
          context: context,
          autoHide: const Duration(seconds: 2),
          showCloseIcon: true,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          title: 'Sign in with Facebook Succesful',
          desc: 'Sign in with Facebook done',
        ).show();
        provider = "facebook";
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const AppLayout(),
          ),
        );
      } else {
        await AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'No internet',
          desc: 'Please connect to the internet and try again',
        ).show();
      }
    } on PlatformException catch (e) {
      if (e.code == '400' && e.message == 'Failed to generate request token.') {
        await AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'No internet',
          desc: 'Please connect to the internet and try again',
        ).show();
      } else {
        rethrow;
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();

    CacheHelper.sharedPreferences.setBool('isLogIn', false);
  }

  static final String twitterApiKey = EndPoints.twitterApiKey;
  static final String twitterApiSecretKey = EndPoints.twitterApiSecretKey;

  static final twitterLogin = TwitterLogin(
    apiKey: twitterApiKey,
    apiSecretKey: twitterApiSecretKey,
    redirectURI: 'socialauth://',
  );

  Future<void> signInWithTwitter(BuildContext context) async {
    try {
      final twitterLoginResult = await twitterLogin.loginV2();
      imgUrl = twitterLoginResult.user!.thumbnailImage;

      if (twitterLoginResult.status == TwitterLoginStatus.loggedIn) {
        final accessToken = twitterLoginResult.authToken;
        final accessTokenSecret = twitterLoginResult.authTokenSecret;
        final twitterAuthCredential = TwitterAuthProvider.credential(
          secret: accessTokenSecret!,
          accessToken: accessToken!,
        );
        await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
        CacheHelper.sharedPreferences.setBool('isLogIn', true);
        await AwesomeDialog(
          context: context,
          autoHide: const Duration(seconds: 2),
          showCloseIcon: true,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          title: 'Sign in with Twitter Succesful',
          desc: 'Sign in with Twitter done',
        ).show();
        provider = "twitter";
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const AppLayout(),
          ),
        );
      } else if (twitterLoginResult.status ==
          TwitterLoginStatus.cancelledByUser) {
        await AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'Cancel',
          desc: 'Sign in with Twitter cancelled',
        ).show();
      }
    } on PlatformException catch (e) {
      if (e.code == '400' && e.message == 'Failed to generate request token.') {
        await AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'No internet',
          desc: 'Please connect to the internet and try again',
        ).show();
      } else {
        rethrow;
      }
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final bool hasInternet = await internetAvailable();
      if (hasInternet) {
        final GoogleSignInAccount? googleSignInAccount =
            await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount!.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        imgUrl = googleSignInAccount.photoUrl!;

        await FirebaseAuth.instance.signInWithCredential(authCredential);
        CacheHelper.sharedPreferences.setBool('isLogIn', true);
        await AwesomeDialog(
          context: context,
          autoHide: const Duration(seconds: 2),
          showCloseIcon: true,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          title: 'Sign in with Google Succesful',
          desc: 'Sign in with Google done',
        ).show();
        provider = "google";
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const AppLayout(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-error') {
        await AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'No internet',
          desc: 'Please connect to the internet and try again',
        ).show();
      } else if (e.code == 'invalid-email') {
        await AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'Invalid Email',
          desc: e.message,
        ).show();
      } else if (e.code == 'wrong-password') {
        await AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'Wrong Password',
          desc: e.message,
        ).show();
      } else if (e.code == 'user-not-found') {
        await AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: 'User not found',
          desc: e.message,
        ).show();
      } else if (e.code == 'operation-not-allowed') {
        await AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: 'Operation not allowed',
          desc: e.message,
        ).show();
      } else if (e.code == 'too-many-requests') {
        await AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'Too many requests',
          desc: e.message,
        ).show();
      } else {
        await AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: 'Error',
          desc: e.message,
        ).show();
      }
    }
  }

  String imgUrl = "https://cdn-icons-png.flaticon.com/512/149/149071.png";
}
