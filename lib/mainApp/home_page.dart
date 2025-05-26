import 'package:flutter/material.dart';
import 'package:social_media_app/components/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home")),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: DrawerComponent(),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
        ],
      ),
    );
  }
}
