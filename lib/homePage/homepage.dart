import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mess_app/homePage/database.dart';
import 'package:mess_app/homePage/post.dart';
import 'package:mess_app/homePage/postList.dart';
import 'package:mess_app/homePage/textInputWidget.dart';

class MyHomePage extends StatefulWidget {
  final FirebaseUser user;

  MyHomePage(this.user);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    var post = new Post(text, widget.user.displayName);
    post.setId(savePost(post));
    this.setState(() {
      posts.add(post);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message App'),
      ),
      body: Column(
        children: [
          Expanded(child: PostList(this.posts, widget.user)),
          TextInputWidget(this.newPost)
        ],
      ),
    );
  }
}
