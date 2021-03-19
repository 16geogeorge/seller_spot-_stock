import 'dart:ui';

import "package:flutter/material.dart";
import 'package:seller_spot_stock/screens/stockcategory/login/login_screen.dart';
import 'home.dart';
import 'screens/keyword/keyword_create_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red), home: LoginScreen());
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: NavDrawer(),
//       appBar: AppBar(
//         title: Text('Seller Spot Stock'),
//       ),
//       body:
//     Positioned(
//         top: 320,
//         left: 60,
//         child: Column(
//             children: [Center(child:Text('  SELLERSPOT  '),
//             style: TextStyle(
//             backgroundColor: Colors.black12,
//             fontSize: 35.0,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//
//     ),
//     ),
//     ),
//                   //image: AssetImage('assets/images/godown.jpg'))),
//
//
//       ),
//     ),
//     ),
//     );
//   }
// }


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavDrawer(),
      drawer:NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(''),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 10.0,
                sigmaY: 10.0,
              ),
              child: Image(
                image: AssetImage("assets/images/godown.jpg"),
                //image:NetworkImage('https://media.giphy.com/media/kG3EDN0eXqq4V1Pd6W/source.gif'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 320,
            left: 60,
            child: Column(
              children: [Center(child:Text(
                '  SELLERSPOT  ',
                style: TextStyle(
                  backgroundColor: Colors.black12,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,

                ),
              ),),

                SizedBox(
                  height: 8,
                ),
                Text(
                  '  STOCK MANAGER   ',
                  style: TextStyle(
                    backgroundColor: Colors.black12,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}