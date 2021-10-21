import 'package:json_annotation/json_annotation.dart';

part 'new_feed.g.dart';

@JsonSerializable()
class NewsFeed {
  final Response response;
  NewsFeed({
    required this.response,
  });
  factory NewsFeed.fromJson(Map<String, dynamic> json) =>
      _$NewsFeedFromJson(json);

  Map<String, dynamic> toJson() => _$NewsFeedToJson(this);
}

@JsonSerializable()
class Response {
  final List<Item> items;
  final List<Profile> profiles;
  final List<Group> groups;
  final String next_from;
  Response({
    required this.items,
    required this.profiles,
    required this.groups,
    required this.next_from,
  });
  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class Item {
  final int? source_id;
  final int? date;
  final bool? can_doubt_category;
  final bool? can_set_category;
  final int? topic_id;
  final String? post_type;
  final String? text;
  final int? marked_as_ads;
  final List<Attachment>? attachments;
  final Post_source? post_source;
  final Comments? comments;
  final Likes? likes;
  final Reposts? reposts;
  final Views? views;
  final bool? is_favorite;
  final Donut? donut;
  final double? short_text_rate;
  final int? post_id;
  final String? type;
  final Push_subscription? push_subscription;
  final String? track_code;
  Item({
    required this.source_id,
    required this.date,
    required this.can_doubt_category,
    required this.can_set_category,
    required this.topic_id,
    required this.post_type,
    required this.text,
    required this.marked_as_ads,
    required this.attachments,
    required this.post_source,
    required this.comments,
    required this.likes,
    required this.reposts,
    required this.views,
    required this.is_favorite,
    required this.donut,
    required this.short_text_rate,
    required this.post_id,
    required this.type,
    required this.push_subscription,
    required this.track_code,
  });
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class Attachment {
  final String? type;
  final Photo? photo;
  final Video? video;
  final Audio? audio;
  final Doc? doc;
  final Note? note;
  Attachment({
    required this.type,
    required this.photo,
    required this.video,
    required this.audio,
    required this.doc,
    required this.note,
  });
  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}

@JsonSerializable()
class Note {
  final String? title;
  final String? text;
  final String? view_url;

  Note({
    required this.title,
    required this.text,
    required this.view_url,
  });

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);
}

@JsonSerializable()
class Doc {
  final String? title;
  final int? size;
  final String? url;

  Doc({
    required this.title,
    required this.size,
    required this.url,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => _$DocFromJson(json);

  Map<String, dynamic> toJson() => _$DocToJson(this);
}

@JsonSerializable()
class Audio {
  final String? title;
  final String? artist;
  final String? url;

  Audio({
    required this.title,
    required this.artist,
    required this.url,
  });

  factory Audio.fromJson(Map<String, dynamic> json) => _$AudioFromJson(json);

  Map<String, dynamic> toJson() => _$AudioToJson(this);
}

@JsonSerializable()
class Video {
  final String? title;
  final int? id;
  final String? track_code;
  final String? player;

  Video({
    required this.title,
    required this.track_code,
    required this.player,
    required this.id,
  });

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}

@JsonSerializable()
class Photo {
  final int? album_id;
  final int? date;
  final int? id;
  final int? owner_id;
  final bool? has_tags;
  final String? access_key;
  final int? post_id;
  final List<Size>? sizes;
  final String? text;
  final int? user_id;
  Photo({
    required this.album_id,
    required this.date,
    required this.id,
    required this.owner_id,
    required this.has_tags,
    required this.access_key,
    required this.post_id,
    required this.sizes,
    required this.text,
    required this.user_id,
  });
  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}

@JsonSerializable()
class Size {
  final int? height;
  final String? url;
  final String? type;
  final int? width;
  Size({
    required this.height,
    required this.url,
    required this.type,
    required this.width,
  });
  factory Size.fromJson(Map<String, dynamic> json) => _$SizeFromJson(json);

  Map<String, dynamic> toJson() => _$SizeToJson(this);
}

@JsonSerializable()
class Post_source {
  final String? type;
  Post_source({
    required this.type,
  });
  factory Post_source.fromJson(Map<String, dynamic> json) =>
      _$Post_sourceFromJson(json);

  Map<String, dynamic> toJson() => _$Post_sourceToJson(this);
}

@JsonSerializable()
class Comments {
  final int? count;
  final int? can_post;
  final bool? groups_can_post;
  Comments({
    required this.count,
    required this.can_post,
    required this.groups_can_post,
  });
  factory Comments.fromJson(Map<String, dynamic> json) =>
      _$CommentsFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsToJson(this);
}

@JsonSerializable()
class Likes {
  final int? count;
  final int? user_likes;
  final int? can_like;
  final int? can_publish;
  Likes({
    required this.count,
    required this.user_likes,
    required this.can_like,
    required this.can_publish,
  });
  factory Likes.fromJson(Map<String, dynamic> json) => _$LikesFromJson(json);

  Map<String, dynamic> toJson() => _$LikesToJson(this);
}

@JsonSerializable()
class Reposts {
  final int? count;
  final int? user_reposted;
  Reposts({
    required this.count,
    required this.user_reposted,
  });
  factory Reposts.fromJson(Map<String, dynamic> json) =>
      _$RepostsFromJson(json);

  Map<String, dynamic> toJson() => _$RepostsToJson(this);
}

@JsonSerializable()
class Views {
  final int? count;
  Views({
    required this.count,
  });
  factory Views.fromJson(Map<String, dynamic> json) => _$ViewsFromJson(json);

  Map<String, dynamic> toJson() => _$ViewsToJson(this);
}

@JsonSerializable()
class Donut {
  final bool? is_donut;
  Donut({
    required this.is_donut,
  });
  factory Donut.fromJson(Map<String, dynamic> json) => _$DonutFromJson(json);

  Map<String, dynamic> toJson() => _$DonutToJson(this);
}

@JsonSerializable()
class Push_subscription {
  final bool? is_subscribed;
  Push_subscription({
    required this.is_subscribed,
  });
  factory Push_subscription.fromJson(Map<String, dynamic> json) =>
      _$Push_subscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$Push_subscriptionToJson(this);
}

@JsonSerializable()
class Profile {
  final int? id;
  final String? first_name;
  final String? last_name;
  final bool? is_closed;
  final bool? can_access_closed;
  final bool? is_service;
  final int? sex;
  final String? screen_name;
  final String? photo_50;
  final String? photo_100;
  final int? online;
  final Online_info? online_info;
  Profile({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.is_closed,
    required this.can_access_closed,
    required this.is_service,
    required this.sex,
    required this.screen_name,
    required this.photo_50,
    required this.photo_100,
    required this.online,
    required this.online_info,
  });
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable()
class Online_info {
  final bool? visible;
  final bool? is_online;
  final bool? is_mobile;
  Online_info({
    required this.visible,
    required this.is_online,
    required this.is_mobile,
  });
  factory Online_info.fromJson(Map<String, dynamic> json) =>
      _$Online_infoFromJson(json);

  Map<String, dynamic> toJson() => _$Online_infoToJson(this);
}

@JsonSerializable()
class Group {
  final int? id;
  final String? name;
  final String? screen_name;
  final int? is_closed;
  final String? type;
  final int? is_admin;
  final int? is_member;
  final int? is_advertiser;
  final String? photo_50;
  final String? photo_100;
  final String? photo_200;
  Group({
    required this.id,
    required this.name,
    required this.screen_name,
    required this.is_closed,
    required this.type,
    required this.is_admin,
    required this.is_member,
    required this.is_advertiser,
    required this.photo_50,
    required this.photo_100,
    required this.photo_200,
  });
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
