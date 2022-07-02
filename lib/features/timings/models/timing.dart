class Timing {
  Timing({
    required this.id,
    required this.day,
    required this.dayKn,
    required this.language,
    required this.languageKn,
    required this.timing,
    required this.timingKn,
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
  }

  late final String id;
  late final String day;
  late final String dayKn;
  late final String language;
  late final String languageKn;
  late final String timing;
  late final String timingKn;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['day'] = day;
    data['dayKn'] = dayKn;
    data['language'] = language;
    data['languageKn'] = languageKn;

    data['timing'] = timing;
    data['timingKn'] = timingKn;

    return data;
  }
}
