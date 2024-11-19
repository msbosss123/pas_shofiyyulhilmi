class PostModel {
  final String title;
  final String imageUrl;
  final String type;

  PostModel({required this.title, required this.imageUrl, required this.type});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      title: json['strTeam'] ?? 'Unknown', // Replace with the correct field name
      imageUrl: json['strTeamLogo'] ?? '', // Replace with the correct field name
      type: json['strLeague'] ?? 'Unknown',
    );
  }
}
