class GetRandomImagesResponse {
  GetRandomImagesResponse({String? id, String? description, Urls? urls}) {
    _id = id;
    _description = description;
    _urls = urls;
  }

  GetRandomImagesResponse.fromJson(dynamic json) {
    _id = json['id'];
    _description = json['description'];
    _urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
  }

  String? _id;
  String? _description;
  Urls? _urls;

  String? get id => _id;

  String? get description => _description;

  Urls? get urls => _urls;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['description'] = _description;
    if (_urls != null) {
      map['urls'] = _urls?.toJson();
    }
    return map;
  }
}

class Urls {
  Urls({
    String? raw,
    String? full,
    String? regular,
    String? small,
    String? thumb,
  }) {
    _raw = raw;
    _full = full;
    _regular = regular;
    _small = small;
    _thumb = thumb;
  }

  Urls.fromJson(dynamic json) {
    _raw = json['raw'];
    _full = json['full'];
    _regular = json['regular'];
    _small = json['small'];
    _thumb = json['thumb'];
  }

  String? _raw;
  String? _full;
  String? _regular;
  String? _small;
  String? _thumb;

  String? get raw => _raw;

  String? get full => _full;

  String? get regular => _regular;

  String? get small => _small;

  String? get thumb => _thumb;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['raw'] = _raw;
    map['full'] = _full;
    map['regular'] = _regular;
    map['small'] = _small;
    map['thumb'] = _thumb;
    return map;
  }
}
