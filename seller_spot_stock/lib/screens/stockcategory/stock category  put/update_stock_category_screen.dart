import 'package:flutter/material.dart';
import 'package:seller_spot_stock/api/seller_sopt_error.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_fetch.dart';
import 'package:seller_spot_stock/screens/stockcategory/stock%20category%20%20put/stock_category_fetch_screen.dart';
import 'package:seller_spot_stock/screens/stockcategory/stock%20category%20%20put/update_stock_category_screen_presenter.dart';




class UpdateStockCategory extends StatefulWidget{
  final String stockcategoryid;
  final String category;
  final String categorydiscription;
  const UpdateStockCategory({Key key, this.stockcategoryid, this.category, this.categorydiscription,}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new UpdateStockCategoryState();
  }

}
class UpdateStockCategoryState extends State<UpdateStockCategory> implements UpdateStockCategoryPresenterContract
{
  UpdateStockCategoryPresenter _presenter;
  UpdateStockCategoryState(){
    _presenter = new UpdateStockCategoryPresenter(this);
  }
  TextEditingController stockcategoryid = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController categorydiscription = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    stockcategoryid.text=widget.stockcategoryid;
    category.text=widget.category;
    categorydiscription.text=widget.categorydiscription;
    //_presenter = new UpdateStockCategoryPresenter(this);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('Update stockCategory'),
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
                    child: Text('Update Keyword Category'),
                    onPressed: () {

                      _presenter.putStockCategoryListFromServer(stockcategoryid.text,
                          category.text,categorydiscription.text);
                    },
                  )),
            ],
          ),
        );

  }



  @override
  void onUpdateStockCategoryError(ImageRecoError error) {
    // TODO: implement onUpdateStockCategoryError
    errshowAlertDialog(context);

  }

  @override
  void onUpdateStockCategorySuccess(StockCategoryFetch data) {
    // TODO: implement onUpdateStockCategorySuccess
    showAlertDialog(context);
  }


}
showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SingleStockCategory();
      }));



    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("SUCCESS"),
    content: Text(" Category updated."),
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


errshowAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);

    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text(" Category not updated."),
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