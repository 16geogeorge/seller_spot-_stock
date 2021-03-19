import "package:flutter/material.dart";
import "package:seller_spot_stock/screens/stockcategory/stockhome2.dart";

class Outdatedstock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer3(),
      appBar: AppBar(
        title: Text('outdated Stock Details'),
      ),
      body: Center(
        child: Text('outdated stock details'),
      ),


    );
  }
}