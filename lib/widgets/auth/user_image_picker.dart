import 'package:flutter/material.dart';

class UserImagePicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    new _UserImagePickerState();
  }
}

class _UserImagePickerState extends State<UserImagePicker> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 40,
        ),
        FlatButton.icon(
            textColor: Theme.of(context).primaryColor,
            onPressed: () {},
            icon: Icon(Icons.image),
            label: Text('Add Image')),
      ],
    );
  }
}
