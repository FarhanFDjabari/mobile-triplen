class UserModel {
  bool status;
  String message;
  UserDataModel data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new UserDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class UserDataModel {
  int id;
  String idGoogle;
  String name;
  String email;
  String noTelp;
  String imgUrl;
  String registered;
  String token;

  UserDataModel(
      {this.id,
        this.idGoogle,
        this.name,
        this.email,
        this.noTelp,
        this.imgUrl,
        this.registered,
        this.token});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idGoogle = json['id_google'];
    name = json['name'];
    email = json['email'];
    noTelp = json['no_telp'];
    imgUrl = json['img_url'];
    registered = json['registered'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_google'] = this.idGoogle;
    data['name'] = this.name;
    data['email'] = this.email;
    data['no_telp'] = this.noTelp;
    data['img_url'] = this.imgUrl;
    data['registered'] = this.registered;
    data['token'] = this.token;
    return data;
  }
}
