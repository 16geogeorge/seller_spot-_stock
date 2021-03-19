

import 'package:seller_spot_stock/api/rest_api_source.dart';
import 'package:seller_spot_stock/api/seller_sopt_error.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_by_id.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_fetch.dart';

abstract class DeletedStockCategoryPresenterContract {
  void onDeleteStockCategorySuccess(StockCategoryByIdList data);

  void onDeleteStockCategoryError(ImageRecoError error);


}

class   DeletedStockCategoryPresenter {
  DeletedStockCategoryPresenterContract _view;
  RestDataSource api = new RestDataSource();

  DeletedStockCategoryPresenter(this._view);

  Future<StockCategoryByIdList> deleteStockCategoryByIdFromServer(
      stockcategoryid)
  {
    Future<StockCategoryByIdList> response = api.deleteStockCategoryList(
        stockcategoryid);
    response.then((StockCategoryByIdList data) {
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
}