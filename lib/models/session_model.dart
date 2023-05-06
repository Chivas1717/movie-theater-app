class SessionModel {
  int? id;
  int? date;
  String? type;
  int? minPrice;
  Room? room;

  SessionModel({this.id, this.date, this.type, this.minPrice, this.room});

  SessionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    type = json['type'];
    minPrice = json['minPrice'];
    room = json['room'] != null ? Room.fromJson(json['room']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['type'] = this.type;
    data['minPrice'] = this.minPrice;
    if (this.room != null) {
      data['room'] = this.room?.toJson();
    }
    return data;
  }
}

class Room {
  int? id;
  String? name;
  List<Rows>? rows;

  Room({this.id, this.name, this.rows});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows?.add(Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.rows != null) {
      data['rows'] = this.rows?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  int? id;
  int? index;
  List<Seat>? seats;

  Rows({this.id, this.index, this.seats});

  Rows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    index = json['index'];
    if (json['seats'] != null) {
      seats = <Seat>[];
      json['seats'].forEach((v) {
        seats?.add(Seat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['index'] = this.index;
    if (this.seats != null) {
      data['seats'] = this.seats?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Seat {
  int? id;
  int? type;
  int? index;
  int? price;
  bool? isAvailable;

  Seat({this.id, this.index, this.type, this.price, this.isAvailable});

  Seat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    index = json['index'];
    type = json['type'];
    price = json['price'];
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['index'] = this.index;
    data['type'] = this.type;
    data['price'] = this.price;
    data['isAvailable'] = this.isAvailable;
    return data;
  }
}
