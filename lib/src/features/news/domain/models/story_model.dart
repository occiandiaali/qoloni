class StoryModel {
  final String author;
  final String title;
  final String url;
  final String urlToImage;
  final String publishedAt;

  StoryModel({
    required this.author,
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.publishedAt
});

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      author: json['author'] ?? "Unknown author",
      title: json['title'],
      url: json['url'],
      urlToImage: json['urlToImage'] ?? "https://placehold.co/600x400/FFFFFF/000000.png",
      publishedAt: json['publishedAt']
    );
  }
}

