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
        programImage: map["programimag"],
        programImagewide: map["programimagewide"],
        socialMediaPlatforms: new List(),
      );
}

class SocialMedia {
  final String platform;
  final String platformUrl;

  SocialMedia._({
    @required this.platform,
    @required this.platformUrl,
  });

  factory SocialMedia.fromMap(Map map) => new SocialMedia._(
        platform: map["platform"],
        platformUrl: map["platformurl"],
      );
}
