import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:widget_demo/rest_api_service.dart';
import 'package:widget_demo/user.dart';
import 'package:widget_demo/user_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final apiService = RestAPIService();

 // List<User> usersList = List<User>();

  List<bool> favouriteStatusList = [];
  List<User> favouriteUsersList = [];

  late Icon favouriteIcon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    apiService.getUsers()//;
    .then((value) {

    //  if(value != null){
   //     usersList = value;
   //   }
      if(value.isNotEmpty){

        for(User user in value){
          //if(favouriteUsersList.contains(user)){
            
         // }
             favouriteStatusList.add(false);
        }
      }

    });
    favouriteIcon = Icon(Icons.favorite_border,color: Colors.red,);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder(
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
                                   icon: getFavouriteIcon(index),
                                   onPressed: () {

                                     setState(() {
                                     //  if(favouriteStatusList[index]){
                                    //          favouriteStatusList[index] = false;
                                    //   }
                                      favouriteStatusList[index] = !favouriteStatusList[index];

                                       if(favouriteUsersList.contains(snapShot.data![index])){
                                           favouriteUsersList.remove(snapShot.data![index]);
                                           print('removed');
                                       }else{
                                         favouriteUsersList.add(snapShot.data![index]);
                                         print('added');
                                       }
                                     });
                                    // for(var item in favouriteUsersList){
                                    //       print(item.name);
                                    // }
                                   },
                                 ) ,
                               ),
                             ),
                           );
                          },
                     );
                }else{
                  return Container(
                    child: Center(
                      child: SpinKitCircle(
                      color: Colors.orange,
                      ),
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

   Icon  getFavouriteIcon(int index){
        if(favouriteStatusList[index]){
          return Icon(Icons.favorite , color: Colors.red,);
        }else{
          return Icon(Icons.favorite_border , color: Colors.red,);
        }
   }
}
