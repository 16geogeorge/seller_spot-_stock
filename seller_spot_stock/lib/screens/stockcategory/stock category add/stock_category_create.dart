import 'dart:math';

import 'package:flutter/material.dart';
import 'package:seller_spot_stock/api/seller_sopt_error.dart';
import 'package:seller_spot_stock/dao/slr_spt_stockcategory_add.dart';
import 'package:seller_spot_stock/screens/stockcategory/stock%20category%20add/stock_category_screen_presenter.dart';
const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));


class StockCategoryPostScreen extends StatefulWidget {
  @override
  StockCategoryPostScreenState createState() {
    return StockCategoryPostScreenState();
  }
}


class StockCategoryPostScreenState extends State<StockCategoryPostScreen> implements PostStockCategorynewPresenterContract {
  PostStockCategorynewPresenter _presenter;
  StockCategoryPostScreenState(){
    _presenter = new PostStockCategorynewPresenter(this);
  }
  /// create TextEditingController for sending data ////
  TextEditingController stockcategoryid = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController categorydiscription = TextEditingController();

  /// end  TextEditingController for sending data ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Add Stock Category'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Seller Spot',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                // Container(
                //   padding: EdgeInsets.all(10),
                //   child: TextField(
                //     controller: stockcategoryid,
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: 'Stock Category Id',
                //     ),
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    //   obscureText: true,
                    controller: category,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Stock Category Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: categorydiscription,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Stock Category Description',
                    ),
                  ),
                ),



                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.red,
                      child: Text('Create New Category'),
                      onPressed: () {
                        //print(stockcategoryid.text+category.text+categorydiscription.text);
                        String stcid="slrspt_category_";

                        stcid=stcid+getRandomString(5);
                        _presenter.postStockCategoryNewToServer(stcid,category.text,categorydiscription.text);

                      },
                    )),


              ],
            )));
  }



  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {  Navigator.pop(context);
      stockcategoryid.text="";
      category.text="";
      categorydiscription.text="";
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("SUCCESS"),
      content: Text(" Category Added."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void onStockCategorynewPostError(ImageRecoError error) {
    // TODO: implement onStockCategorynewPostError
  }

  @override
  void onStockCategorynewPostSuccess(StockCategoryPostList data) {
    // TODO: implement onStockCategorynewPostSuccess
    showAlertDialog(context);
  }

}