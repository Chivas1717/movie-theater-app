class MovieModel {
  int? id;
  String? name;
  int? age;
  String? trailer;
  String? image;
  String? smallImage;
  String? originalName;
  int? duration;
  String? language;
  String? rating;
  int? year;
  String? country;
  String? genre;
  String? plot;
  String? starring;
  String? director;
  String? screenwriter;
  String? studio;

  MovieModel({
    this.id,
    this.name,
    this.age,
    this.trailer,
    this.image,
    this.smallImage,
    this.originalName,
    this.duration,
    this.language,
    this.rating,
    this.year,
    this.country,
    this.genre,
    this.plot,
    this.starring,
    this.director,
    this.screenwriter,
    this.studio,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    trailer = json['trailer'];
    image = json['image'];
    smallImage = json['smallImage'];
    originalName = json['originalName'];
    duration = json['duration'];
    language = json['language'];
    rating = json['rating'];
    year = json['year'];
    country = json['country'];
    genre = json['genre'];
    plot = json['plot'];
    starring = json['starring'];
    director = json['director'];
    screenwriter = json['screenwriter'];
    studio = json['studio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['trailer'] = this.trailer;
    data['image'] = this.image;
    data['smallImage'] = this.smallImage;
    data['originalName'] = this.originalName;
    data['duration'] = this.duration;
    data['language'] = this.language;
    data['rating'] = this.rating;
    data['year'] = this.year;
    data['country'] = this.country;
    data['genre'] = this.genre;
    data['plot'] = this.plot;
    data['starring'] = this.starring;
    data['director'] = this.director;
    data['screenwriter'] = this.screenwriter;
    data['studio'] = this.studio;
    return data;
  }
}
