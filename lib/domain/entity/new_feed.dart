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
  @JsonKey(name: "next_from")
  final String nextFrom;
  Response({
    required this.items,
    required this.profiles,
    required this.groups,
    required this.nextFrom,
  });
  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class Item {
  @JsonKey(name: "source_id")
  final int? sourceId;
  final int? date;
  @JsonKey(name: "can_doubt_category")
  final bool? canDoubtCategory;
  @JsonKey(name: "can_set_category")
  final bool? canSetCategory;
  @JsonKey(name: "topic_id")
  final int? topicId;
  @JsonKey(name: "post_type")
  final String? postType;
  final String? text;
  @JsonKey(name: "marked_as_ads")
  final int? markedAsAds;
  final List<Attachment>? attachments;
  @JsonKey(name: "post_source")
  final PostSource? postSource;
  final Comments? comments;
  final Likes? likes;
  final Reposts? reposts;
  final Views? views;
  @JsonKey(name: "is_favorite")
  final bool? isFavorite;
  final Donut? donut;
  @JsonKey(name: "short_text_rate")
  final double? shortTextRate;
  @JsonKey(name: "post_id")
  final int? postId;
  final String? type;
  @JsonKey(name: "push_subscription")
  final PushSubscription? pushSubscription;
  final String? trackCode;
  Item({
    required this.sourceId,
    required this.date,
    required this.canDoubtCategory,
    required this.canSetCategory,
    required this.topicId,
    required this.postType,
    required this.text,
    required this.markedAsAds,
    required this.attachments,
    required this.postSource,
    required this.comments,
    required this.likes,
    required this.reposts,
    required this.views,
    required this.isFavorite,
    required this.donut,
    required this.shortTextRate,
    required this.postId,
    required this.type,
    required this.pushSubscription,
    required this.trackCode,
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
  @JsonKey(name: "view_url")
  final String? viewUrl;

  Note({
    required this.title,
    required this.text,
    required this.viewUrl,
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
  @JsonKey(name: "track_code")
  final String? trackCode;
  final String? player;

  Video({
    required this.title,
    required this.trackCode,
    required this.player,
    required this.id,
  });

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}

@JsonSerializable()
class Photo {
  @JsonKey(name: "album_id")
  final int? albumId;
  final int? date;
  final int? id;
  @JsonKey(name: "owner_id")
  final int? ownerId;
  @JsonKey(name: "has_tags")
  final bool? hasTags;
  @JsonKey(name: "access_key")
  final String? accessKey;
  @JsonKey(name: "post_id")
  final int? postId;
  final List<Size>? sizes;
  final String? text;
  @JsonKey(name: "user_id")
  final int? userId;
  Photo({
    required this.albumId,
    required this.date,
    required this.id,
    required this.ownerId,
    required this.hasTags,
    required this.accessKey,
    required this.postId,
    required this.sizes,
    required this.text,
    required this.userId,
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
class PostSource {
  final String? type;
  PostSource({
    required this.type,
  });
  factory PostSource.fromJson(Map<String, dynamic> json) =>
      _$PostSourceFromJson(json);

  Map<String, dynamic> toJson() => _$PostSourceToJson(this);
}

@JsonSerializable()
class Comments {
  final int? count;
  @JsonKey(name: "can_post")
  final int? canPost;
  @JsonKey(name: "groups_can_post")
  final bool? groupsCanPost;
  Comments({
    required this.count,
    required this.canPost,
    required this.groupsCanPost,
  });
  factory Comments.fromJson(Map<String, dynamic> json) =>
      _$CommentsFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsToJson(this);
}

@JsonSerializable()
class Likes {
  final int? count;
  @JsonKey(name: "user_likes")
  final int? userLikes;
  @JsonKey(name: "can_like")
  final int? canLike;
  @JsonKey(name: "can_publish")
  final int? canPublish;
  Likes({
    required this.count,
    required this.userLikes,
    required this.canLike,
    required this.canPublish,
  });
  factory Likes.fromJson(Map<String, dynamic> json) => _$LikesFromJson(json);

  Map<String, dynamic> toJson() => _$LikesToJson(this);
}

@JsonSerializable()
class Reposts {
  final int? count;
  @JsonKey(name: "user_reposted")
  final int? userReposted;
  Reposts({
    required this.count,
    required this.userReposted,
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
  @JsonKey(name: "is_donut")
  final bool? isDonut;
  Donut({
    required this.isDonut,
  });
  factory Donut.fromJson(Map<String, dynamic> json) => _$DonutFromJson(json);

  Map<String, dynamic> toJson() => _$DonutToJson(this);
}

@JsonSerializable()
class PushSubscription {
  @JsonKey(name: "is_subscribed")
  final bool? isSubscribed;
  PushSubscription({
    required this.isSubscribed,
  });
  factory PushSubscription.fromJson(Map<String, dynamic> json) =>
      _$PushSubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$PushSubscriptionToJson(this);
}

@JsonSerializable()
class Profile {
  final int? id;
  @JsonKey(name: "first_name")
  final String? firstName;
  @JsonKey(name: "last_name")
  final String? lastName;
  @JsonKey(name: "is_closed")
  final bool? isClosed;
  @JsonKey(name: "can_access_closed")
  final bool? canAccessClosed;
  @JsonKey(name: "is_service")
  final bool? isService;
  final int? sex;
  @JsonKey(name: "screen_name")
  final String? screenName;
  final String? photo_50;
  final String? photo_100;
  final int? online;
  @JsonKey(name: "online_info")
  final OnlineInfo? onlineInfo;
  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.isClosed,
    required this.canAccessClosed,
    required this.isService,
    required this.sex,
    required this.screenName,
    required this.photo_50,
    required this.photo_100,
    required this.online,
    required this.onlineInfo,
  });
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable()
class OnlineInfo {
  final bool? visible;
  @JsonKey(name: "is_online")
  final bool? isOnline;
  @JsonKey(name: "is_mobile")
  final bool? isMobile;
  OnlineInfo({
    required this.visible,
    required this.isOnline,
    required this.isMobile,
  });
  factory OnlineInfo.fromJson(Map<String, dynamic> json) =>
      _$OnlineInfoFromJson(json);

  Map<String, dynamic> toJson() => _$OnlineInfoToJson(this);
}

@JsonSerializable()
class Group {
  final int? id;
  final String? name;
  @JsonKey(name: "screen_name")
  final String? screenName;
  @JsonKey(name: "is_closed")
  final int? isClosed;
  final String? type;
  @JsonKey(name: "is_admin")
  final int? isAdmin;
  @JsonKey(name: "is_member")
  final int? isMember;
  @JsonKey(name: "is_advertiser")
  final int? isAdvertiser;
  final String? photo_50;
  final String? photo_100;
  final String? photo_200;
  Group({
    required this.id,
    required this.name,
    required this.screenName,
    required this.isClosed,
    required this.type,
    required this.isAdmin,
    required this.isMember,
    required this.isAdvertiser,
    required this.photo_50,
    required this.photo_100,
    required this.photo_200,
  });
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
