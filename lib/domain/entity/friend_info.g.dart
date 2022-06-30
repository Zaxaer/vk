// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendInfo _$FriendInfoFromJson(Map<String, dynamic> json) {
  return FriendInfo(
    response: (json['response'] as List<dynamic>)
        .map((e) => Response.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$FriendInfoToJson(FriendInfo instance) =>
    <String, dynamic>{
      'response': instance.response,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
    firstName: json['firstName'] as String,
    id: json['id'] as int,
    lastName: json['lastName'] as String,
    canAccessClosed: json['canAccessClosed'] as bool,
    isClosed: json['isClosed'] as bool,
    photo_100: json['photo_100'] as String?,
    verified: json['verified'] as int?,
    bdate: json['bdate'] as String?,
    city: json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
    country: json['country'] == null
        ? null
        : Country.fromJson(json['country'] as Map<String, dynamic>),
    interests: json['interests'] as String?,
    books: json['books'] as String?,
    games: json['games'] as String?,
    movies: json['movies'] as String?,
    music: json['music'] as String?,
    university: json['university'] as int?,
    universityName: json['universityName'] as String?,
    faculty: json['faculty'] as int?,
    facultyName: json['facultyName'] as String?,
    graduation: json['graduation'] as int?,
    online: json['online'] as int?,
    sex: json['sex'] as int?,
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'id': instance.id,
      'lastName': instance.lastName,
      'canAccessClosed': instance.canAccessClosed,
      'isClosed': instance.isClosed,
      'photo_100': instance.photo_100,
      'verified': instance.verified,
      'bdate': instance.bdate,
      'city': instance.city,
      'country': instance.country,
      'interests': instance.interests,
      'books': instance.books,
      'games': instance.games,
      'movies': instance.movies,
      'music': instance.music,
      'university': instance.university,
      'universityName': instance.universityName,
      'faculty': instance.faculty,
      'facultyName': instance.facultyName,
      'graduation': instance.graduation,
      'online': instance.online,
      'sex': instance.sex,
    };

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    id: json['id'] as int,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    id: json['id'] as int,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
