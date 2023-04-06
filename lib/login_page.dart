import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_demo/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Demo test');
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

       child: SingleChildScrollView(
         child:  Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Container(
                 padding:EdgeInsets.symmetric(vertical: 20) ,
                 child: Center(
                   child: Text('Login' , style: TextStyle(
                       color: Colors.blue,
                       fontSize: 30,
                       fontWeight: FontWeight.bold
                   ),),
                 )
             ),
             Container(
               padding: EdgeInsets.only(top: 10,bottom: 10),
               width: 300,
               child: Image.network('https://i.pinimg.com/564x/71/b3/e4/71b3e4159892bb319292ab3b76900930.jpg'),
             ),
             ////// Input text form fields (Username , password)
             Container(
               padding: EdgeInsets.symmetric(horizontal: 20),
               child: Column(
                 children: [
                   Container(
                     padding: const EdgeInsets.only(bottom: 20),
                     child: TextFormField(
                       onChanged: (value){
                         // print(value);
                       },
                       controller: _usernameController,
                       decoration: const InputDecoration(
                           border: UnderlineInputBorder(),
                           labelText: 'Enter your username',
                           hintText: 'Username'
                       ),
                     ) ,
                   ),
                   Container(
                     padding: const EdgeInsets.only(bottom: 20),
                     child: TextFormField(
                       controller: _passwordController,
                       decoration: const InputDecoration(
                           border: UnderlineInputBorder(),
                           labelText: 'Enter your password',
                           hintText: 'password'
                       ),
                     ),
                   ),
                 ],
               ),
             ),
             //////////// Login Button
             Container(
               padding: EdgeInsets.symmetric(vertical: 30 ) ,
               width: 200,
               child: ElevatedButton(
                 onPressed: loginButtonClick,
                 child: Text('Login',style: TextStyle(
                   color: Colors.white,
                 ),),
               ),
             )
           ],
         ),
       )

      ),
    );
  }

  void loginButtonClick(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage() ));
 //   if(_usernameController.text =='user123' && _passwordController.text == '12345'){
 //     print('Login Success');
 //   }else{
 //     print('Login Fail');
 //   }
  }
}
