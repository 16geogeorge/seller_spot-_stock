import 'package:flutter/material.dart';

import 'package:seller_spot_stock/api/seller_sopt_error.dart';
import 'package:seller_spot_stock/dao/slr_spt_admin.dart';

import '../../../main.dart';
import 'login_screen_presenter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>  implements AdminLoginPresenterContract {
  AdminLoginPresenter _presenter;

  bool errorLogin=false;

  _LoginScreenState() {
    _presenter = new AdminLoginPresenter(this);
  }

  TextEditingController usernameAdmin = TextEditingController();
  TextEditingController passwordAdmin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                height: height*0.45,
                child:Image(image: NetworkImage('https://cdn2.f-cdn.com/contestentries/1464699/13553911/5c38e05068f0a_thumb900.jpg'),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Login',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: 30.0,),
              TextField(
                controller: usernameAdmin,
                decoration: InputDecoration(

                  hintText: 'Email',
                  suffixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              TextField(
                controller: passwordAdmin,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height:10.0),
              errorLogin?
              Center(child: Text("Invalid Credentials ",style: TextStyle(color: Colors.red),)):
              SizedBox(height:10.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Forgot password?',style: TextStyle(fontSize: 12.0),),

                    RaisedButton(
                      child: Text('Login'),
                      color: Color(0xffEE7B23),
                      onPressed: (){

                        _presenter.getAdminLoginFromServer(usernameAdmin.text,passwordAdmin.text);
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height:20.0),
              // GestureDetector(
              //   onTap: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
              //   },
              //   child: Text.rich(
              //     TextSpan(
              //         text: 'Don\'t have an account',
              //         children: [
              //           TextSpan(
              //             text: 'Signup',
              //             style: TextStyle(
              //                 color: Color(0xffEE7B23)
              //             ),
              //           ),
              //         ]
              //     ),
              //   ),
              // ),


            ],
          ),
        ),
      ),
    );
  }

  @override
  void onAdminLoginError(ImageRecoError error) {
    setState(() {
      errorLogin=true;
    });

  }

  @override
  void onAdminLoginSuccess(AdminLoginList data) {
    setState(() {
      errorLogin=false;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return MyHomePage();
      }));

    });
  }
}
