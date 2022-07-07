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
  @JsonKey(name: "first_name")
  final String firstName;
  final int id;
  @JsonKey(name: "last_name")
  final String lastName;
  @JsonKey(name: "can_access_closed")
  final bool canAccessClosed;
  @JsonKey(name: "is_closed")
  final bool isClosed;
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
  @JsonKey(name: "university_name")
  final String? universityName;
  final int? faculty;
  @JsonKey(name: "faculty_name")
  final String? facultyName;
  final int? graduation;
  final int? online;
  final int? sex;
  Response(
      {required this.firstName,
      required this.id,
      required this.lastName,
      required this.canAccessClosed,
      required this.isClosed,
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
      required this.universityName,
      required this.faculty,
      required this.facultyName,
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
