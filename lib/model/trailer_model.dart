class TrailerModel {
  final String id;
  final String youtubeVideoId;
  final String youtubeThumbnail;
  final String title;
  final String url;
  final String thumbnail;
  final String language;
  final List<String> categories;
  final List<String> genres;
  final DateTime published;
  final int views;
  final ResourceModel resource;

  TrailerModel({
    required this.id,
    required this.youtubeVideoId,
    required this.youtubeThumbnail,
    required this.title,
    required this.url,
    required this.thumbnail,
    required this.language,
    required this.categories,
    required this.genres,
    required this.published,
    required this.views,
    required this.resource,
  });

  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    return TrailerModel(
      id: json['id'] ?? '',
      youtubeVideoId: json['youtube_video_id'] ?? '',
      youtubeThumbnail: json['youtube_thumbnail'] ?? '',
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      language: json['language'] ?? '',
      categories: List<String>.from(json['categories'] ?? []),
      genres: List<String>.from(json['genres'] ?? []),
      published: DateTime.tryParse(json['published'] ?? '') ?? DateTime.now(),
      views: json['views'] ?? 0,
      resource: ResourceModel.fromJson(json['resource'] ?? {}),
    );
  }
}

class ResourceModel {
  final String type;
  final String path;
  final String id;
  final String? imdbId;
  final int? tmdbId;

  ResourceModel({
    required this.type,
    required this.path,
    required this.id,
    required this.imdbId,
    required this.tmdbId,
  });

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return ResourceModel(
      type: json['type'] ?? '',
      path: json['path'] ?? '',
      id: json['id'] ?? '',
      imdbId: json['imdb_id'],
      tmdbId: json['tmdb_id'],
    );
  }
}
