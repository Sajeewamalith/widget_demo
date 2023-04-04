import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  const Text('Login Page'),
        leading: const Icon(
          Icons.account_balance,
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.orange,
        width: 200,
        height: 100,
        child: Text(''),
      ),
    );
  }
}
