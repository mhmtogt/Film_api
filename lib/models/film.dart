class FilmModel {
  final String Title;
  final String Year;
  final String ImdbId;
  final String Type;
  final String Poster;

  FilmModel({
    required this.Title,
    required this.Year,
    required this.ImdbId,
    required this.Type,
    required this.Poster,
  });

  factory FilmModel.fromJson(Map<String, dynamic> json) {
    return FilmModel(
      Title: json["Title"],
      Year: json["Year"],
      ImdbId: json["imdbID"],
      Type: json["Type"],
      Poster: json["Poster"],
    );
  }

  get result => null;

 
}