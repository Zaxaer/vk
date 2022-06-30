// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPhoto _$MyPhotoFromJson(Map<String, dynamic> json) {
  return MyPhoto(
    response: Response.fromJson(json['response'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MyPhotoToJson(MyPhoto instance) => <String, dynamic>{
      'response': instance.response,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
    count: json['count'] as int?,
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'count': instance.count,
      'items': instance.items,
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    id: json['id'] as int?,
    sizes: (json['sizes'] as List<dynamic>?)
        ?.map((e) => Size.fromJson(e as Map<String, dynamic>))
        .toList(),
    date: json['date'] as int?,
    likes: json['likes'] == null
        ? null
        : Likes.fromJson(json['likes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'sizes': instance.sizes,
      'date': instance.date,
      'likes': instance.likes,
    };

Size _$SizeFromJson(Map<String, dynamic> json) {
  return Size(
    url: json['url'] as String?,
    width: json['width'] as int?,
    height: json['height'] as int?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$SizeToJson(Size instance) => <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'type': instance.type,
    };

Likes _$LikesFromJson(Map<String, dynamic> json) {
  return Likes(
    userLikes: json['userLikes'] as int?,
    count: json['count'] as int?,
  );
}

Map<String, dynamic> _$LikesToJson(Likes instance) => <String, dynamic>{
      'userLikes': instance.userLikes,
      'count': instance.count,
    };
