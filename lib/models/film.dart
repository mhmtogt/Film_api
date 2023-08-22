class FilmModel {
  final String title;
  final String year;
  final String imdbId;
  final String type;
  final String poster;

  FilmModel({
    required this.title,
    required this.year,
    required this.imdbId,
    required this.type,
    required this.poster,
  });

  factory FilmModel.fromJson(Map<String, dynamic> json) {
    return FilmModel(
      title: json["Title"],
      year: json["Year"],
      imdbId: json["imdbID"],
      type: json["Type"],
      poster: json["Poster"],
    );
  }

  get result => null;

 
}