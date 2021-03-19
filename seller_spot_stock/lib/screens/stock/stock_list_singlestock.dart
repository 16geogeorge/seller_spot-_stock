// import 'package:flutter/material.dart';
//
//
// class SingleStock extends StatefulWidget{
//   final String productInformationId;
//   final String productName;
//   final String productMrp;
//   final String brand;
//   final String productCategory;
//   final String productColor;
//   const SingleProduct({Key key, this.productInformationId, this.productName,this.productMrp,this.brand,this.productCategory,this.productColor,}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return new SingleProductState();
//   }
//
// }
// class SingleProductState extends State<SingleProduct> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // debugShowCheckedModeBanner: false,
//
//         home: Scaffold(
//           appBar: AppBar(
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back, color: Colors.white),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             title: Text('Product Information'),
//           ),
//           body: Column(
//             children: [
//               // Text(widget.productInformationId),
//               // Text(widget.productName),
//
//
//               Center(
//                   child:Column(
//                     children: [
//                       SizedBox(
//                         height: 90,
//                       ),
//                       Card(
//                         // height: 50,
//                         color: Colors.grey,
//
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(children: [
//                             // CachedNetworkImage(
//                             //   imageUrl: "j",
//                             //   placeholder: (context, url) => CircularProgressIndicator(),
//                             //   errorWidget: (context, url, error) => Icon(Icons.info),
//                             // )
//                             //Image(image: AssetImage("asset/images/network_error.webp"))
//
//                             Text('Product Id:  ${widget.productInformationId}',style: new TextStyle(color: Colors.white, fontSize: 20.0), ),
//                             Text('Product Name: ${widget.productName}',style: new TextStyle(color: Colors.white, fontSize: 20.0)),
//                             SizedBox(
//                               height: 10,
//                               width: 10,
//                             ),
//                             Image(image: AssetImage("asset/images/network_error.webp")),
//                             Text('Product Mrp: ${widget.productMrp}',style: new TextStyle(color: Colors.white, fontSize: 20.0)),
//                             Text('Product Brand: ${widget.brand}',style: new TextStyle(color: Colors.white, fontSize: 20.0)),
//                             Text('Product Catergory: ${widget.productCategory}',style: new TextStyle(color: Colors.white, fontSize: 20.0)),
//                             Text('Product Color: ${widget.productColor}',style: new TextStyle(color: Colors.white, fontSize: 20.0)),
//                             //Text('Holyday Name :      ${allProductList[0].productInformationData[index].inventoryProductId.inventoryProductHolidayId.holidayId}')
//                           ],),
//                         ),
//                       ),
//                     ],
//                   )
//
//               )
//             ],
//           ),
//         )
//     );
//   }
//
//
// }