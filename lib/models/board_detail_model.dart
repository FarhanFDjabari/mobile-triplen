class BoardDetailModel {
  bool status;
  String message;
  List<BoardDetailDataModel> data;

  BoardDetailModel({
    this.status,
    this.message,
    this.data,
  });

  factory BoardDetailModel.fromJson(Map<String, dynamic> json) => BoardDetailModel(
    status: json["status"],
    message: json["message"],
    data: List<BoardDetailDataModel>.from(json["data"].map((x) => BoardDetailDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class BoardDetailDataModel {
  int id;
  String board;
  int idBoard;
  String task;
  String location;
  int status;
  DateTime date;
  String latitude;
  String longitude;

  BoardDetailDataModel({
    this.id,
    this.board,
    this.idBoard,
    this.task,
    this.location,
    this.status,
    this.date,
    this.latitude,
    this.longitude,
  });

  factory BoardDetailDataModel.fromJson(Map<String, dynamic> json) => BoardDetailDataModel(
    id: json["id"],
    board: json["board"],
    idBoard: json["id_board"],
    task: json["task"],
    location: json["location"],
    status: json["status"],
    date: DateTime.parse(json["date"]),
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "board": board,
    "id_board": idBoard,
    "task": task,
    "location": location,
    "status": status,
    "date": date.toIso8601String(),
    "latitude": latitude,
    "longitude": longitude,
  };
}
