

import 'package:seller_spot_stock/api/rest_api_source.dart';
import 'package:seller_spot_stock/api/seller_sopt_error.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_by_id.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_fetchall.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_ById.dart';


abstract class GetAllStockFetchPresenterContract {
  void onProductListSuccess(StockFetchList data);

  void onProductListError(ImageRecoError error);

  void onProductSuccess(StockFetchByIdList data);

  void onProductError(ImageRecoError error);

}

class   GetAllStockFetchPresenter {
  GetAllStockFetchPresenterContract _view;
  RestDataSource api = new RestDataSource();

  GetAllStockFetchPresenter(this._view);

  Future<StockFetchList> getStockProductListFromServer() {
    Future<StockFetchList> response = api.getStockProductFetchList(
    );
    response.then((StockFetchList data) {
      print(" get Stock Product List success ::: ");

      _view.onProductListSuccess(data);
    }).catchError((Object error) {
      print(" get Stock Product List failed ::: " + error.toString());
      if (error is ImageRecoError) {
        _view.onProductListError(error);
      } else {
        _view.onProductListError(ImageRecoError.serverError);
      }
    });
    return response;
  }

  Future<StockFetchByIdList> getStockProductByIdFromServer(String stockId) {
    Future<StockFetchByIdList> response = api.getstockProductById(stockId
    );
    response.then((StockFetchByIdList data) {
      print(" get stock List success ::: ");

      _view.onProductSuccess(data);
    }).catchError((Object error) {
      print(" get stock List failed ::: " + error.toString());
      if (error is ImageRecoError) {
        _view.onProductError(error);
      } else {
        _view.onProductError(ImageRecoError.serverError);
      }
    });
    return response;
  }
}