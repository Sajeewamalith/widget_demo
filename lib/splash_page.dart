import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_demo/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
        Center(
          child: Image.network('https://i.pinimg.com/564x/71/b3/e4/71b3e4159892bb319292ab3b76900930.jpg'),
       ),
          Container(
            child: Center(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage() ));
                },
                child: Text('Push and remove until'),
              ),
            ),

            )


    ],
      )
    );
  }
}
