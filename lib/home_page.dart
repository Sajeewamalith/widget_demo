import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/login_page.dart';
import 'package:widget_demo/splash_page.dart';

class Homepage extends StatefulWidget {
  final String username;

  const Homepage({Key? key, required this.username}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  const Text('Login Page'),

      ),
      body: Container(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Center(
              child: Text('Welcome ${widget.username}',
                  style: TextStyle(fontSize: 30),
              ),
             )
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                   child: Text('Log out'),
                ),
            )
          ],
        ),
        ),
      ),
    );
  }
}



