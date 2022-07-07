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
    nextFrom: json['next_from'] as String,
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'items': instance.items,
      'profiles': instance.profiles,
      'groups': instance.groups,
      'next_from': instance.nextFrom,
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    sourceId: json['source_id'] as int?,
    date: json['date'] as int?,
    canDoubtCategory: json['can_doubt_category'] as bool?,
    canSetCategory: json['can_set_category'] as bool?,
    topicId: json['topic_id'] as int?,
    postType: json['post_type'] as String?,
    text: json['text'] as String?,
    markedAsAds: json['marked_as_ads'] as int?,
    attachments: (json['attachments'] as List<dynamic>?)
        ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
        .toList(),
    postSource: json['post_source'] == null
        ? null
        : PostSource.fromJson(json['post_source'] as Map<String, dynamic>),
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
    isFavorite: json['is_favorite'] as bool?,
    donut: json['donut'] == null
        ? null
        : Donut.fromJson(json['donut'] as Map<String, dynamic>),
    shortTextRate: (json['short_text_rate'] as num?)?.toDouble(),
    postId: json['post_id'] as int?,
    type: json['type'] as String?,
    pushSubscription: json['push_subscription'] == null
        ? null
        : PushSubscription.fromJson(
            json['push_subscription'] as Map<String, dynamic>),
    trackCode: json['trackCode'] as String?,
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'source_id': instance.sourceId,
      'date': instance.date,
      'can_doubt_category': instance.canDoubtCategory,
      'can_set_category': instance.canSetCategory,
      'topic_id': instance.topicId,
      'post_type': instance.postType,
      'text': instance.text,
      'marked_as_ads': instance.markedAsAds,
      'attachments': instance.attachments,
      'post_source': instance.postSource,
      'comments': instance.comments,
      'likes': instance.likes,
      'reposts': instance.reposts,
      'views': instance.views,
      'is_favorite': instance.isFavorite,
      'donut': instance.donut,
      'short_text_rate': instance.shortTextRate,
      'post_id': instance.postId,
      'type': instance.type,
      'push_subscription': instance.pushSubscription,
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
    viewUrl: json['view_url'] as String?,
  );
}

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'view_url': instance.viewUrl,
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
    trackCode: json['track_code'] as String?,
    player: json['player'] as String?,
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'track_code': instance.trackCode,
      'player': instance.player,
    };

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return Photo(
    albumId: json['album_id'] as int?,
    date: json['date'] as int?,
    id: json['id'] as int?,
    ownerId: json['owner_id'] as int?,
    hasTags: json['has_tags'] as bool?,
    accessKey: json['access_key'] as String?,
    postId: json['post_id'] as int?,
    sizes: (json['sizes'] as List<dynamic>?)
        ?.map((e) => Size.fromJson(e as Map<String, dynamic>))
        .toList(),
    text: json['text'] as String?,
    userId: json['user_id'] as int?,
  );
}

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'album_id': instance.albumId,
      'date': instance.date,
      'id': instance.id,
      'owner_id': instance.ownerId,
      'has_tags': instance.hasTags,
      'access_key': instance.accessKey,
      'post_id': instance.postId,
      'sizes': instance.sizes,
      'text': instance.text,
      'user_id': instance.userId,
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
    canPost: json['can_post'] as int?,
    groupsCanPost: json['groups_can_post'] as bool?,
  );
}

Map<String, dynamic> _$CommentsToJson(Comments instance) => <String, dynamic>{
      'count': instance.count,
      'can_post': instance.canPost,
      'groups_can_post': instance.groupsCanPost,
    };

Likes _$LikesFromJson(Map<String, dynamic> json) {
  return Likes(
    count: json['count'] as int?,
    userLikes: json['user_likes'] as int?,
    canLike: json['can_like'] as int?,
    canPublish: json['can_publish'] as int?,
  );
}

Map<String, dynamic> _$LikesToJson(Likes instance) => <String, dynamic>{
      'count': instance.count,
      'user_likes': instance.userLikes,
      'can_like': instance.canLike,
      'can_publish': instance.canPublish,
    };

Reposts _$RepostsFromJson(Map<String, dynamic> json) {
  return Reposts(
    count: json['count'] as int?,
    userReposted: json['user_reposted'] as int?,
  );
}

Map<String, dynamic> _$RepostsToJson(Reposts instance) => <String, dynamic>{
      'count': instance.count,
      'user_reposted': instance.userReposted,
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
    isDonut: json['is_donut'] as bool?,
  );
}

Map<String, dynamic> _$DonutToJson(Donut instance) => <String, dynamic>{
      'is_donut': instance.isDonut,
    };

PushSubscription _$PushSubscriptionFromJson(Map<String, dynamic> json) {
  return PushSubscription(
    isSubscribed: json['is_subscribed'] as bool?,
  );
}

Map<String, dynamic> _$PushSubscriptionToJson(PushSubscription instance) =>
    <String, dynamic>{
      'is_subscribed': instance.isSubscribed,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    id: json['id'] as int?,
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
    isClosed: json['is_closed'] as bool?,
    canAccessClosed: json['can_access_closed'] as bool?,
    isService: json['is_service'] as bool?,
    sex: json['sex'] as int?,
    screenName: json['screen_name'] as String?,
    photo_50: json['photo_50'] as String?,
    photo_100: json['photo_100'] as String?,
    online: json['online'] as int?,
    onlineInfo: json['online_info'] == null
        ? null
        : OnlineInfo.fromJson(json['online_info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'is_closed': instance.isClosed,
      'can_access_closed': instance.canAccessClosed,
      'is_service': instance.isService,
      'sex': instance.sex,
      'screen_name': instance.screenName,
      'photo_50': instance.photo_50,
      'photo_100': instance.photo_100,
      'online': instance.online,
      'online_info': instance.onlineInfo,
    };

OnlineInfo _$OnlineInfoFromJson(Map<String, dynamic> json) {
  return OnlineInfo(
    visible: json['visible'] as bool?,
    isOnline: json['is_online'] as bool?,
    isMobile: json['is_mobile'] as bool?,
  );
}

Map<String, dynamic> _$OnlineInfoToJson(OnlineInfo instance) =>
    <String, dynamic>{
      'visible': instance.visible,
      'is_online': instance.isOnline,
      'is_mobile': instance.isMobile,
    };

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    id: json['id'] as int?,
    name: json['name'] as String?,
    screenName: json['screen_name'] as String?,
    isClosed: json['is_closed'] as int?,
    type: json['type'] as String?,
    isAdmin: json['is_admin'] as int?,
    isMember: json['is_member'] as int?,
    isAdvertiser: json['is_advertiser'] as int?,
    photo_50: json['photo_50'] as String?,
    photo_100: json['photo_100'] as String?,
    photo_200: json['photo_200'] as String?,
  );
}

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'screen_name': instance.screenName,
      'is_closed': instance.isClosed,
      'type': instance.type,
      'is_admin': instance.isAdmin,
      'is_member': instance.isMember,
      'is_advertiser': instance.isAdvertiser,
      'photo_50': instance.photo_50,
      'photo_100': instance.photo_100,
      'photo_200': instance.photo_200,
    };
