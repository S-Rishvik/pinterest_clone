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

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['total_pages'] = totalPages;
    _data['results'] = results.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Results {
  Results({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    this.description,
    required this.altDescription,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser
  });
  late final String id;
  late final String createdAt;
  late final String updatedAt;
  late final Null promotedAt;
  late final int width;
  late final int height;
  late final String color;
  late final String blurHash;
  late final Null description;
  late final String altDescription;
  late final Urls urls;
  late final Links links;
  late final int likes;
  late final bool likedByUser;

  Results.fromJson(Map<String, dynamic> json){
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    promotedAt = null;
    width = json['width'];
    height = json['height'];
    color = json['color'];
    blurHash = json['blur_hash'];
    description = null;
    altDescription = json['alt_description'];
    urls = Urls.fromJson(json['urls']);
    links = Links.fromJson(json['links']);
    likes = json['likes'];
    likedByUser = json['liked_by_user'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['promoted_at'] = promotedAt;
    _data['width'] = width;
    _data['height'] = height;
    _data['color'] = color;
    _data['blur_hash'] = blurHash;
    _data['description'] = description;
    _data['alt_description'] = altDescription;
    _data['urls'] = urls.toJson();
    _data['links'] = links.toJson();
    _data['likes'] = likes;
    _data['liked_by_user'] = likedByUser;
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
  late final String raw;
  late final String full;
  late final String regular;
  late final String small;
  late final String thumb;

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

class Links {
  Links({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });
  late final String self;
  late final String html;
  late final String download;
  late final String downloadLocation;

  Links.fromJson(Map<String, dynamic> json){
    self = json['self'];
    html = json['html'];
    download = json['download'];
    downloadLocation = json['download_location'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['self'] = self;
    _data['html'] = html;
    _data['download'] = download;
    _data['download_location'] = downloadLocation;
    return _data;
  }
}

class Sponsorship {
  Sponsorship({
    required this.impressionUrls,
    required this.tagline,
    required this.taglineUrl,
    required this.sponsor,
  });
  late final List<dynamic> impressionUrls;
  late final String tagline;
  late final String taglineUrl;
  late final Sponsor sponsor;

  Sponsorship.fromJson(Map<String, dynamic> json){
    impressionUrls = List.castFrom<dynamic, dynamic>(json['impression_urls']);
    tagline = json['tagline'];
    taglineUrl = json['tagline_url'];
    sponsor = Sponsor.fromJson(json['sponsor']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['impression_urls'] = impressionUrls;
    _data['tagline'] = tagline;
    _data['tagline_url'] = taglineUrl;
    _data['sponsor'] = sponsor.toJson();
    return _data;
  }
}

class Sponsor {
  Sponsor({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    required this.firstName,
    this.lastName,
    required this.twitterUsername,
    required this.portfolioUrl,
    required this.bio,
    required this.location,
    required this.links,
    required this.profileImage,
    required this.instagramUsername,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
    required this.acceptedTos,
    required this.forHire,
    required this.social,
  });
  late final String id;
  late final String updatedAt;
  late final String username;
  late final String name;
  late final String firstName;
  late final Null lastName;
  late final String twitterUsername;
  late final String portfolioUrl;
  late final String bio;
  late final String location;
  late final Links links;
  late final ProfileImage profileImage;
  late final String instagramUsername;
  late final int totalCollections;
  late final int totalLikes;
  late final int totalPhotos;
  late final bool acceptedTos;
  late final bool forHire;
  late final Social social;

  Sponsor.fromJson(Map<String, dynamic> json){
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = null;
    twitterUsername = json['twitter_username'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    links = Links.fromJson(json['links']);
    profileImage = ProfileImage.fromJson(json['profile_image']);
    instagramUsername = json['instagram_username'];
    totalCollections = json['total_collections'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    acceptedTos = json['accepted_tos'];
    forHire = json['for_hire'];
    social = Social.fromJson(json['social']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['updated_at'] = updatedAt;
    _data['username'] = username;
    _data['name'] = name;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['twitter_username'] = twitterUsername;
    _data['portfolio_url'] = portfolioUrl;
    _data['bio'] = bio;
    _data['location'] = location;
    _data['links'] = links.toJson();
    _data['profile_image'] = profileImage.toJson();
    _data['instagram_username'] = instagramUsername;
    _data['total_collections'] = totalCollections;
    _data['total_likes'] = totalLikes;
    _data['total_photos'] = totalPhotos;
    _data['accepted_tos'] = acceptedTos;
    _data['for_hire'] = forHire;
    _data['social'] = social.toJson();
    return _data;
  }
}

class ProfileImage {
  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });
  late final String small;
  late final String medium;
  late final String large;

  ProfileImage.fromJson(Map<String, dynamic> json){
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['small'] = small;
    _data['medium'] = medium;
    _data['large'] = large;
    return _data;
  }
}

class Social {
  Social({
    required this.instagramUsername,
    required this.portfolioUrl,
    required this.twitterUsername,
    this.paypalEmail,
  });
  late final String instagramUsername;
  late final String portfolioUrl;
  late final String twitterUsername;
  late final Null paypalEmail;

  Social.fromJson(Map<String, dynamic> json){
    instagramUsername = json['instagram_username'];
    portfolioUrl = json['portfolio_url'];
    twitterUsername = json['twitter_username'];
    paypalEmail = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['instagram_username'] = instagramUsername;
    _data['portfolio_url'] = portfolioUrl;
    _data['twitter_username'] = twitterUsername;
    _data['paypal_email'] = paypalEmail;
    return _data;
  }
}

class TopicSubmissions {
  TopicSubmissions();

  TopicSubmissions.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    required this.firstName,
    this.lastName,
    required this.twitterUsername,
    required this.portfolioUrl,
    required this.bio,
    required this.location,
    required this.links,
    required this.profileImage,
    required this.instagramUsername,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
    required this.acceptedTos,
    required this.forHire,
    required this.social,
  });
  late final String id;
  late final String updatedAt;
  late final String username;
  late final String name;
  late final String firstName;
  late final Null lastName;
  late final String twitterUsername;
  late final String portfolioUrl;
  late final String bio;
  late final String location;
  late final Links links;
  late final ProfileImage profileImage;
  late final String instagramUsername;
  late final int totalCollections;
  late final int totalLikes;
  late final int totalPhotos;
  late final bool acceptedTos;
  late final bool forHire;
  late final Social social;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = null;
    twitterUsername = json['twitter_username'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    links = Links.fromJson(json['links']);
    profileImage = ProfileImage.fromJson(json['profile_image']);
    instagramUsername = json['instagram_username'];
    totalCollections = json['total_collections'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    acceptedTos = json['accepted_tos'];
    forHire = json['for_hire'];
    social = Social.fromJson(json['social']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['updated_at'] = updatedAt;
    _data['username'] = username;
    _data['name'] = name;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['twitter_username'] = twitterUsername;
    _data['portfolio_url'] = portfolioUrl;
    _data['bio'] = bio;
    _data['location'] = location;
    _data['links'] = links.toJson();
    _data['profile_image'] = profileImage.toJson();
    _data['instagram_username'] = instagramUsername;
    _data['total_collections'] = totalCollections;
    _data['total_likes'] = totalLikes;
    _data['total_photos'] = totalPhotos;
    _data['accepted_tos'] = acceptedTos;
    _data['for_hire'] = forHire;
    _data['social'] = social.toJson();
    return _data;
  }
}

class Tags {
  Tags({
    required this.type,
    required this.title,
  });
  late final String type;
  late final String title;

  Tags.fromJson(Map<String, dynamic> json){
    type = json['type'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['title'] = title;
    return _data;
  }
}