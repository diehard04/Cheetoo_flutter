import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance
              .collection("chats/hxQHP2ZQ3bQx1RzAOKnt/messages")
              .snapshots(),
          builder: (ctx, streamSnapShot) {
            if(streamSnapShot.connectionState ==ConnectionState.waiting) {
               return Center(
                 child: CircularProgressIndicator(),
               );
            }
            final documents = streamSnapShot.data.documents;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(8.0),
                child: Text(documents[index]['text']),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

        },
      ),
    );
  }
}
