import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/splash_page.dart';

class Homepage extends StatefulWidget {
  

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
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen() ));
          },
          child: Text('Log Out'),
        ),
        ),
      ),
    );
  }
}



