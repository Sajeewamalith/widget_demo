import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_demo/user.dart';

class UserScreen extends StatefulWidget {

  final User user;

  const UserScreen({Key? key,required this.user}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('User Screen'),
        ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Center(
              child: ClipOval(
                child: Image.network(widget.user.image , fit:BoxFit.cover,width: 150 ,height: 150,),
            ),
        ),
            ),
            Container(
              child: Center(
                child: Text(widget.user.name, style: TextStyle(fontSize: 25,color: Colors.black),),
              ),
            ),
            Container(
              child: Center(
                child: Text(widget.user.city, style: TextStyle(fontSize: 20,color: Colors.black),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
