class EventType {
  EventType({
    required this.id,
    required this.eventName,
    required this.thumbnailUrl,
    required this.imageUrl,
    required this.description,
  });

  EventType.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'] != null ? json['id'] as String : '--';
    eventName = json['eventName'] != null ? json['eventName'] as String : '--';
    thumbnailUrl =
        json['thumbnailUrl'] != null ? json['thumbnailUrl'] as String : '--';
    imageUrl = json['imageUrl'] != null ? json['imageUrl'] as String : '--';
    description =
        json['description'] != null ? json['description'] as String : '--';
  }

  late final String id;
  late final String eventName;
  late final String thumbnailUrl;
  late final String imageUrl;
  late final String description;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['eventName'] = eventName;
    _data['thumbnailUrl'] = thumbnailUrl;
    _data['imageUrl'] = imageUrl;
    _data['description'] = description;
    return _data;
  }
}
