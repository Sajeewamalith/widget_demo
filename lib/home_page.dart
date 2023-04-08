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
  List<String> data = ['Monday' , 'Tuesday' , 'Wednesday','Thursday','Friday'];

    @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  const Text('Home Page'),

      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
              child: Center(
              child: Text('Welcome ${widget.username}',
                  style: TextStyle(fontSize: 30),
              ),
             )
            ),
            Expanded(
                child: ListView.separated(
                  //physics: NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  separatorBuilder:(context,index) {
                 return Container(color: Colors.grey,height:1,);
            },
            itemBuilder: (context , index){
                 return Container(
                     margin: EdgeInsets.symmetric(vertical: 10),
                     height: 50,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.blue
                     ),
                     child: Center(
                       child: Text(data[index] , style: TextStyle(
                           color: Colors.white
                       ),),
                     )
                 );
            },






                )
      ),
            /////////////////// Log out button .....................
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



