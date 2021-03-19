

import 'package:seller_spot_stock/api/rest_api_source.dart';
import 'package:seller_spot_stock/api/seller_sopt_error.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_by_id.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_fetch.dart';

abstract class GetDeleteStockCategoryFetchPresenterContract {
  void onDeleteStockCategorySuccess(StockCategoryFetchList data);

  void onDeleteStockCategoryError(ImageRecoError error);

  void onDeleteStockCategoryByIdSuccess(StockCategoryByIdList data);

  void onDeleteStockCategoryByIdError(ImageRecoError error);

}

class   GetDeleteStockCategoryFetchPresenter {
  GetDeleteStockCategoryFetchPresenterContract _view;
  RestDataSource api = new RestDataSource();

  GetDeleteStockCategoryFetchPresenter(this._view);

  Future<StockCategoryFetchList> getStockCategoryFetchListFromServer() {
    Future<StockCategoryFetchList> response = api.getStockCategoryFetchList();
    response.then((StockCategoryFetchList data) {
      print(" get stock Category success ::: ");

      _view.onDeleteStockCategorySuccess(data);
    }).catchError((Object error) {
      print(" get stock Category failed ::: " + error.toString());
      if (error is ImageRecoError) {
        _view.onDeleteStockCategoryError(error);
      } else {
        _view.onDeleteStockCategoryError(ImageRecoError.serverError);
      }
    });
    return response;
  }

  Future<StockCategoryByIdList> getDeleteStockCategoryByIdListFromServer(String stockcategoryid) {
    Future<StockCategoryByIdList> response = api.getStockCategoryByIdList(stockcategoryid
    );
    response.then((StockCategoryByIdList data) {
      print(" get stock Category delete success ::: ");

      _view.onDeleteStockCategoryByIdSuccess(data);
    }).catchError((Object error) {
      print(" get stock Category failed ::: " + error.toString());
      if (error is ImageRecoError) {
        _view.onDeleteStockCategoryByIdError(error);
      } else {
        _view.onDeleteStockCategoryByIdError(ImageRecoError.serverError);
      }
    });
    return response;
  }
}