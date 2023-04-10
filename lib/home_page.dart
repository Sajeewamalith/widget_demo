import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_demo/rest_api_service.dart';
import 'package:widget_demo/user_screen.dart';

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
      body: Container(
        child: Column(
          children: [
            Expanded(child: FutureBuilder(
              future: apiService.getUsers(),
              builder: (context , snapShot){

                if(snapShot.hasData){
                     return ListView.builder(
                       itemCount: snapShot.data?.length ,
                       itemBuilder: (context , index){
                         //return Container(margin: EdgeInsets.all(10),height: 50, width: 200,color: Colors.blue,);
                           return InkWell(
                             onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context) => UserScreen(
                                 user: snapShot.data![index],
                               )));
                             },
                             child: Container(
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(10),
                                 boxShadow: [
                                   BoxShadow(
                                     blurRadius: 3,
                                     spreadRadius: 3,
                                     color: Colors.grey.withOpacity(0.3)
                                   )
                                 ]
                               ),
                              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                               child: ListTile(
                                 title: Text(snapShot.data![index].name ?? '', style: TextStyle(fontSize: 18,color: Colors.black),),
                                 subtitle: Text(snapShot.data![index].city ?? '', style: TextStyle(fontSize: 15,color: Colors.black),),
                                 leading: ClipOval(
                                   child: Image.network(snapShot.data![index].image , fit:BoxFit.cover,width: 60 ,height: 60,),
                                 ),
                                 trailing: IconButton(
                                   icon: Icon(Icons.favorite_border),
                                   onPressed: () {  },

                                 ) ,
                               ),
                             ),
                           );
                          },
                     );
                }else{
                  return Container(
                    child: Center(
                      child: Text('Loading....' , style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ), ),
                    ),
                  );
                }
              } ,
            ))
          ],
        ),
      ),

    );
  }
}
