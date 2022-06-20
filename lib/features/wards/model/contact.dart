class Contact {
  Contact({
    required this.id,
    required this.name,
    required this.nameKn,
    required this.wardName,
    required this.isGurkar,
    required this.mobileNumber,
    required this.landlineNumber,
  });

  Contact.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'] != null ? json['id'] as String : '--';
    name = json['name'] != null ? json['name'] as String : '--';
    nameKn = json['nameKn'] != null ? json['nameKn'] as String : '--';
    wardName = json['wardName'] != null ? json['wardName'] as String : '--';
    isGurkar = json['isGurkar'] != null ? json['isGurkar'] as String : '--';
    mobileNumber =
        json['mobileNumber'] != null ? json['mobileNumber'] as String : '--';
    landlineNumber = json['landlineNumber'] != null
        ? json['landlineNumber'] as String
        : '--';
  }

  late final String id;
  late final String name;
  late final String nameKn;
  late final String wardName;
  late final String isGurkar;
  late final String mobileNumber;
  late final String landlineNumber;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['nameKn'] = nameKn;
    _data['wardName'] = wardName;
    _data['isGurkar'] = isGurkar;
    _data['mobileNumber'] = mobileNumber;
    _data['landlineNumber'] = landlineNumber;
    return _data;
  }
}
