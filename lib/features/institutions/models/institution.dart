class Institution {
  Institution({
    required this.id,
    required this.title,
    required this.titleKn,
    required this.description,
    required this.descriptionKn,
    required this.createdDate,
    required this.thumbnailUrl,
    required this.photosId,
    required this.email,
    required this.address,
    required this.addressKn,
    required this.mobileNumber,
    required this.landlineNumber,
  });

  Institution.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'] != null ? json['id'] as String : '--';
    title = json['title'] != null ? json['title'] as String : '--';
    titleKn = json['titleKn'] != null ? json['titleKn'] as String : '--';
    description =
        json['description'] != null ? json['description'] as String : '--';
    descriptionKn =
        json['descriptionKn'] != null ? json['descriptionKn'] as String : '--';
    thumbnailUrl =
        json['thumbnailUrl'] != null ? json['thumbnailUrl'] as String : '--';
    createdDate = json['createdDate'] != null ? json['createdDate'] as int : 0;
    photosId = json['photosId'] != null ? json['photosId'] as String : '--';
    email = json['email'] != null ? json['email'] as String : '--';
    address = json['address'] != null ? json['address'] as String : '--';
    addressKn = json['addressKn'] != null ? json['addressKn'] as String : '--';
    mobileNumber =
        json['mobileNumber'] != null ? json['mobileNumber'] as String : '--';
    landlineNumber = json['landlineNumber'] != null
        ? json['landlineNumber'] as String
        : '--';
  }

  late final String id;
  late final String title;
  late final String titleKn;
  late final String description;
  late final String descriptionKn;
  late final int createdDate;
  late final String thumbnailUrl;
  late final String photosId;
  late final String email;
  late final String address;
  late final String addressKn;
  late final String mobileNumber;
  late final String landlineNumber;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['titleKn'] = titleKn;
    data['description'] = description;
    data['descriptionKn'] = descriptionKn;
    data['thumbnailUrl'] = thumbnailUrl;
    data['createdDate'] = createdDate;
    data['photosId'] = photosId;
    data['email'] = email;
    data['address'] = address;
    data['addressKn'] = addressKn;
    data['mobileNumber'] = mobileNumber;
    data['landlineNumber'] = landlineNumber;
    return data;
  }
}
