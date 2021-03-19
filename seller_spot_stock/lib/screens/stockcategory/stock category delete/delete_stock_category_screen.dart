import 'package:flutter/material.dart';
import 'package:seller_spot_stock/api/seller_sopt_error.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_by_id.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_fetch.dart';
import 'package:seller_spot_stock/screens/stockcategory/stock%20category%20%20put/update_stock_category_screen_presenter.dart';

import '../stockcategoryhome.dart';
import 'delete_stock_category_screen_presenter.dart';




class DeletedStockCategory extends StatefulWidget{
  final String stockcategoryid;
  final String category;
  final String categorydiscription;
  const DeletedStockCategory({Key key, this.stockcategoryid, this.category, this.categorydiscription,}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new DeletedStockCategoryState();
  }

}
class DeletedStockCategoryState extends State<DeletedStockCategory> implements DeletedStockCategoryPresenterContract
{
  DeletedStockCategoryPresenter _presenter;
  DeletedStockCategoryState(){
    _presenter = new DeletedStockCategoryPresenter(this);
  }
  TextEditingController stockcategoryid = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController categorydiscription = TextEditingController();

  String _selectedstockcategoryid;
  String _selectedcategory;
  String _selectedcategorydiscription;

  @override
  void initState() {
    // TODO: implement initState
    stockcategoryid.text=widget.stockcategoryid;
    category.text=widget.category;
    categorydiscription.text=widget.categorydiscription;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,

        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('delete StockCategory'),
          ),
          body: Column(
            children: [   Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                //   obscureText: true,
                controller: stockcategoryid,
                enabled: false,
                decoration: InputDecoration(

                  border: OutlineInputBorder(),
                  labelText: 'stock Category Id',
                ),
              ),
            ),   Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: category,
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'stock Category Name ',
                ),
              ),
            ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  //   obscureText: true,
                  controller: categorydiscription,
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'stock Category Description',
                  ),
                ),
              ),
              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.red,
                    child: Text('Delete Category '),
                    onPressed: () {
                      stockcategoryid.text =_selectedstockcategoryid;
                      category.text =_selectedcategory;
                      categorydiscription.text =_selectedcategorydiscription;

                      // print(keywordCategoryDescription.text+keywordCategoryName.text+keywordCategoryId.text);
                      _presenter.deleteStockCategoryByIdFromServer(stockcategoryid.text);
                    },
                  )),
            ],
          ),
        ));

  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => Stockcategoryhome()),);
      },);


    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("SUCCESS"),
      content: Text(" Category Deleted."),
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
  void onDeleteStockCategorySuccess(StockCategoryByIdList data) {
    // TODO: implement onDeleteStockCategorySuccess
    showAlertDialog(context);
  }

  @override
  void onDeleteStockCategoryError(ImageRecoError error) {
    // TODO: implement onUpdateStockCategoryError
  }



}