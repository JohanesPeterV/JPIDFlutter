import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qualification_application/views/utils/globals.dart';

class DetailPage extends StatefulWidget {
  String image;
  String title;
  String description;
  int price;
  DetailPage(this.image, this.title, this.description, this.price);
  @override
  State<StatefulWidget> createState() {
    return DetailPageState(
        this.image, this.title, this.description, this.price);
  }
}

class DetailPageState extends State<DetailPage> {
  String image;
  String title;
  String description;
  int price;

  var comment = TextEditingController();
  var comments = [];
  DetailPageState(this.image, this.title, this.description, this.price);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: (darkThemeEnabled) ? ThemeData.dark() : ThemeData.light(),
            home: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(
                      text: 'Item Detail',
                    ),
                    Tab(
                      text: 'Item Comments',
                    )
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Builder(
                      builder: (ctx) => SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                  image: AssetImage(image),
                                ),
                                Text(title, style: TextStyle(fontSize: 28)),
                                Text(description,
                                    style: TextStyle(fontSize: 18)),
                                Text(
                                  'IDR $price',
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                                Text('Insert a comment about this product: ',
                                    style: TextStyle(height: 5, fontSize: 18)),
                                Row(children: [
                                  Flexible(
                                    child: TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Comment'),
                                        controller: comment),
                                  ),
                                  ElevatedButton(
                                      child: Text('Comment'),
                                      onPressed: () =>
                                          addComment(comment.text, ctx))
                                ]),
                              ],
                            ),
                          )),
                  ListView(
                    children: [
                      for (var i = 0; i < comments.length; i++)
                        ListTile(
                          leading: Image(image: AssetImage(image)),
                          title: Text(userName + ' Commented'),
                          subtitle: Text(comments[i]),
                        ),
                    ],
                  )
                ],
              ),
            )));
  }

  void addComment(String comment, BuildContext context) {
    setState(() {
      if (comment.length <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('You can not add an empty comment')));
      } else
        comments.add(comment);
    });
  }
}
