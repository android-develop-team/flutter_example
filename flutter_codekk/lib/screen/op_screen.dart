import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_codekk/entity/op_entity.dart';
import 'package:flutter_codekk/net/api.dart';
import 'package:flutter_codekk/net/fetch.dart';
import 'package:flutter_codekk/tool/tool.dart';
import 'package:flutter_codekk/widget/base_state.dart';
import 'package:flutter_codekk/widget/item_widget_fix.dart';
import 'package:meta/meta.dart';

///  开源项目
class OpScreen extends StatefulWidget {
  final String title;

  OpScreen({@required this.title});

  @override
  State<StatefulWidget> createState() => new OpState(title: title);
}

class OpState extends ListState<OpScreen, ProjectArrayEntity> {
  final String title;

  OpState({@required this.title});

  @override
  Widget itemWidget(ProjectArrayEntity entity) {
    return new Card(
        child: new InkWell(
      onTap: () =>
          startDetailScreen(context, entity.projectName, ApiType.OP, entity.id),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          text(entity.projectName, Colors.green),
          text(entity.desc, Colors.blue),
          text(entity.projectUrl, Colors.pinkAccent),
        ],
      ),
    ));
  }

  @override
  Future<Null> onRefresh() async {
    globalKey.currentState?.show();
    fetchOp(1, '')
        .then((opEntity) => refreshSuccess(opEntity.data.projectArray))
        .catchError((error) => refreshError());
  }

  @override
  void onLoadMore() async {
    loadMoreTips();
    fetchOp(page, '')
        .then((opEntity) => loadMoreSuccess(opEntity.data.projectArray))
        .catchError((error) => loadMoreError());
  }
}
