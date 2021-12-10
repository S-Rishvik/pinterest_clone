class GetImagesResponse {
  GetImagesResponse({
    required this.total,
    required this.totalPages,
    required this.results,
  });
  late final int total;
  late final int totalPages;
  late final List<Results> results;

  GetImagesResponse.fromJson(Map<String, dynamic> json){
    total = json['total'];
    totalPages = json['total_pages'];
    results = List.from(json['results']).map((e)=>Results.fromJson(e)).toList();
  }

}

class Results {
  Results({
    required this.id,
    required this.description,
    required this.urls,
  });
  late final String? id;
  late final String? description;
  late final Urls? urls;

  Results.fromJson(Map<String, dynamic> json){
    id = json['id'];
    description = json['description'];
    urls = Urls.fromJson(json['urls']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['description'] = description;
    _data['urls'] = urls?.toJson();
    return _data;
  }
}

class Urls {
  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });
  late final String? raw;
  late final String? full;
  late final String? regular;
  late final String? small;
  late final String? thumb;

  Urls.fromJson(Map<String, dynamic> json){
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['raw'] = raw;
    _data['full'] = full;
    _data['regular'] = regular;
    _data['small'] = small;
    _data['thumb'] = thumb;
    return _data;
  }
}



