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
  final String? first_name;
  final int? id;
  final String? last_name;
  final bool? can_access_closed;
  final bool? is_closed;
  final String? domain;
  final City? city;
  final bool? can_invite_to_chats;
  final String? track_code;
  final String? photo_100;
  final int? online;
  Item({
    required this.first_name,
    required this.id,
    required this.last_name,
    required this.can_access_closed,
    required this.is_closed,
    required this.domain,
    required this.city,
    required this.can_invite_to_chats,
    required this.track_code,
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
