import 'package:json_annotation/json_annotation.dart';

part 'profile_photo.g.dart';

@JsonSerializable()
class MyPhoto {
  final Response response;
  MyPhoto({
    required this.response,
  });
  factory MyPhoto.fromJson(Map<String, dynamic> json) =>
      _$MyPhotoFromJson(json);

  Map<String, dynamic> toJson() => _$MyPhotoToJson(this);
}

@JsonSerializable()
class Response {
  final int? count;
  final List<Item>? items;
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
  final int? id;
  final List<Size>? sizes;
  final int? date;
  final Likes? likes;
  Item({
    required this.id,
    required this.sizes,
    required this.date,
    required this.likes,
  });
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class Size {
  final String? url;
  final int? width;
  final int? height;
  final String? type;
  Size({
    required this.url,
    required this.width,
    required this.height,
    required this.type,
  });
  factory Size.fromJson(Map<String, dynamic> json) => _$SizeFromJson(json);

  Map<String, dynamic> toJson() => _$SizeToJson(this);
}

@JsonSerializable()
class Likes {
  @JsonKey(name: "user_likes")
  final int? userLikes;
  final int? count;
  Likes({
    required this.userLikes,
    required this.count,
  });
  factory Likes.fromJson(Map<String, dynamic> json) => _$LikesFromJson(json);

  Map<String, dynamic> toJson() => _$LikesToJson(this);
}
