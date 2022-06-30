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
  final int? sourceId;
  final int? date;
  final bool? canDoubtCategory;
  final bool? canSetCategory;
  final int? topicId;
  final String? postType;
  final String? text;
  final int? markedAsAds;
  final List<Attachment>? attachments;
  final PostSource? postSource;
  final Comments? comments;
  final Likes? likes;
  final Reposts? reposts;
  final Views? views;
  final bool? isFavorite;
  final Donut? donut;
  final double? shortTextRate;
  final int? postId;
  final String? type;
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
  final int? albumId;
  final int? date;
  final int? id;
  final int? ownerId;
  final bool? hasTags;
  final String? accessKey;
  final int? postId;
  final List<Size>? sizes;
  final String? text;
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
  final int? canPost;
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
  final int? userLikes;
  final int? canLike;
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
  final bool? isDonut;
  Donut({
    required this.isDonut,
  });
  factory Donut.fromJson(Map<String, dynamic> json) => _$DonutFromJson(json);

  Map<String, dynamic> toJson() => _$DonutToJson(this);
}

@JsonSerializable()
class PushSubscription {
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
  final String? firstName;
  final String? lastName;
  final bool? isClosed;
  final bool? canAccessClosed;
  final bool? isService;
  final int? sex;
  final String? screenName;
  final String? photo_50;
  final String? photo_100;
  final int? online;
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
  final bool? isOnline;
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
  final String? screenName;
  final int? isClosed;
  final String? type;
  final int? isAdmin;
  final int? isMember;
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
