

import 'package:seller_spot_stock/api/rest_api_source.dart';
import 'package:seller_spot_stock/api/seller_sopt_error.dart';
import 'package:seller_spot_stock/dao/slr_spt_stockcategory_add.dart';

abstract class PostStockCategorynewPresenterContract {
  void onStockCategorynewPostSuccess(StockCategoryPostList data);

  void onStockCategorynewPostError(ImageRecoError error);
}
class PostStockCategorynewPresenter {
  PostStockCategorynewPresenterContract _view;
  RestDataSource api = new RestDataSource();

  PostStockCategorynewPresenter(this._view);

  Future<StockCategoryPostList> postStockCategoryNewToServer(stockcategoryid,category,categorydiscription) {
    Future<StockCategoryPostList> response = api.postStockCategoryNewToServerApi(
        stockcategoryid, category,categorydiscription);
    response.then((StockCategoryPostList data) {
      print("Fetch stock success ::: ");

      _view.onStockCategorynewPostSuccess(data);
    }).catchError((Object error) {
      print("Fetch stock failed ::: " + error.toString());
      if (error is ImageRecoError) {
        _view.onStockCategorynewPostError(error);
      } else {
        _view.onStockCategorynewPostError(ImageRecoError.serverError);
      }
    });
    return response;
  }
}