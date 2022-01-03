class Photo {
  Photo({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.imageUrl,
    required this.isVideo,
    required this.videoUrl,
  });

  Photo.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'] != null ? json['id'] as String : '--';
    title = json['title'] != null ? json['title'] as String : '--';
    thumbnailUrl =
        json['thumbnailUrl'] != null ? json['thumbnailUrl'] as String : '--';
    imageUrl = json['imageUrl'] != null ? json['imageUrl'] as String : '--';
    isVideo = json['isVideo'] != null ? json['isVideo'] as bool : false;
    videoUrl = json['videoUrl'] != null ? json['videoUrl'] as String : '--';
  }

  late final String id;
  late final String title;
  late final String thumbnailUrl;
  late final String imageUrl;
  late final bool isVideo;
  late final String videoUrl;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['thumbnailUrl'] = thumbnailUrl;
    _data['imageUrl'] = imageUrl;
    _data['isVideo'] = isVideo;
    _data['videoUrl'] = videoUrl;
    return _data;
  }
}
