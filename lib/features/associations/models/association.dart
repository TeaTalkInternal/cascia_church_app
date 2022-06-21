import 'dart:ffi';

class Association {
  Association({
    required this.id,
    required this.name,
    required this.nameKn,
    required this.description,
    required this.descriptionKn,
    required this.formationDate,
    required this.thumbnailUrl,
  });

  Association.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'] != null ? json['id'] as String : '--';
    name = json['title'] != null ? json['title'] as String : '--';
    nameKn = json['titleKn'] != null ? json['titleKn'] as String : '--';
    description =
        json['description'] != null ? json['description'] as String : '--';
    descriptionKn =
        json['descriptionKn'] != null ? json['descriptionKn'] as String : '--';
    thumbnailUrl =
        json['thumbnailUrl'] != null ? json['thumbnailUrl'] as String : '--';
    formationDate =
        json['formationDate'] != null ? json['formationDate'] as int : 0;
  }

  late final String id;
  late final String name;
  late final String nameKn;
  late final String description;
  late final String descriptionKn;
  late final int formationDate;
  late final String thumbnailUrl;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = name;
    _data['titleKn'] = nameKn;
    _data['description'] = description;
    _data['descriptionKn'] = descriptionKn;
    _data['thumbnailUrl'] = thumbnailUrl;
    _data['formationDate'] = formationDate;
    return _data;
  }
}
