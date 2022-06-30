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
    firstName: json['firstName'] as String?,
    id: json['id'] as int?,
    lastName: json['lastName'] as String?,
    canAccessClosed: json['canAccessClosed'] as bool?,
    isClosed: json['isClosed'] as bool?,
    domain: json['domain'] as String?,
    city: json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
    canInviteToChats: json['canInviteToChats'] as bool?,
    trackCode: json['trackCode'] as String?,
    online: json['online'] as int?,
    photo_100: json['photo_100'] as String?,
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'id': instance.id,
      'lastName': instance.lastName,
      'canAccessClosed': instance.canAccessClosed,
      'isClosed': instance.isClosed,
      'domain': instance.domain,
      'city': instance.city,
      'canInviteToChats': instance.canInviteToChats,
      'trackCode': instance.trackCode,
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
