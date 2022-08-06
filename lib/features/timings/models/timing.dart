class Timing {
  Timing({
    required this.id,
    required this.day,
    required this.dayKn,
    required this.language,
    required this.languageKn,
    required this.timing,
    required this.timingKn,
    required this.massType,
    required this.massTypeName,
    required this.massTypeKn,
    required this.massTypeNameKn,
  });

  Timing.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'] != null ? json['id'] as String : '--';
    day = json['day'] != null ? json['day'] as String : '--';
    dayKn = json['dayKn'] != null ? json['dayKn'] as String : '--';
    language = json['language'] != null ? json['language'] as String : '--';
    languageKn =
        json['languageKn'] != null ? json['languageKn'] as String : '--';
    timing = json['timing'] != null ? json['timing'] as String : '--';
    timingKn = json['timingKn'] != null ? json['timingKn'] as String : '--';
    massType = json['massType'] != null ? json['massType'] as String : '--';
    massTypeName =
        json['massTypeName'] != null ? json['massTypeName'] as String : '--';
    massTypeKn =
        json['massTypeKn'] != null ? json['massTypeKn'] as String : '--';
    massTypeNameKn = json['massTypeNameKn'] != null
        ? json['massTypeNameKn'] as String
        : '--';
  }

  late final String id;
  late final String day;
  late final String dayKn;
  late final String language;
  late final String languageKn;
  late final String timing;
  late final String timingKn;
  late final String massType;
  late final String massTypeName;
  late final String massTypeKn;
  late final String massTypeNameKn;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['day'] = day;
    data['dayKn'] = dayKn;
    data['language'] = language;
    data['languageKn'] = languageKn;
    data['timing'] = timing;
    data['timingKn'] = timingKn;
    data['massType'] = massType;
    data['massTypeName'] = massTypeName;
    data['massTypeKn'] = massTypeKn;
    data['massTypeNameKn'] = massTypeNameKn;

    return data;
  }
}
