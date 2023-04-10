import 'dart:convert';

import 'package:widget_demo/user.dart';
import 'package:http/http.dart' as http;

class RestAPIService{

  String apiUrl = 'https://mocki.io/v1/c36350e3-a20b-457f-9974-38bf0cca5041';

  //////// Future method to get all users from API url.....(response or error)
  Future<List<User>> getUsers()  async {

    final response = await http.get(Uri.parse(apiUrl));

    print(response.body);

    ////// checking the response using status code is successful or not
    if(response.statusCode == 200){
       return getUsersList(response.body);
    }else{
      throw Exception('Unable to fetche data');
    }

  }

  ///// Convert response body -> User object list
  List<User> getUsersList(String responseBody){

    final parsedBody = json.decode(responseBody).cast<Map<String ,dynamic>>();
    return parsedBody.map<User>((json) =>User.fromJson(json)).toList();
  }
}
