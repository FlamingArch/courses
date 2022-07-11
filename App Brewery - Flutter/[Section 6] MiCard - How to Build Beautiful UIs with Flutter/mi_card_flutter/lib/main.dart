import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("images/harsh.jpg"),
            ),
            Text(
              'Harsh Chaturvedi',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
                color: Colors.white,
              ),
            ),
            Text("DEVELOPER AND DESIGNER",
                style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20,
                    color: Colors.red[100],
                    letterSpacing: 3,
                    fontWeight: FontWeight.w900)),
            SizedBox(
              width: 150,
              height: 20,
              child: Divider(
                color: Colors.red[100]
              ),
            ),
            Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.red[600],
                  ),
                  title: Text("+91 8953 642 879"),
                )),
            Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.red[600],
                  ),
                  title: Text("harshchaturvedi1002@gmail.com"),
                )),
          ],
        )),
      ),
    );
  }
}
