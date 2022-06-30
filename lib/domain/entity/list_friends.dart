import 'package:json_annotation/json_annotation.dart';
part 'list_friends.g.dart';

@JsonSerializable()
class ListFriend {
  final Response response;
  ListFriend({
    required this.response,
  });
  factory ListFriend.fromJson(Map<String, dynamic> json) =>
      _$ListFriendFromJson(json);

  Map<String, dynamic> toJson() => _$ListFriendToJson(this);
}

@JsonSerializable()
class Response {
  final int count;
  final List<Item> items;
  Response({
    required this.count,
    required this.items,
  });
  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class Item {
  final String? firstName;
  final int? id;
  final String? lastName;
  final bool? canAccessClosed;
  final bool? isClosed;
  final String? domain;
  final City? city;
  final bool? canInviteToChats;
  final String? trackCode;
  final String? photo_100;
  final int? online;
  Item({
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.canAccessClosed,
    required this.isClosed,
    required this.domain,
    required this.city,
    required this.canInviteToChats,
    required this.trackCode,
    required this.online,
    required this.photo_100,
  });
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class City {
  final int? id;
  final String? title;
  City({
    required this.id,
    required this.title,
  });
  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
