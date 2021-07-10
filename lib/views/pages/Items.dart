import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qualification_application/views/models/Item.dart';
import 'package:qualification_application/views/pages/Detail.dart';
import 'package:qualification_application/views/utils/globals.dart';

class ItemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ItemState();
  }
}

class ItemState extends State<ItemPage> {
  var items = [
    Item(
        'assets/AE.jpg',
        'Why so expensive you ask? Well of course, because of how good I am at teaching.',
        'I will teach you flutter for 8 hours',
        8000000),
    Item(
        'assets/1.png',
        'If you wonder, is this a component of a skybox? The answer is yes.',
        'Sky Painting 1',
        5000),
    Item(
        'assets/2.png',
        'A wise man(Soekarno) once said, "Bermimpilah setinggi langit... jikau engkau jatuh, engkau akan jatuh di antara bintang bintang"',
        'Sky Painting 2',
        5000),
    Item(
        'assets/3.png',
        'Once upon a time, a programming prodigy is born, and he is destined to have this painting. Well you could be him, if you buy this painting...',
        'Sky Painting 3',
        5000),
    Item('assets/4.png', 'If u look up in the sky, you won\'t find this',
        'Sky Painting 4', 5000),
    Item('assets/5.png', 'This is a sky', 'Sky Painting 5', 5000),
    Item(
        'assets/Y540.jpg',
        'A smart person would know, that buying this laptop is a smart choice',
        'Lenovo Legion Y540',
        21000000),
    Item(
        'assets/Y740.jpg',
        'If you see someone using this laptop, that is a signt that you have just seen a smart person',
        'Lenovo Legion Y740',
        22000000),
  ];
  void goToDetail(int idx, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(
                items[idx].thumbNail,
                items[idx].itemName,
                items[idx].description,
                items[idx].price)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: (darkThemeEnabled) ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          appBar: new AppBar(title: new Text('Items Page'), centerTitle: true),
          body: ListView(
            children: [
              for (int i = 0; i < items.length; i++)
                ListTile(
                  leading: Image(image: AssetImage(items[i].thumbNail)),
                  title: Text(items[i].itemName),
                  subtitle: Text('IDR ${items[i].price}'),
                  onTap: () => goToDetail(i, context),
                ),
            ],
          ),
        ));
  }
}
