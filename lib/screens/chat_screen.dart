import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/constants/firestore.dart';
import 'package:flutter_chat_app/widgets/chat/messages.dart';
import 'package:flutter_chat_app/widgets/chat/new_message.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterChat'),
        actions: <Widget>[
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Logout'),
                    ],
                  ),
                ),
                value: 'logout',
              ),
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
      // body: StreamBuilder(
      //   stream: firestoreCollection.snapshots(),
      //   builder: (ctx, streamSnapshot) {
      //     if (streamSnapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     final documents = streamSnapshot.data.docs;
      //     return ListView.builder(
      //       itemCount: documents.length,
      //       itemBuilder: (ctx, index) => Container(
      //         padding: EdgeInsets.all(8),
      //         child: Text(documents[index]['text']),
      //       ),
      //     );
      //   },
      // ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     firestoreCollection.add({
      //       'text': 'This was added by clicking the button!',
      //     });
      //   },
      // ),
    );
  }
}
