class PostModel {
  final int id;
  final String title;
  final String type;
  final String imageUrl;

  PostModel({
    required this.id,
    required this.title,
    required this.type,
    required this.imageUrl,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['mal_id'],
      title: json['title'],
      type: json['type'],
      imageUrl: json['images']['jpg']['image_url'],
    );
  }
}
