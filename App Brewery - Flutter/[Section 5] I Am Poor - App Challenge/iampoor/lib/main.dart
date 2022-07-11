import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home:Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text("I am Poor"),
          ),
          body: Center(
            child: Image(
              image: AssetImage(
                "images/I'm dreaing of a.png"
              ),
            ),
          ),
        )
      ),
    );
