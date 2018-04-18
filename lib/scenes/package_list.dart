import 'package:flutter/material.dart';
import 'package:lohnn_sr_flutter/scenes/detail_scene.dart';
import 'package:lohnn_sr_flutter/sr_api.dart' as srApi;
import 'package:lohnn_sr_flutter/sr_data.dart';

class PackageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      initialData: new List(),
      stream: srApi.apiStream(),
      builder: (context, AsyncSnapshot<List> map) {
        var itemList = map.data;
        return new ListView.builder(
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              return new PackageItemWidget(Program.fromMap(itemList[index]));
            });
      },
    );
  }
}

class PackageItemWidget extends StatelessWidget {
  final Program program;

  PackageItemWidget(this.program);

  @override
  Widget build(BuildContext context) => new Padding(
        padding: const EdgeInsets.all(4.0),
        child: new InkWell(
          onTap: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (_) => new DetailScene(program)));
          },
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Image.network(
                program.programImagewide,
                width: 133.0,
                height: 100.0,
              ),
              const Padding(padding: const EdgeInsets.only(left: 8.0)),
              new Expanded(
                child: new Text(program.name,
                    style: Theme.of(context).textTheme.subhead),
              ),
            ],
          ),
        ),
      );
}
