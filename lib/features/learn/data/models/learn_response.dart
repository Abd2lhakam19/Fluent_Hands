class LearnResponse {
  LearnResponse({
      this.listSuccess, 
      this.querySuccess, 
      this.imageSuccess, 
      this.status, 
      this.message, 
     });

  LearnResponse.fromJson(dynamic json) {
    if (json['listSuccess'] != null) {
      listSuccess = [];
      json['listSuccess'].forEach((v) {
        listSuccess?.add(ListSuccess.fromJson(v));
      });
    }
    querySuccess = json['querySuccess'];
    imageSuccess = json['imageSuccess'];
    status = json['status'];
    message = json['message'];
  }
  List<ListSuccess>? listSuccess;
  dynamic querySuccess;
  dynamic imageSuccess;
  String? status;
  dynamic message;
  List<dynamic>? listerrors;

}

class ListSuccess {
  ListSuccess({
      this.id, 
      this.wordName, 
      this.imagePath,});

  ListSuccess.fromJson(dynamic json) {
    id = json['id'];
    wordName = json['wordName'];
    imagePath = json['imagePath'];
  }
  int? id;
  String? wordName;
  String? imagePath;

}