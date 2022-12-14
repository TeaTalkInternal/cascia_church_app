class Announcement {
  Announcement({
    required this.id,
    required this.title,
    required this.titleKn,
    required this.description,
    required this.descriptionKn,
    required this.createdDate,
    required this.photoUrl,
    required this.photosId,
    required this.email,
    required this.location,
    required this.locationKn,
    required this.newsType,
  });

  Announcement.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'] != null ? json['id'] as String : '--';
    title = json['title'] != null ? json['title'] as String : '--';
    titleKn = json['titleKn'] != null ? json['titleKn'] as String : '--';
    description =
        json['description'] != null ? json['description'] as String : '--';
    descriptionKn =
        json['descriptionKn'] != null ? json['descriptionKn'] as String : '--';
    photoUrl = json['photoUrl'] != null ? json['photoUrl'] as String : '--';
    createdDate = json['createdDate'] != null ? json['createdDate'] as int : 0;
    photosId = json['photosId'] != null ? json['photosId'] as String : '--';
    email = json['email'] != null ? json['email'] as String : '--';
    location = json['location'] != null ? json['location'] as String : '--';
    locationKn =
        json['locationKn'] != null ? json['locationKn'] as String : '--';
    newsType = json['newsType'] != null ? json['newsType'] as String : '--';
  }

  late final String id;
  late final String title;
  late final String titleKn;
  late final String description;
  late final String descriptionKn;
  late final int createdDate;
  late final String photoUrl;
  late final String photosId;
  late final String email;
  late final String location;
  late final String locationKn;
  late final String newsType;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['titleKn'] = titleKn;
    data['description'] = description;
    data['descriptionKn'] = descriptionKn;
    data['photoUrl'] = photoUrl;
    data['createdDate'] = createdDate;
    data['photosId'] = photosId;
    data['email'] = email;
    data['location'] = location;
    data['locationKn'] = locationKn;
    data['newsType'] = newsType;
    return data;
  }
}
