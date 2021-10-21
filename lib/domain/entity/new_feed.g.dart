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
    next_from: json['next_from'] as String,
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'items': instance.items,
      'profiles': instance.profiles,
      'groups': instance.groups,
      'next_from': instance.next_from,
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    source_id: json['source_id'] as int?,
    date: json['date'] as int?,
    can_doubt_category: json['can_doubt_category'] as bool?,
    can_set_category: json['can_set_category'] as bool?,
    topic_id: json['topic_id'] as int?,
    post_type: json['post_type'] as String?,
    text: json['text'] as String?,
    marked_as_ads: json['marked_as_ads'] as int?,
    attachments: (json['attachments'] as List<dynamic>?)
        ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
        .toList(),
    post_source: json['post_source'] == null
        ? null
        : Post_source.fromJson(json['post_source'] as Map<String, dynamic>),
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
    is_favorite: json['is_favorite'] as bool?,
    donut: json['donut'] == null
        ? null
        : Donut.fromJson(json['donut'] as Map<String, dynamic>),
    short_text_rate: (json['short_text_rate'] as num?)?.toDouble(),
    post_id: json['post_id'] as int?,
    type: json['type'] as String?,
    push_subscription: json['push_subscription'] == null
        ? null
        : Push_subscription.fromJson(
            json['push_subscription'] as Map<String, dynamic>),
    track_code: json['track_code'] as String?,
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'source_id': instance.source_id,
      'date': instance.date,
      'can_doubt_category': instance.can_doubt_category,
      'can_set_category': instance.can_set_category,
      'topic_id': instance.topic_id,
      'post_type': instance.post_type,
      'text': instance.text,
      'marked_as_ads': instance.marked_as_ads,
      'attachments': instance.attachments,
      'post_source': instance.post_source,
      'comments': instance.comments,
      'likes': instance.likes,
      'reposts': instance.reposts,
      'views': instance.views,
      'is_favorite': instance.is_favorite,
      'donut': instance.donut,
      'short_text_rate': instance.short_text_rate,
      'post_id': instance.post_id,
      'type': instance.type,
      'push_subscription': instance.push_subscription,
      'track_code': instance.track_code,
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
    view_url: json['view_url'] as String?,
  );
}

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'view_url': instance.view_url,
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
    track_code: json['track_code'] as String?,
    player: json['player'] as String?,
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'track_code': instance.track_code,
      'player': instance.player,
    };

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return Photo(
    album_id: json['album_id'] as int?,
    date: json['date'] as int?,
    id: json['id'] as int?,
    owner_id: json['owner_id'] as int?,
    has_tags: json['has_tags'] as bool?,
    access_key: json['access_key'] as String?,
    post_id: json['post_id'] as int?,
    sizes: (json['sizes'] as List<dynamic>?)
        ?.map((e) => Size.fromJson(e as Map<String, dynamic>))
        .toList(),
    text: json['text'] as String?,
    user_id: json['user_id'] as int?,
  );
}

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'album_id': instance.album_id,
      'date': instance.date,
      'id': instance.id,
      'owner_id': instance.owner_id,
      'has_tags': instance.has_tags,
      'access_key': instance.access_key,
      'post_id': instance.post_id,
      'sizes': instance.sizes,
      'text': instance.text,
      'user_id': instance.user_id,
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

Post_source _$Post_sourceFromJson(Map<String, dynamic> json) {
  return Post_source(
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$Post_sourceToJson(Post_source instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

Comments _$CommentsFromJson(Map<String, dynamic> json) {
  return Comments(
    count: json['count'] as int?,
    can_post: json['can_post'] as int?,
    groups_can_post: json['groups_can_post'] as bool?,
  );
}

Map<String, dynamic> _$CommentsToJson(Comments instance) => <String, dynamic>{
      'count': instance.count,
      'can_post': instance.can_post,
      'groups_can_post': instance.groups_can_post,
    };

Likes _$LikesFromJson(Map<String, dynamic> json) {
  return Likes(
    count: json['count'] as int?,
    user_likes: json['user_likes'] as int?,
    can_like: json['can_like'] as int?,
    can_publish: json['can_publish'] as int?,
  );
}

Map<String, dynamic> _$LikesToJson(Likes instance) => <String, dynamic>{
      'count': instance.count,
      'user_likes': instance.user_likes,
      'can_like': instance.can_like,
      'can_publish': instance.can_publish,
    };

Reposts _$RepostsFromJson(Map<String, dynamic> json) {
  return Reposts(
    count: json['count'] as int?,
    user_reposted: json['user_reposted'] as int?,
  );
}

Map<String, dynamic> _$RepostsToJson(Reposts instance) => <String, dynamic>{
      'count': instance.count,
      'user_reposted': instance.user_reposted,
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
    is_donut: json['is_donut'] as bool?,
  );
}

Map<String, dynamic> _$DonutToJson(Donut instance) => <String, dynamic>{
      'is_donut': instance.is_donut,
    };

Push_subscription _$Push_subscriptionFromJson(Map<String, dynamic> json) {
  return Push_subscription(
    is_subscribed: json['is_subscribed'] as bool?,
  );
}

Map<String, dynamic> _$Push_subscriptionToJson(Push_subscription instance) =>
    <String, dynamic>{
      'is_subscribed': instance.is_subscribed,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    id: json['id'] as int?,
    first_name: json['first_name'] as String?,
    last_name: json['last_name'] as String?,
    is_closed: json['is_closed'] as bool?,
    can_access_closed: json['can_access_closed'] as bool?,
    is_service: json['is_service'] as bool?,
    sex: json['sex'] as int?,
    screen_name: json['screen_name'] as String?,
    photo_50: json['photo_50'] as String?,
    photo_100: json['photo_100'] as String?,
    online: json['online'] as int?,
    online_info: json['online_info'] == null
        ? null
        : Online_info.fromJson(json['online_info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'is_closed': instance.is_closed,
      'can_access_closed': instance.can_access_closed,
      'is_service': instance.is_service,
      'sex': instance.sex,
      'screen_name': instance.screen_name,
      'photo_50': instance.photo_50,
      'photo_100': instance.photo_100,
      'online': instance.online,
      'online_info': instance.online_info,
    };

Online_info _$Online_infoFromJson(Map<String, dynamic> json) {
  return Online_info(
    visible: json['visible'] as bool?,
    is_online: json['is_online'] as bool?,
    is_mobile: json['is_mobile'] as bool?,
  );
}

Map<String, dynamic> _$Online_infoToJson(Online_info instance) =>
    <String, dynamic>{
      'visible': instance.visible,
      'is_online': instance.is_online,
      'is_mobile': instance.is_mobile,
    };

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    id: json['id'] as int?,
    name: json['name'] as String?,
    screen_name: json['screen_name'] as String?,
    is_closed: json['is_closed'] as int?,
    type: json['type'] as String?,
    is_admin: json['is_admin'] as int?,
    is_member: json['is_member'] as int?,
    is_advertiser: json['is_advertiser'] as int?,
    photo_50: json['photo_50'] as String?,
    photo_100: json['photo_100'] as String?,
    photo_200: json['photo_200'] as String?,
  );
}

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'screen_name': instance.screen_name,
      'is_closed': instance.is_closed,
      'type': instance.type,
      'is_admin': instance.is_admin,
      'is_member': instance.is_member,
      'is_advertiser': instance.is_advertiser,
      'photo_50': instance.photo_50,
      'photo_100': instance.photo_100,
      'photo_200': instance.photo_200,
    };
