class PriestHistory {
  PriestHistory({
    required this.id,
    required this.name,
    required this.from,
    required this.to,
  });

  PriestHistory.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'] != null ? json['id'] as int : 0;
    name = json['name'] != null ? json['name'] as String : '--';
    from = json['from'] != null ? json['from'] as String : '--';
    to = json['to'] != null ? json['to'] as String : '--';
  }

  late final int id;
  late final String name;
  late final String from;
  late final String to;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['from'] = from;
    _data['to'] = to;
    return _data;
  }
}
