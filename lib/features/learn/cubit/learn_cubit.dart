import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fluent_hands/core/api/dio_consumer.dart';
import 'package:fluent_hands/features/learn/cubit/learn_states.dart';
import 'package:fluent_hands/features/learn/data/models/learn_response.dart';
import 'package:fluent_hands/features/learn/data/repos/learn_repo.dart';
import 'package:flutter/src/widgets/framework.dart';

class LearnCubit extends Cubit<LearnStates>{

  LearnCubit():super(LearnLoadingState());

  LearnRepo learnRepo = LearnRepo(api: DioConsumer(dio: Dio()));
  List<ListSuccess>welcomeList = [];
  List<ListSuccess>generalList = [];
  List<ListSuccess>trafficList = [];



  getLength(int ind){

  }
  getList(int ind){

  }

  getWelcomeWords()async{
    final response = learnRepo.getWords();


  }

  getGeneralWords(){

  }

  getTrafficWords(){

  }

  static LearnCubit get(BuildContext context){
    return LearnCubit();
  }

}