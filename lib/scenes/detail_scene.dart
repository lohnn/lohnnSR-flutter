import 'package:flutter/material.dart';
import 'package:lohnn_sr_flutter/scenes/main_scene.dart';
import 'package:lohnn_sr_flutter/sr_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScene extends StatelessWidget {
  final Program program;

  DetailScene(this.program);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return new MainScene(
      (_) => new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Image.network(program.programImage),
              new Padding(
                padding: const EdgeInsets.only(
                  top: 4.0,
                  left: 8.0,
                  right: 8.0,
                  bottom: 8.0,
                ),
                child: new Text(
                  program.name,
                  style: textTheme.headline,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(
                  top: 4.0,
                  left: 8.0,
                  right: 8.0,
                  bottom: 8.0,
                ),
                child: new Text(
                  program.description,
                  style: textTheme.body1,
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    _createSocialMediaButtons(program.socialMediaPlatforms),
              ),
            ],
          ),
    );
  }

  List<Widget> _createSocialMediaButtons(List<SocialMedia> socialMediaList) {
    return socialMediaList
        .map((socialMedia) {
          switch (socialMedia.platform) {
            case "Facebook":
              return _createButton(
                  "icons/facebook.png", const Color(0xFF3B5998), "");
            case "Instagram":
              return _createButton(
                  "icons/instagram.png", const Color(0xFFcd486b), "");
            case "Twitter":
              return _createButton(
                  "icons/twitter.png", const Color(0xFF00aced), "");
          }
          return null;
        })
        .takeWhile((widget) => widget != null)
        .toList();
  }

  Widget _createButton(String icon, Color tint, String url) => new InkResponse(
        onTap: () => _launchUrl(url),
        child: new Padding(
          padding: const EdgeInsets.all(4.0),
          child: new InkResponse(
            child: new Image.asset(
              icon,
              color: tint,
            ),
          ),
        ),
      );

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
