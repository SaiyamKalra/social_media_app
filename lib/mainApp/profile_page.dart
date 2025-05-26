import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // current logged in User
  User? currentUser = FirebaseAuth.instance.currentUser;

  // Future to fetch user details

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 110.0),
          child: Text('Profile'),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error : ${snapshot.error}");
          } else if (snapshot.hasData) {
            Map<String, dynamic>? user = snapshot.data!.data();

            return Center(
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Icon(Icons.person, size: 150),
                  SizedBox(height: 30),
                  Text(user!['username'], style: TextStyle(fontSize: 30)),
                  SizedBox(height: 20),
                  Text(user['email'], style: TextStyle(fontSize: 20)),
                ],
              ),
            );
          } else {
            return Center(child: Text('No Data'));
          }
        },
      ),
    );
  }
}
