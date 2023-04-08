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
  List<String> data = ['Monday' , 'Tuesday' , 'Wednesday','Thursday','Friday',
    'Monday' , 'Tuesday' , 'Wednesday','Thursday','Friday'];

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
                child: ListView.builder(
                  //physics: NeverScrollableScrollPhysics(),
                  itemCount: data.length,

                   itemBuilder: (context , index){
                 return Container(
                   margin: const EdgeInsets.symmetric(vertical: 10),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(10),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.4),
                           spreadRadius: 3,
                           blurRadius: 3
                         )
                       ]
                     ),
                   child: ListTile(
                       leading: const Icon(Icons.calendar_today, color: Colors.orange,) ,
                       title: Text(data[index], style: const TextStyle(color: Colors.black),),
                       subtitle: const Text('Days', style: TextStyle(color: Colors.black),),
                       trailing: const Icon(Icons.delete,color: Colors.red,),
                     //  IconButton(icon: Icon(Icons.delete),color: Colors.red, onPressed: () {  },),
                 ),
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



