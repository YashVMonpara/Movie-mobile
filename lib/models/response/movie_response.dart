class MovieDataResponse {
  String? title;
  int? year;
  List<String>? cast;
  List<String>? genres;

  MovieDataResponse({this.title, this.year, this.cast, this.genres});

  MovieDataResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    year = json['year'];
    if (json['cast'] != null) {
      cast = <String>[];
      json['cast'].forEach((v) {
        cast!.add(v);
      });
    }
    if (json['genres'] != null) {
      genres = <String>[];
      json['genres'].forEach((v) {
        genres!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['year'] = year;
    if (cast != null) {
      data['cast'] = cast!.map((v) => v).toList();
    }
    if (genres != null) {
      data['genres'] = genres!.map((v) => v).toList();
    }
    return data;
  }
}
