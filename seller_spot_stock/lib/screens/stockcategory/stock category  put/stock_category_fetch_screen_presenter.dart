

import 'package:seller_spot_stock/api/rest_api_source.dart';
import 'package:seller_spot_stock/api/seller_sopt_error.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_by_id.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_fetch.dart';

abstract class GetStockCategoryFetchPresenterContract {
  void onStockCategorySuccess(StockCategoryFetchList data);

  void onStockCategoryError(ImageRecoError error);

  void onStockCategoryByIdSuccess(StockCategoryByIdList data);

  void onStockCategoryByIdError(ImageRecoError error);

}

class   GetStockCategoryFetchPresenter {
  GetStockCategoryFetchPresenterContract _view;
  RestDataSource api = new RestDataSource();

  GetStockCategoryFetchPresenter(this._view);

  Future<StockCategoryFetchList> getStockCategoryFetchListFromServer() {
    Future<StockCategoryFetchList> response = api.getStockCategoryFetchList();
    response.then((StockCategoryFetchList data) {
      print(" get stock Category success ::: ");

      _view.onStockCategorySuccess(data);
    }).catchError((Object error) {
      print(" get stock Category failed ::: " + error.toString());
      if (error is ImageRecoError) {
        _view.onStockCategoryError(error);
      } else {
        _view.onStockCategoryError(ImageRecoError.serverError);
      }
    });
    return response;
  }

  Future<StockCategoryByIdList> getStockCategoryByIdListFromServer(String stockcategoryid) {
    Future<StockCategoryByIdList> response = api.getStockCategoryByIdList(stockcategoryid
    );
    response.then((StockCategoryByIdList data) {
      print(" get stock Category success ::: ");

      _view.onStockCategoryByIdSuccess(data);
    }).catchError((Object error) {
      print(" get stock Category failed ::: " + error.toString());
      if (error is ImageRecoError) {
        _view.onStockCategoryByIdError(error);
      } else {
        _view.onStockCategoryByIdError(ImageRecoError.serverError);
      }
    });
    return response;
  }
}