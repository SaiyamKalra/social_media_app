import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/mainApp/home_page.dart';
import 'package:social_media_app/mainApp/profile_page.dart';
import 'package:social_media_app/mainApp/user_page.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(child: Icon(Icons.favorite)),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text('H O M E'),
              onTap: () {
                Navigator.pop(context); // pop out drawer

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('P R O F I L E'),
              onTap: () {
                Navigator.pop(context); //pop out drawer

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.group),
              title: Text('U S E R S'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UsersPage()),
                );
              },
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('L O G  O U T'),
              onTap: () {
                logout();
              },
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
