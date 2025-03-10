import 'package:cheetoo/config/Assets.dart';
import 'package:cheetoo/config/Peletts.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 100;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var textHeading = TextStyle(color: Palette.primaryTextColorLight, fontSize: 20); // Text style for the name
    var textStyle = TextStyle(color: Palette.secondaryTextColorLight); // Text style for everything else

    double width = MediaQuery.of(context).size.width; // calculate the screen width

    return Material(
      child: Container(
        decoration: new BoxDecoration(boxShadow: [
          //adds a shadow to the appbar
          new BoxShadow(
            color: Colors.black,
            blurRadius: 5.0,
          )
        ]),
        child: Container(
          color: Palette.primaryColor,
          child: Row(
            children: <Widget>[
              Expanded(
                  //we're dividing the appbar into 7 : 3 ratio. 7 is for content and 3 is for the display picture.
                  flex: 7,
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                          height: 70 - (width * .06),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  flex: 2,
                                  child: Center(
                                      child: Icon(
                                    Icons.attach_file,
                                    color: Palette.secondaryColor,
                                  ))),
                              Expanded(
                                  flex: 6,
                                  child: Container(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text('Dia Hard', style: textHeading),
                                      Text('@diehard09', style: textStyle),
                                    ],
                                  ))),
                            ],
                          )),
                      //second row containing the buttons for media
                      Container(
                          height: 23,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Photos',
                                style: textStyle,
                              ),
                              VerticalDivider(
                                width: 30,
                                color: Palette.primaryTextColorLight,
                              ),
                              Text(
                                'Videos',
                                style: textStyle,
                              ),
                              VerticalDivider(
                                width: 30,
                                color: Palette.primaryTextColorLight,
                              ),
                              Text('Files', style: textStyle)
                            ],
                          )),
                    ],
                  ))),
              //This is the display picture
              Expanded(
                flex: 3,
                child: Container(
                  child: Center(
                    child: CircleAvatar(
                      radius: (80 - (width * .06))/2,
                      backgroundImage: Image.asset(Assets.user).image,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return Size.fromWidth(height);
  }
}
