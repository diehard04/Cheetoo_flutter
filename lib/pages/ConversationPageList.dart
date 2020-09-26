import 'package:flutter/material.dart';
import 'ConversionPage.dart';

class ConversationPageList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ConversationPageList();
  }

}

class _ConversationPageList extends State<ConversationPageList>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      children: <Widget>[
        ConversionPage(),
        ConversionPage(),
        ConversionPage()
      ],
    );
  }


}
