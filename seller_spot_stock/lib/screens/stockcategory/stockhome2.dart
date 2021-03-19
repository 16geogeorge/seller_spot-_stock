import 'package:flutter/material.dart';
import 'package:seller_spot_stock/main.dart';

import 'package:flutter/material.dart';

class NavDrawer3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Seller Spot',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/stock.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.update),
            title: Text('Update '),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete'),
            onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage()))},
          ),

          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text('Home'),
            onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage()))},
          ),
        ],
      ),
    );
  }
}