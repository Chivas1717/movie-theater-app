class PurchasedTicketModel {
  int? id;
  int? movieId;
  String? name;
  int? date;
  String? image;
  String? smallImage;

  PurchasedTicketModel(
      {this.id,
      this.movieId,
      this.name,
      this.date,
      this.image,
      this.smallImage});

  PurchasedTicketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    movieId = json['movieId'];
    name = json['name'];
    date = json['date'];
    image = json['image'];
    smallImage = json['smallImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['movieId'] = this.movieId;
    data['name'] = this.name;
    data['date'] = this.date;
    data['image'] = this.image;
    data['smallImage'] = this.smallImage;
    return data;
  }
}
