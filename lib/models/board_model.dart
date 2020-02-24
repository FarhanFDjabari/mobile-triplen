class BoardModel {
  bool status;
  String message;
  List<BoardDataModel> data;

  BoardModel({
    this.status,
    this.message,
    this.data,
  });

  factory BoardModel.fromJson(Map<String, dynamic> json) => BoardModel(
    status: json["status"],
    message: json["message"],
    data: List<BoardDataModel>.from(json["data"].map((x) => BoardDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class BoardDataModel {
  int id;
  int idUser;
  String board;
  int status;
  String date;
  DateTime created;

  BoardDataModel({
    this.id,
    this.idUser,
    this.board,
    this.status,
    this.date,
    this.created,
  });

  factory BoardDataModel.fromJson(Map<String, dynamic> json) => BoardDataModel(
    id: json["id"],
    idUser: json["id_user"],
    board: json["board"],
    status: json["status"],
    date: json["date"],
    created: DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_user": idUser,
    "board": board,
    "status": status,
    "date": date,
    "created": created.toIso8601String(),
  };
}
