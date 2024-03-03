class HomeModel{
  String result;
  HomeModel({required this.result});
  factory HomeModel.fromJson(Map<String,dynamic>jsonData){
    return HomeModel(result: jsonData['result']);
  }
}