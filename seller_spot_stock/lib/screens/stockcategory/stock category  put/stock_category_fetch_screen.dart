import 'package:flutter/material.dart';
import 'package:seller_spot_stock/api/seller_sopt_error.dart';

import 'package:seller_spot_stock/dao/slr_spt_stock_category_by_id.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_by_id.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_fetch.dart';
import 'package:seller_spot_stock/screens/stockcategory/stock%20category%20%20put/stock_category_fetch_screen_presenter.dart';
import 'package:seller_spot_stock/screens/stockcategory/stock%20category%20%20put/update_stock_category_screen.dart';


class SingleStockCategory extends StatefulWidget {
  @override
  SingleStockCategoryState createState() {
    return SingleStockCategoryState();
  }
}

class SingleStockCategoryState extends State<SingleStockCategory> implements GetStockCategoryFetchPresenterContract {

  List<StockCategoryFetch> stockCategoryFetchList = new List();
  List<StockCategoryById> stockCategoryByIdList = new List();
  List stockCategoryDetailsList=new List();

  TextEditingController stockcategoryid = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController categorydiscription = TextEditingController();

  String _selectedstockcategoryId;
  String _selectedCategoryName;
  String _selectedCategoryDescription;

  GetStockCategoryFetchPresenter _presenter;
  SingleStockCategoryState(){
    _presenter = new GetStockCategoryFetchPresenter(this);
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

                    //print(stockcategoryid.text+category.text+categorydiscription.text);
                    _presenter.getStockCategoryByIdListFromServer(stockcategoryid.text);
                  },
                )),


          ],
        )

            :
        Center(child: CircularProgressIndicator())
    );
  }

  @override
  void onStockCategoryByIdError(ImageRecoError error) {
    // TODO: implement onStockCategoryByIdError
  }

  @override
  void onStockCategoryByIdSuccess(StockCategoryByIdList data) {
    // TODO: implement onStockCategoryByIdSuccess
    stockCategoryByIdList.clear();

    setState(() {
      stockCategoryByIdList.addAll(data.stockCategoryByIdList);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return UpdateStockCategory(stockcategoryid:stockCategoryByIdList[0].stockcategoryid,category:stockCategoryByIdList[0].category, categorydiscription:stockCategoryByIdList[0].categorydiscription);
      }));

    });

  }

  @override
  void onStockCategoryError(ImageRecoError error) {
    // TODO: implement onStockCategoryError
  }

  @override
  void onStockCategorySuccess(StockCategoryFetchList data) {
    // TODO: implement onStockCategorySuccess
    print("successfully collected keyword CategoryList details");
    stockCategoryFetchList.clear();
    setState(() {
      stockCategoryFetchList.addAll(data.stockCategoryFetchList);

    });
    print(stockCategoryFetchList[0].stockCategoryData.toString());
  }






}
