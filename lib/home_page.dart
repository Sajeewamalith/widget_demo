import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_demo/rest_api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final apiService = RestAPIService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    apiService.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),),
      body: Container(),

    );
  }
}
