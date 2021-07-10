import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qualification_application/views/pages/Home.dart';
import 'package:qualification_application/views/utils/globals.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  var nameC = TextEditingController();
  var pass = TextEditingController();

  void _onPressed(BuildContext context) {
    var msg = '';
    if (nameC.text.length <= 3) {
      msg = 'Username should be more than 3 characters';
    } else if (pass.text.length <= 6) {
      msg = 'Password should be more than 6 characters';
    } else if (nameC.text.startsWith('.')) {
      msg = 'Username should not start with .';
    } else if (!pass.text.contains(new RegExp(r'[A-Z]')) ||
        !pass.text.contains(new RegExp(r'[a-z]'))) {
      msg = 'Password should contain both uppercase and lowercase.';
    } else {
      userName = nameC.text;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: (darkThemeEnabled) ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
            appBar:
                new AppBar(title: new Text('Login JP ID'), centerTitle: true),
            body: SingleChildScrollView(
                child: Builder(
                    builder: (ctx) => Column(children: <Widget>[
                          SizedBox(height: 10),
                          Image(image: AssetImage('assets/red.png')),
                          Text('UserName: ',
                              style: TextStyle(height: 5, fontSize: 18)),
                          TextField(
                            decoration: InputDecoration(hintText: 'username'),
                            controller: nameC,
                          ),
                          Text('Password: ',
                              style: TextStyle(height: 5, fontSize: 18)),
                          TextField(
                            decoration: InputDecoration(hintText: 'password'),
                            obscureText: true,
                            controller: pass,
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                              onPressed: () => _onPressed(ctx),
                              child: Text("Login",
                                  style: TextStyle(height: 5, fontSize: 18)))
                        ])))));
  }
}
