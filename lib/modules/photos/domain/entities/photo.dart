class Photo{
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.albumId,
    required this.id,
    required this.thumbnailUrl,
    required this.title,
    required this.url
  });
}