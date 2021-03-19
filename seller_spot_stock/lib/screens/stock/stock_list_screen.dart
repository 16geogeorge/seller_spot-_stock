//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:seller_spot_stock/api/seller_sopt_error.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_ById.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_fetchall.dart';
import 'package:seller_spot_stock/screens/stock/stock_list_screen_presenter.dart';



import 'package:seller_spot_stock/api/seller_sopt_error.dart';
import 'package:seller_spot_stock/screens/stockcategory/stockhome2.dart';



class StockProductList extends StatefulWidget {
  @override
  StockProductListState createState() {
    return StockProductListState();
  }
}

class StockProductListState extends State<StockProductList> implements GetAllStockFetchPresenterContract {
  GetAllStockFetchPresenter _presenter;
  StockProductListState(){
    _presenter = new GetAllStockFetchPresenter(this);
  }
  List<StockFetchAll> allStockProductList = new List();

  List<StockFetchById> stockList = new List();

  @override
  void initState() {
    // TODO: implement initState
    _presenter.getStockProductListFromServer();
  }
  final List<int> colorCodes = <int>[600, 500, 100,600, 500, 100,600, 500, 100,600, 500, 100,600, 500, 100,600, 500, 100,600, 500, 100,600, 500, 100,600, 500, 100,600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,

        home: Scaffold(
            drawer: NavDrawer3(),
            appBar: AppBar(
              backgroundColor: Colors.red,
              // leading: IconButton(
              //   icon: Icon(Icons.arrow_back, color: Colors.white),
              //   onPressed: () => Navigator.of(context).pop(),
              // ),
              title: Text('Stock List'),
            ),
            body:allStockProductList.isNotEmpty?


            ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: (allStockProductList[0].stockData.length),
                itemBuilder: (BuildContext context, int index) {
                  return
                    Container(
                      child:
                      InkWell(
                        onTap: () {
                          print("clicked");
                          // model.selectProduct(product.productID);
                          // Navigator.pushNamed<bool>(
                          //     context, '/product/' + model.getSelectedProduct.productID)
                          //     .then((_) => model.selectProduct(null));

                          _presenter.getStockProductByIdFromServer(allStockProductList[0].stockData[index].stockId);
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Card(
                                // height: 50,
                                  color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(children: [
                                      // CachedNetworkImage(
                                      //   imageUrl: "j",
                                      //   placeholder: (context, url) => CircularProgressIndicator(),
                                      //   errorWidget: (context, url, error) => Icon(Icons.info),
                                      // )
                                      //Image(image: AssetImage("asset/images/error.JPG")),

                                      Text('${allStockProductList[0].stockData[index].inventoryProductId.inventoryProductName}',style: new TextStyle(color: Colors.black, fontSize: 24.0), ),
                                      Text('${allStockProductList[0].stockData[index].stockProductQuantity}',style: new TextStyle(color: Colors.black, fontSize: 24.0)),
                                      Text('${allStockProductList[0].stockData[index].expiryDate}',style: new TextStyle(color: Colors.black, fontSize: 24.0)),
                                      Text('${allStockProductList[0].stockData[index].stockTotalAmount}',style: new TextStyle(color: Colors.black, fontSize: 24.0)),

                                      //Text('Holyday Name :      ${allProductList[0].productInformationData[index].inventoryProductId.inventoryProductHolidayId.holidayId}')
                                    ],),
                                  )
                              ),
                            ),


                          ],
                        ),
                      ),
                    );
                }
            )
                :
            Center(child: CircularProgressIndicator())
        )
    );
  }

  @override
  void onProductListError(ImageRecoError error) {
    // TODO: implement onProductListError
  }

  @override
  void onProductListSuccess(StockFetchList data) {
    allStockProductList.clear();

    setState(() {
      allStockProductList.addAll(data.stockFetchList);
      print(allStockProductList.toString());

    });
  }

  @override
  void onProductError(ImageRecoError error) {
    // TODO: implement onProductError
  }

  @override
  void onProductSuccess(StockFetchByIdList data) {

    // stockList.clear();
    //
    // setState(() {
    //   stockList.addAll(data.stockFetchByIdList);
    //   Navigator.push(context, MaterialPageRoute(builder: (context) {
    //     return SingleStock(productInformationId:productList[0].productInformationId,productName:productList[0].productName,productMrp: productList[0].productSellerMrp,brand: productList[0].promotionBrandId.brandName,productCategory: productList[0].inventoryProductId.inventoryProductCategoryId.inventoryProductCategoryName,productColor: productList[0].inventoryProductId.inventoryProductColor,);
    //   }));
    //
    // });
  }
}