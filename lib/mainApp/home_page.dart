import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/components/drawer.dart';
import 'package:social_media_app/components/post_button.dart';
import 'package:social_media_app/database/firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final FirestoreDatabase database = FirestoreDatabase();

  final TextEditingController textController = TextEditingController();

  // post message
  void PostMessage() {
    if (textController.text.isNotEmpty) {
      String message = textController.text;
      database.addPost(message);
    }

    textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 110.0),
          child: Text("Home"),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: DrawerComponent(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          hintText: "Say Something...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    PostButton(onTap: PostMessage),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          StreamBuilder(
            stream: database.getPostsStream(),
            builder: (context, snapshot) {
              // loading circle
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              // get all posts
              final posts = snapshot.data!.docs;

              // no data present
              if (snapshot.data == null || posts.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text("No posts... Post something!"),
                  ),
                );
              }

              // return a list
              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];

                    String message = post['PostMessage'];
                    String UserEmail = post['UserEmail'];
                    Timestamp timestamp = post['TimeStamp'];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ],
                        ),
                        child: ExpansionTile(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          title: Text(message),
                          children: [Text(UserEmail)],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
