import 'package:json_annotation/json_annotation.dart';
part 'profile_info.g.dart';

@JsonSerializable()
class MyProfile {
  final List<Response> response;
  MyProfile({
    required this.response,
  });
  factory MyProfile.fromJson(Map<String, dynamic> json) =>
      _$MyProfileFromJson(json);

  Map<String, dynamic> toJson() => _$MyProfileToJson(this);
}

@JsonSerializable()
class Response {
  final String first_name;
  final int id;
  final String last_name;
  final bool can_access_closed;
  final bool is_closed;
  final String? photo_100;
  final int? verified;
  final String? bdate;
  final City? city;
  final Country? country;
  final String? interests;
  final String? books;
  final String? games;
  final String? movies;
  final String? music;
  final int? university;
  final String? university_name;
  final int? faculty;
  final String? faculty_name;
  final int? graduation;
  final int? online;
  final int? sex;
  Response(
      {required this.first_name,
      required this.id,
      required this.last_name,
      required this.can_access_closed,
      required this.is_closed,
      required this.photo_100,
      required this.verified,
      required this.bdate,
      required this.city,
      required this.country,
      required this.interests,
      required this.books,
      required this.games,
      required this.movies,
      required this.music,
      required this.university,
      required this.university_name,
      required this.faculty,
      required this.faculty_name,
      required this.graduation,
      required this.online,
      required this.sex});
  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class City {
  final int id;
  final String title;
  City({
    required this.id,
    required this.title,
  });
  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class Country {
  final int id;
  final String title;
  Country({
    required this.id,
    required this.title,
  });
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
