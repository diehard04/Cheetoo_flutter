import 'package:cheetoo/widgets/ChatAppBar.dart';
import 'package:cheetoo/widgets/ChatListWidget.dart';
import 'package:cheetoo/widgets/InputWidget.dart';
import 'package:flutter/material.dart';

class ConversionPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ConversationPageState();
  }

}

class _ConversationPageState extends State<ConversionPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SafeArea(
        child: Scaffold(
          appBar: ChatAppBar(),
          body: Stack(
            children: <Widget>[
              Column (
                children: <Widget>[
                  ChatListWidget(),
                  InputWidget()
                ],
              )
            ],
          ),
        )
    );
  }
}
