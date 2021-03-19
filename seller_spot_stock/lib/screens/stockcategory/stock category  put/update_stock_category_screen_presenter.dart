

import 'package:seller_spot_stock/api/rest_api_source.dart';
import 'package:seller_spot_stock/api/seller_sopt_error.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_by_id.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_fetch.dart';

abstract class UpdateStockCategoryPresenterContract {
  void onUpdateStockCategorySuccess(StockCategoryFetch data);

  void onUpdateStockCategoryError(ImageRecoError error);


}

class   UpdateStockCategoryPresenter {
  UpdateStockCategoryPresenterContract _view;
  RestDataSource api = new RestDataSource();

  UpdateStockCategoryPresenter(this._view);

  Future<StockCategoryFetch> putStockCategoryListFromServer(
      stockcategoryid,
      category,categorydiscription) {
    Future<StockCategoryFetch> response = api.putStockCategoryList(
        stockcategoryid,
        category,categorydiscription);
    response.then((StockCategoryFetch data) {
      print(" get keyword Category success ::: ");

      _view.onUpdateStockCategorySuccess(data);
    }).catchError((Object error) {
      print(" get keyword Category failed ::: " + error.toString());
      if (error is ImageRecoError) {
        _view.onUpdateStockCategoryError(error);
      } else {
        _view.onUpdateStockCategoryError(ImageRecoError.serverError);
      }
    });
    return response;
  }
}