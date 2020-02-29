class HistoryModel {
  bool status;
  String message;
  List<HistoryDataModel> data;

  HistoryModel({
    this.status,
    this.message,
    this.data,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
    status: json["status"],
    message: json["message"],
    data: List<HistoryDataModel>.from(json["data"].map((x) => HistoryDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class HistoryDataModel {
  int id;
  String board;
  int idUser;
  int status;
  DateTime date;
  DateTime created;
  int total;
  DateTime done;
  DateTime start;

  HistoryDataModel({
    this.id,
    this.board,
    this.idUser,
    this.status,
    this.date,
    this.created,
    this.total,
    this.done,
    this.start,
  });

  factory HistoryDataModel.fromJson(Map<String, dynamic> json) => HistoryDataModel(
    id: json["id"],
    board: json["board"],
    idUser: json["id_user"],
    status: json["status"],
    date: DateTime.parse(json["date"]),
    created: DateTime.parse(json["created"]),
    total: json["total"],
    done: DateTime.parse(json["done"]),
    start: DateTime.parse(json["start"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "board": board,
    "id_user": idUser,
    "status": status,
    "date": date.toIso8601String(),
    "created": created.toIso8601String(),
    "total": total,
    "done": done.toIso8601String(),
    "start": start.toIso8601String(),
  };
}