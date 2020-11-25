import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder(
      stream: Firestore.instance.collection('chat').snapshots(),
      builder: (ctx, chatSnapShot) {
        if (chatSnapShot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final chatDoc = chatSnapShot.data.documents;
        return ListView.builder(
          itemCount: chatSnapShot.data.documents.length,
          itemBuilder: (ctx, index) => Text(chatDoc[index]['text']),
        );
      },
    );
  }
}
