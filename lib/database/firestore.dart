// this database stores posts that users haev published in the app.
// it is stored in a collection called posts in firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  User? user = FirebaseAuth.instance.currentUser;

  final CollectionReference posts = FirebaseFirestore.instance.collection(
    "Posts",
  );

  Future<void> addPost(String message) {
    return posts.add({
      'UserEmail': user?.email,
      'PostMessage': message,
      'TimeStamp': Timestamp.now(),
    });
  }

  // read posts from database
  Stream<QuerySnapshot> getPostsStream() {
    final postsStream =
        FirebaseFirestore.instance
            .collection("Posts")
            .orderBy('TimeStamp', descending: true)
            .snapshots();
    return postsStream;
  }
}
