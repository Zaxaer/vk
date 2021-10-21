// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_friends.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListFriend _$ListFriendFromJson(Map<String, dynamic> json) {
  return ListFriend(
    response: Response.fromJson(json['response'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListFriendToJson(ListFriend instance) =>
    <String, dynamic>{
      'response': instance.response,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
    count: json['count'] as int,
    items: (json['items'] as List<dynamic>)
        .map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'count': instance.count,
      'items': instance.items,
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    first_name: json['first_name'] as String?,
    id: json['id'] as int?,
    last_name: json['last_name'] as String?,
    can_access_closed: json['can_access_closed'] as bool?,
    is_closed: json['is_closed'] as bool?,
    domain: json['domain'] as String?,
    city: json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
    can_invite_to_chats: json['can_invite_to_chats'] as bool?,
    track_code: json['track_code'] as String?,
    online: json['online'] as int?,
    photo_100: json['photo_100'] as String?,
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'first_name': instance.first_name,
      'id': instance.id,
      'last_name': instance.last_name,
      'can_access_closed': instance.can_access_closed,
      'is_closed': instance.is_closed,
      'domain': instance.domain,
      'city': instance.city,
      'can_invite_to_chats': instance.can_invite_to_chats,
      'track_code': instance.track_code,
      'photo_100': instance.photo_100,
      'online': instance.online,
    };

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    id: json['id'] as int?,
    title: json['title'] as String?,
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
