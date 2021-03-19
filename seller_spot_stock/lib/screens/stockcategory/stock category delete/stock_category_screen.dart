import 'package:flutter/material.dart';
import 'package:seller_spot_stock/api/seller_sopt_error.dart';

import 'package:seller_spot_stock/dao/slr_spt_stock_category_by_id.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_by_id.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_fetch.dart';
import 'package:seller_spot_stock/screens/stockcategory/stock%20category%20delete/delete_stock_category_screen.dart';


import 'package:seller_spot_stock/screens/stockcategory/stock%20category%20delete/stock_category_screen_presenter.dart';


class DeleteStockCategory extends StatefulWidget {
  @override
  DeleteStockCategoryState createState() {
    return DeleteStockCategoryState();
  }
}

class DeleteStockCategoryState extends State<DeleteStockCategory> implements GetDeleteStockCategoryFetchPresenterContract {

  List<StockCategoryFetch> stockCategoryFetchList = new List();
  List<StockCategoryById> stockCategoryByIdList = new List();
  List stockCategoryDetailsList=new List();

  TextEditingController stockcategoryid = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController categorydiscription = TextEditingController();

  String _selectedstockcategoryId;
  String _selectedCategoryName;
  String _selectedCategoryDescription;

  GetDeleteStockCategoryFetchPresenter _presenter;
  DeleteStockCategoryState(){
    _presenter = new GetDeleteStockCategoryFetchPresenter(this);
  }

  @override
  void initState() {
    // TODO: implement initState
    _presenter.getStockCategoryFetchListFromServer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('stock List'),
        ),
        body: stockCategoryFetchList.isNotEmpty?
        Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Stock Category"),
            ),
            Container(
              width: 600,
              padding: EdgeInsets.all(10.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<dynamic>(
                  items: stockCategoryFetchList[0].stockCategoryData.map((dynamic val) {
                    return DropdownMenuItem<dynamic>(
                      value: val,
                      child: Row(
                        children: <Widget>[
                          Text(val.category.toString()),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (dynamic val) {
                    setState(() {
                      this._selectedstockcategoryId = val.stockcategoryid.toString();
                      this._selectedCategoryName= val.category.toString();
                      this._selectedCategoryDescription= val.categorydiscription.toString();

                      print(_selectedstockcategoryId+" "+_selectedCategoryName+" "+_selectedCategoryDescription);
                    });
                  },               hint: Row(
                  children: <Widget>[

                    Text(null!=_selectedCategoryName?_selectedCategoryName:""),
                  ],
                ),


                ),
              ),
            ),

            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  child: Text('Search Category '),
                  onPressed: () {
                    stockcategoryid.text =_selectedstockcategoryId;
                    category.text =_selectedCategoryName;
                    categorydiscription.text =_selectedCategoryDescription;

                    // print(keywordCategoryDescription.text+keywordCategoryName.text+keywordCategoryId.text);
                    _presenter.getDeleteStockCategoryByIdListFromServer(stockcategoryid.text);
                  },
                )),


          ],
        )

            :
        Center(child: CircularProgressIndicator())
    );
  }

  @override
  void onDeleteStockCategoryByIdError(ImageRecoError error) {
    // TODO: implement onDeleteStockCategoryByIdError
  }

  @override
  void onDeleteStockCategoryByIdSuccess(StockCategoryByIdList data) {
    // TODO: implement onDeleteStockCategoryByIdSuccess

    //print("category deleted sucessfully");
    stockCategoryByIdList.clear();

    setState(() {
      stockCategoryByIdList.addAll(data.stockCategoryByIdList);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return DeletedStockCategory(stockcategoryid:stockCategoryByIdList[0].stockcategoryid,category:stockCategoryByIdList[0].category, categorydiscription:stockCategoryByIdList[0].categorydiscription);
      }));

    });
  }

  @override
  void onDeleteStockCategoryError(ImageRecoError error) {
    // TODO: implement onDeleteStockCategoryError
  }

  @override
  void onDeleteStockCategorySuccess(StockCategoryFetchList data
      ) {

    print("successfully collected stock CategoryList details");
    stockCategoryFetchList.clear();
    setState(() {
      stockCategoryFetchList.addAll(data.stockCategoryFetchList);

    });
    print(stockCategoryFetchList[0].stockCategoryData.toString());
    // TODO: implement onDeleteStockCategorySuccess


  }










}
