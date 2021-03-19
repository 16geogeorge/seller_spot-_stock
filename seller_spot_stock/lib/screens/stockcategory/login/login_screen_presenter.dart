


import 'package:seller_spot_stock/api/rest_api_source.dart';
import 'package:seller_spot_stock/api/seller_sopt_error.dart';
import 'package:seller_spot_stock/dao/slr_spt_admin.dart';

abstract class AdminLoginPresenterContract {
  void onAdminLoginSuccess(AdminLoginList data);

  void onAdminLoginError(ImageRecoError error);


}
class   AdminLoginPresenter {
  AdminLoginPresenterContract _view;
  RestDataSource api = new RestDataSource();

  AdminLoginPresenter(this._view);

  Future<AdminLoginList> getAdminLoginFromServer(usernameAdmin,passwordAdmin) {
    Future<AdminLoginList> response = api.getAdminLoginData(usernameAdmin,passwordAdmin);
    response.then((AdminLoginList data) {
      print(" get login success ::: ");

      _view.onAdminLoginSuccess(data);
    }).catchError((Object error) {
      print(" login failed ::: " + error.toString());
      if (error is ImageRecoError) {
        _view.onAdminLoginError(error);
      } else {
        _view.onAdminLoginError(ImageRecoError.serverError);
      }
    });
    return response;
  }
}