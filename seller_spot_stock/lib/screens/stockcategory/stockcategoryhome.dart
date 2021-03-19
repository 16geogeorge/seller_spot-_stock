import "package:flutter/material.dart";
import "package:seller_spot_stock/screens/stockcategory/stockcategoryhome2.dart";

class Stockcategoryhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer2(),
      appBar: AppBar(
        title: Text('Stock category'),
      ),
      body: Center(
        child: Text('category list'),
        ),


    );
  }
}