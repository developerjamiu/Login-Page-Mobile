import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String emailAddress;

  const HomeScreen({Key key, this.emailAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Welcome \n$emailAddress'),
        elevation: 0,
      ),
      body: Center(
        child: Hero(
          tag: 'Image',
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset(
              'assets/welcome.png',
            ),
          ),
        ),
      ),
    );
  }
}
