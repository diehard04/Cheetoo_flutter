import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.userId, this.isME, {this.key});

  final Key key;
  final String message;
  final bool isME;
  final String userId;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: isME ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              color: isME ? Colors.grey[300] : Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: !isME ? Radius.circular(0) : Radius.circular(12),
                bottomRight: isME ? Radius.circular(0) : Radius.circular(12),
              ),
            ),
            width: 140,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            child: Column(
              crossAxisAlignment:
                  isME ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                FutureBuilder(
                  future: Firestore.instance
                      .collection('users')
                      .document(userId)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('loading....');
                    }
                    return Text(
                      snapshot.data['userName'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isME
                            ? Colors.black
                            : Theme.of(context).accentTextTheme.headline1.color,
                      ),
                    );
                  },
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: isME
                        ? Colors.black
                        : Theme.of(context).accentTextTheme.headline1.color,
                  ),
                  textAlign: isME ? TextAlign.end : TextAlign.start,
                ),
              ],
            ))
      ],
    );
  }
}
