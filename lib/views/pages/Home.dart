import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:qualification_application/views/pages/Items.dart';
import 'package:qualification_application/views/pages/Login.dart';
import 'package:qualification_application/views/utils/globals.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  HomeState();
  var _imgs = [
    'assets/cashback 10.jpg',
    'assets/cashback 20.jpg',
    'assets/cashback 30.jpg',
    'assets/cashback 40.jpg',
  ];
  goHome(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  goItems(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ItemPage()));
  }

  goLogin(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: (darkThemeEnabled) ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
          appBar: new AppBar(title: new Text('Home'), centerTitle: true),
          drawer: Drawer(
              child: Drawer(
            child: Column(
              children: [
                SizedBox(height: 40, width: 10),
                Text(
                  'Hello, ' + userName,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10, width: 10),
                TextButton(
                    onPressed: () => goHome(context), child: Text('Home')),
                TextButton(
                  onPressed: () => goItems(context),
                  child: Text('Items Page'),
                ),
                TextButton(
                    onPressed: () => goLogin(context), child: Text('Logout')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Toggle Dark Mode'),
                    Switch(
                        value: darkThemeEnabled,
                        onChanged: (value) {
                          setState(() {
                            darkThemeEnabled = value;
                          });
                        })
                  ],
                )
              ],
            ),
          )),
          body: Column(
            children: [
              SizedBox(
                height: 10,
                width: 10,
              ),
              Text(
                'Hello, ' + userName,
                style: TextStyle(fontSize: 20),
              ),
              CarouselSlider(
                items: [
                  Image(image: AssetImage(_imgs[0])),
                  Image(image: AssetImage(_imgs[1])),
                  Image(image: AssetImage(_imgs[2])),
                  Image(image: AssetImage(_imgs[3])),
                ],
                options: CarouselOptions(
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlayInterval: Duration(seconds: 2)),
              ),
              Text(
                'JP.ID is currently having a good deal of cashback. Visit the items page to buy items.',
                style: TextStyle(fontSize: 20),
              )
            ],
          )),
    );
  }
}
