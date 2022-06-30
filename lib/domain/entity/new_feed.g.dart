// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsFeed _$NewsFeedFromJson(Map<String, dynamic> json) {
  return NewsFeed(
    response: Response.fromJson(json['response'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NewsFeedToJson(NewsFeed instance) => <String, dynamic>{
      'response': instance.response,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
    items: (json['items'] as List<dynamic>)
        .map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
    profiles: (json['profiles'] as List<dynamic>)
        .map((e) => Profile.fromJson(e as Map<String, dynamic>))
        .toList(),
    groups: (json['groups'] as List<dynamic>)
        .map((e) => Group.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextFrom: json['nextFrom'] as String,
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'items': instance.items,
      'profiles': instance.profiles,
      'groups': instance.groups,
      'nextFrom': instance.nextFrom,
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    sourceId: json['sourceId'] as int?,
    date: json['date'] as int?,
    canDoubtCategory: json['canDoubtCategory'] as bool?,
    canSetCategory: json['canSetCategory'] as bool?,
    topicId: json['topicId'] as int?,
    postType: json['postType'] as String?,
    text: json['text'] as String?,
    markedAsAds: json['markedAsAds'] as int?,
    attachments: (json['attachments'] as List<dynamic>?)
        ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
        .toList(),
    postSource: json['postSource'] == null
        ? null
        : PostSource.fromJson(json['postSource'] as Map<String, dynamic>),
    comments: json['comments'] == null
        ? null
        : Comments.fromJson(json['comments'] as Map<String, dynamic>),
    likes: json['likes'] == null
        ? null
        : Likes.fromJson(json['likes'] as Map<String, dynamic>),
    reposts: json['reposts'] == null
        ? null
        : Reposts.fromJson(json['reposts'] as Map<String, dynamic>),
    views: json['views'] == null
        ? null
        : Views.fromJson(json['views'] as Map<String, dynamic>),
    isFavorite: json['isFavorite'] as bool?,
    donut: json['donut'] == null
        ? null
        : Donut.fromJson(json['donut'] as Map<String, dynamic>),
    shortTextRate: (json['shortTextRate'] as num?)?.toDouble(),
    postId: json['postId'] as int?,
    type: json['type'] as String?,
    pushSubscription: json['pushSubscription'] == null
        ? null
        : PushSubscription.fromJson(
            json['pushSubscription'] as Map<String, dynamic>),
    trackCode: json['trackCode'] as String?,
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'sourceId': instance.sourceId,
      'date': instance.date,
      'canDoubtCategory': instance.canDoubtCategory,
      'canSetCategory': instance.canSetCategory,
      'topicId': instance.topicId,
      'postType': instance.postType,
      'text': instance.text,
      'markedAsAds': instance.markedAsAds,
      'attachments': instance.attachments,
      'postSource': instance.postSource,
      'comments': instance.comments,
      'likes': instance.likes,
      'reposts': instance.reposts,
      'views': instance.views,
      'isFavorite': instance.isFavorite,
      'donut': instance.donut,
      'shortTextRate': instance.shortTextRate,
      'postId': instance.postId,
      'type': instance.type,
      'pushSubscription': instance.pushSubscription,
      'trackCode': instance.trackCode,
    };

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return Attachment(
    type: json['type'] as String?,
    photo: json['photo'] == null
        ? null
        : Photo.fromJson(json['photo'] as Map<String, dynamic>),
    video: json['video'] == null
        ? null
        : Video.fromJson(json['video'] as Map<String, dynamic>),
    audio: json['audio'] == null
        ? null
        : Audio.fromJson(json['audio'] as Map<String, dynamic>),
    doc: json['doc'] == null
        ? null
        : Doc.fromJson(json['doc'] as Map<String, dynamic>),
    note: json['note'] == null
        ? null
        : Note.fromJson(json['note'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'type': instance.type,
      'photo': instance.photo,
      'video': instance.video,
      'audio': instance.audio,
      'doc': instance.doc,
      'note': instance.note,
    };

Note _$NoteFromJson(Map<String, dynamic> json) {
  return Note(
    title: json['title'] as String?,
    text: json['text'] as String?,
    viewUrl: json['viewUrl'] as String?,
  );
}

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'viewUrl': instance.viewUrl,
    };

Doc _$DocFromJson(Map<String, dynamic> json) {
  return Doc(
    title: json['title'] as String?,
    size: json['size'] as int?,
    url: json['url'] as String?,
  );
}

Map<String, dynamic> _$DocToJson(Doc instance) => <String, dynamic>{
      'title': instance.title,
      'size': instance.size,
      'url': instance.url,
    };

Audio _$AudioFromJson(Map<String, dynamic> json) {
  return Audio(
    title: json['title'] as String?,
    artist: json['artist'] as String?,
    url: json['url'] as String?,
  );
}

Map<String, dynamic> _$AudioToJson(Audio instance) => <String, dynamic>{
      'title': instance.title,
      'artist': instance.artist,
      'url': instance.url,
    };

Video _$VideoFromJson(Map<String, dynamic> json) {
  return Video(
    title: json['title'] as String?,
    trackCode: json['trackCode'] as String?,
    player: json['player'] as String?,
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'trackCode': instance.trackCode,
      'player': instance.player,
    };

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return Photo(
    albumId: json['albumId'] as int?,
    date: json['date'] as int?,
    id: json['id'] as int?,
    ownerId: json['ownerId'] as int?,
    hasTags: json['hasTags'] as bool?,
    accessKey: json['accessKey'] as String?,
    postId: json['postId'] as int?,
    sizes: (json['sizes'] as List<dynamic>?)
        ?.map((e) => Size.fromJson(e as Map<String, dynamic>))
        .toList(),
    text: json['text'] as String?,
    userId: json['userId'] as int?,
  );
}

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'albumId': instance.albumId,
      'date': instance.date,
      'id': instance.id,
      'ownerId': instance.ownerId,
      'hasTags': instance.hasTags,
      'accessKey': instance.accessKey,
      'postId': instance.postId,
      'sizes': instance.sizes,
      'text': instance.text,
      'userId': instance.userId,
    };

Size _$SizeFromJson(Map<String, dynamic> json) {
  return Size(
    height: json['height'] as int?,
    url: json['url'] as String?,
    type: json['type'] as String?,
    width: json['width'] as int?,
  );
}

Map<String, dynamic> _$SizeToJson(Size instance) => <String, dynamic>{
      'height': instance.height,
      'url': instance.url,
      'type': instance.type,
      'width': instance.width,
    };

PostSource _$PostSourceFromJson(Map<String, dynamic> json) {
  return PostSource(
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$PostSourceToJson(PostSource instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

Comments _$CommentsFromJson(Map<String, dynamic> json) {
  return Comments(
    count: json['count'] as int?,
    canPost: json['canPost'] as int?,
    groupsCanPost: json['groupsCanPost'] as bool?,
  );
}

Map<String, dynamic> _$CommentsToJson(Comments instance) => <String, dynamic>{
      'count': instance.count,
      'canPost': instance.canPost,
      'groupsCanPost': instance.groupsCanPost,
    };

Likes _$LikesFromJson(Map<String, dynamic> json) {
  return Likes(
    count: json['count'] as int?,
    userLikes: json['userLikes'] as int?,
    canLike: json['canLike'] as int?,
    canPublish: json['canPublish'] as int?,
  );
}

Map<String, dynamic> _$LikesToJson(Likes instance) => <String, dynamic>{
      'count': instance.count,
      'userLikes': instance.userLikes,
      'canLike': instance.canLike,
      'canPublish': instance.canPublish,
    };

Reposts _$RepostsFromJson(Map<String, dynamic> json) {
  return Reposts(
    count: json['count'] as int?,
    userReposted: json['userReposted'] as int?,
  );
}

Map<String, dynamic> _$RepostsToJson(Reposts instance) => <String, dynamic>{
      'count': instance.count,
      'userReposted': instance.userReposted,
    };

Views _$ViewsFromJson(Map<String, dynamic> json) {
  return Views(
    count: json['count'] as int?,
  );
}

Map<String, dynamic> _$ViewsToJson(Views instance) => <String, dynamic>{
      'count': instance.count,
    };

Donut _$DonutFromJson(Map<String, dynamic> json) {
  return Donut(
    isDonut: json['isDonut'] as bool?,
  );
}

Map<String, dynamic> _$DonutToJson(Donut instance) => <String, dynamic>{
      'isDonut': instance.isDonut,
    };

PushSubscription _$PushSubscriptionFromJson(Map<String, dynamic> json) {
  return PushSubscription(
    isSubscribed: json['isSubscribed'] as bool?,
  );
}

Map<String, dynamic> _$PushSubscriptionToJson(PushSubscription instance) =>
    <String, dynamic>{
      'isSubscribed': instance.isSubscribed,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    id: json['id'] as int?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    isClosed: json['isClosed'] as bool?,
    canAccessClosed: json['canAccessClosed'] as bool?,
    isService: json['isService'] as bool?,
    sex: json['sex'] as int?,
    screenName: json['screenName'] as String?,
    photo_50: json['photo_50'] as String?,
    photo_100: json['photo_100'] as String?,
    online: json['online'] as int?,
    onlineInfo: json['onlineInfo'] == null
        ? null
        : OnlineInfo.fromJson(json['onlineInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'isClosed': instance.isClosed,
      'canAccessClosed': instance.canAccessClosed,
      'isService': instance.isService,
      'sex': instance.sex,
      'screenName': instance.screenName,
      'photo_50': instance.photo_50,
      'photo_100': instance.photo_100,
      'online': instance.online,
      'onlineInfo': instance.onlineInfo,
    };

OnlineInfo _$OnlineInfoFromJson(Map<String, dynamic> json) {
  return OnlineInfo(
    visible: json['visible'] as bool?,
    isOnline: json['isOnline'] as bool?,
    isMobile: json['isMobile'] as bool?,
  );
}

Map<String, dynamic> _$OnlineInfoToJson(OnlineInfo instance) =>
    <String, dynamic>{
      'visible': instance.visible,
      'isOnline': instance.isOnline,
      'isMobile': instance.isMobile,
    };

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    id: json['id'] as int?,
    name: json['name'] as String?,
    screenName: json['screenName'] as String?,
    isClosed: json['isClosed'] as int?,
    type: json['type'] as String?,
    isAdmin: json['isAdmin'] as int?,
    isMember: json['isMember'] as int?,
    isAdvertiser: json['isAdvertiser'] as int?,
    photo_50: json['photo_50'] as String?,
    photo_100: json['photo_100'] as String?,
    photo_200: json['photo_200'] as String?,
  );
}

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'screenName': instance.screenName,
      'isClosed': instance.isClosed,
      'type': instance.type,
      'isAdmin': instance.isAdmin,
      'isMember': instance.isMember,
      'isAdvertiser': instance.isAdvertiser,
      'photo_50': instance.photo_50,
      'photo_100': instance.photo_100,
      'photo_200': instance.photo_200,
    };
