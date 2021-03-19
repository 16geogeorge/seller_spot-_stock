import 'dart:ui';

import "package:flutter/material.dart";

class Aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavDrawer(),
      //drawer:NavDrawer(),
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [

          Positioned.fill(child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
            ),
            child: Image(
              image: AssetImage("assets/images/godown.jpg"),
              //image:NetworkImage('https://media.giphy.com/media/kG3EDN0eXqq4V1Pd6W/source.gif'),
              fit: BoxFit.fill,
            ),
          ),)
          ,
          Positioned.fill(left: 20,right: 10,top: 0,
            child:Center(child:Text(
              '  Sellerspot microservice'
                  ' is an e-commerce platform that lets sellers create an online store and manage all e-commerce functions. It has a different range of subscriptions to step up a business platform. This project works based on microservice architecture. Microservices take a complex monolithic application and turn it into a set of services, which are faster to develop, and much easier to understand and maintain. Each of these services can also be developed independently by a team that is focused on that service. It also allows for continuous deployment, because each microservice can be deployed independently. The microservices work together, communicating through web APIs or messaging queues to respond to incoming events.  ',
              style: TextStyle(
                backgroundColor: Colors.black12,
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
                color: Colors.black,

              ),
            ),),
            // child: ImageFiltered(
            //   imageFilter: ImageFilter.blur(
            //     sigmaX: 10.0,
            //     sigmaY: 10.0,
            //   ),
            //   child: Image(
            //     image: AssetImage("assets/images/godown.jpg"),
            //     //image:NetworkImage('https://media.giphy.com/media/kG3EDN0eXqq4V1Pd6W/source.gif'),
            //     fit: BoxFit.fill,
            //   ),
            // ),
          ),







          // Positioned(
          //   top: 320,
          //   left: 60,
          //   child: Column(
          //     children: [Center(child:Text(
          //       '  Sellerspot microservice is an e-commerce platform that lets sellers create an online store and manage all e-commerce functions. It has a different range of subscriptions to step up a business platform. This project works based on microservice architecture. Microservices take a complex monolithic application and turn it into a set of services, which are faster to develop, and much easier to understand and maintain. Each of these services can also be developed independently by a team that is focused on that service. It also allows for continuous deployment, because each microservice can be deployed independently. The microservices work together, communicating through web APIs or messaging queues to respond to incoming events.  ',
          //       style: TextStyle(
          //         backgroundColor: Colors.black12,
          //         fontSize: 35.0,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white,
          //
          //       ),
          //     ),),
          //
          //       SizedBox(
          //         height: 8,
          //       ),
          //       Text(
          //         '  STOCK MANAGER   ',
          //         style: TextStyle(
          //           backgroundColor: Colors.black12,
          //           fontSize: 15.0,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}