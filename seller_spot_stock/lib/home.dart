import 'package:flutter/material.dart';
import 'package:seller_spot_stock/screens/stock/stock_list_screen.dart';
import 'package:seller_spot_stock/screens/stockcategory/aboutus.dart';
import 'package:seller_spot_stock/screens/stockcategory/login/login_screen.dart';
import 'package:seller_spot_stock/screens/stockcategory/stockcategoryhome.dart';
import 'package:seller_spot_stock/screens/stockcategory/outdatedstock.dart';

import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
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
            leading: Icon(Icons.category),
            title: Text('Categories'),
            onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Stockcategoryhome()))},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('stock'),
            onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StockProductList()))},
          ),
          ListTile(
            leading: Icon(Icons.warning_amber_sharp),
            title: Text('outdated stock'),
            onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Outdatedstock()))},
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('About us'),
            onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Aboutus()))},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()))},
          ),
        ],
      ),
    );
  }
}