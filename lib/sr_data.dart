import 'package:meta/meta.dart';

class Program {
  final String name;
  final String description;
  final String programImage;
  final String programImagewide;
  final List<SocialMedia> socialMediaPlatforms;

  Program._({
    @required this.name,
    @required this.description,
    @required this.programImage,
    @required this.programImagewide,
    @required this.socialMediaPlatforms,
  });

  factory Program.fromMap(Map map) => new Program._(
        name: map["name"],
        description: map["description"],
        programImage: map["programimage"],
        programImagewide: map["programimagewide"],
        socialMediaPlatforms:
            SocialMedia.fromMapList(map["socialmediaplatforms"]),
      );
}

class SocialMedia {
  final String platform;
  final String platformUrl;

  SocialMedia._({
    @required this.platform,
    @required this.platformUrl,
  });

  static List<SocialMedia> fromMapList(List list) =>
      list.map((map) => new SocialMedia.fromMap(map)).toList();

  factory SocialMedia.fromMap(Map map) => new SocialMedia._(
        platform: map["platform"],
        platformUrl: map["platformurl"],
      );
}
