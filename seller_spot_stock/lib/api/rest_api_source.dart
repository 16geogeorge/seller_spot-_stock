
import 'dart:convert';

import 'package:seller_spot_stock/api/seller_sopt_error.dart';
import 'package:seller_spot_stock/dao/slr_spt_admin.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_ById.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_by_id.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_category_fetch.dart';
import 'package:seller_spot_stock/dao/slr_spt_stock_fetchall.dart';
import 'package:seller_spot_stock/dao/slr_spt_stockcategory_add.dart';
import 'package:seller_spot_stock/util/network_util.dart';


class RestDataSource {
  NetworkUtil _networkUtil = new NetworkUtil();
  static final BASE_URL = "https://1f7d0b544cd2.ngrok.io/";
  static final String LOGIN_URL = BASE_URL + "login";


  Future<StockCategoryByIdList> getStockCategoryByIdList(
      String stockcategoryid) {
    // var request = http.Request('GET', Uri.parse('http://localhost:9009/promotion/152'));

    Future<ParsedResponse> future = _networkUtil.get(
        BASE_URL+'stockcategory/' + stockcategoryid);

    return future.then((ParsedResponse res) async {
      print("Get server msg about stock Category for " + stockcategoryid +
          " :: ****" +
          res.response.toString());
      if (res.isOk()) {
        StockCategoryByIdList dataList = new StockCategoryByIdList();
        print("success get stock Category By Id");
        print(res.response.toString());
        dataList.parseFromServerResponse(jsonDecode(res.response));
        return dataList;
      } else if (res.statusCode == 401) {
        print("failed  get stock Category");
        print(res.response.toString());
      } else {
        throw ImageRecoError.serverError;
      }
    }).catchError((Object e) {
      throw e;
    });
  }


  Future<StockCategoryFetch> putStockCategoryList(stockcategoryid,category,categorydiscription) {
    Map<String, dynamic> params = Map();
    params["Stockcategoryid"] = stockcategoryid;
    params["Category"] = category;
    params["StockCategorydiscription"] = categorydiscription;

    var headers = {
      'Content-Type': 'application/json'
    };
    Future<ParsedResponse> future = _networkUtil.put(
        BASE_URL+'stockcategory/update/' +stockcategoryid,
        body: jsonEncode(params), headers: headers);

    return future.then((ParsedResponse res) async {
      print("Get server msg about keywords storage :: ****" +
          res.response.toString());
      if (res.isOk()) {
        StockCategoryFetch dataList = new StockCategoryFetch();
        print("success updated into server successfully");
        print(res.response.toString());
      } else if (res.statusCode == 401) {
        print("failed updation into server successfully");
        print(res.response.toString());
      } else {
        throw ImageRecoError.serverError;
      }
    }).catchError((Object e) {
      throw e;
    });
  }


  Future<StockCategoryFetchList> getStockCategoryFetchList() {
    // var request = http.Request('GET', Uri.parse('http://localhost:9009/promotion/152'));

    Future<ParsedResponse> future = _networkUtil.get(
        BASE_URL+ 'stockcategory/');

    return future.then((ParsedResponse res) async {
      print("Get server msg about stock Category list :: ****" +
          res.response.toString());
      if (res.isOk()) {
        StockCategoryFetchList dataList = new StockCategoryFetchList();
        print("success get stock Category");
        print(res.response.toString());
        dataList.parseFromServerResponse(jsonDecode(res.response));
        return dataList;
      } else if (res.statusCode == 401) {
        print("failed  get stock Category");
        print(res.response.toString());
      } else {
        throw ImageRecoError.serverError;
      }
    }).catchError((Object e) {
      throw e;
    });
  }


  Future<StockCategoryPostList> postStockCategoryNewToServerApi(stockcategoryid,
      category,categorydiscription) {
    var params = new Map();
    params["stockcategoryid"] = stockcategoryid;
    params["category"] = category;
    params["categorydiscription"] = categorydiscription;


    var headers = {
      'Content-Type': 'application/json'
    };
    Future<ParsedResponse> future = _networkUtil.post(
        BASE_URL + 'stockcategory/add', body: jsonEncode(params),
        headers: headers);

    return future.then((ParsedResponse res) async {
      print("Get server msg about stock :: **" +
          res.response.toString());
      if (res.isOk()) {
        StockCategoryPostList dataList = new StockCategoryPostList();
        print("success stored into server successfully");
        print(res.response.toString());
      } else if (res.statusCode == 401) {
        print("failed stored into server successfully");
        print(res.response.toString());
      } else {
        throw ImageRecoError.serverError;
      }
    }).catchError((Object e) {
      throw e;
    });
  }



  Future<StockCategoryByIdList> deleteStockCategoryList(stockcategoryid) {
  Map<String, dynamic> params = Map();
  params["stockcategoryid"] = stockcategoryid;

  var headers = {
    'Content-Type': 'application/json'
  };
  Future<ParsedResponse> future = _networkUtil.delete(
      BASE_URL+'stockcategory/delete/' + stockcategoryid,headers: headers);

  return future.then((ParsedResponse res) async {
    print(" keywords deleted  :: ****" +
        res.response.toString());
    if (res.isOk()) {
      StockCategoryByIdList dataList = new StockCategoryByIdList();
      print("success deleted keyword into server successfully");
      print(res.response.toString());

    } else if (res.statusCode == 401) {
      print("failed delete operation");
      print(res.response.toString());
    } else {
      throw ImageRecoError.serverError;
    }
  }).catchError((Object e) {
    throw e;
  });
}
  Future<AdminLoginList> getAdminLoginData(usernameAdmin,passwordAdmin) {


    Future<ParsedResponse> future = _networkUtil.get(
      BASE_URL+'admins?user_name='+usernameAdmin+'&password='+passwordAdmin,);

    return future.then((ParsedResponse res) async {
      print("getting login details  ****" +
          res.response.toString());
      if (res.isOk()) {
        AdminLoginList dataList = new AdminLoginList();
        print("success login");
        print(res.response.toString());
        dataList.parseFromServerResponse(jsonDecode(res.response));
        return dataList;
      } else if (res.statusCode == 401) {
        print("failed  login");
        print(res.response.toString());
      } else {
        throw ImageRecoError.serverError;
      }
    }).catchError((Object e) {
      throw e;
    });
  }

  Future<StockFetchList> getStockProductFetchList() {
    // var request = http.Request('GET', Uri.parse('http://localhost:9009/promotion/152'));

    Future<ParsedResponse> future = _networkUtil.get(
        BASE_URL +'stock/');

    return future.then((ParsedResponse res) async {
      print("Get server msg about stock list :: **" +
          res.response.toString());
      if (res.isOk()) {
        StockFetchList dataList = new StockFetchList();
        print("success get stock list");
        print(res.response.toString());
        dataList.parseFromServerResponse(jsonDecode(res.response));
        return dataList;
      } else if (res.statusCode == 401) {
        print("failed get stock list ");
        print(res.response.toString());
      } else {
        throw ImageRecoError.serverError;
      }
    }).catchError((Object e) {
      throw e;
    });
  }


  Future<StockFetchByIdList> getstockProductById(String stockId) {
    // var request = http.Request('GET', Uri.parse('http://localhost:9009/promotion/152'));

    Future<ParsedResponse> future = _networkUtil.get(
        BASE_URL + '/stock/'+stockId);

    return future.then((ParsedResponse res) async {
      print("Get singel product information   :: **" +
          res.response.toString());
      if (res.isOk()) {
        StockFetchByIdList dataList = new StockFetchByIdList();
        print("success get keyword Category By Id");
        print(res.response.toString());
        dataList.parseFromServerResponse(jsonDecode(res.response));
        return dataList;
      } else if (res.statusCode == 401) {
        print("failed  get keyword Category");
        print(res.response.toString());
      } else {
        throw ImageRecoError.serverError;
      }
    }).catchError((Object e) {
      throw e;
    });
  }
}

  // Future<StockCategoryList> postStockCategoryToServerAPI(stockcategoryid,
  //     category,
  //     categorydiscription) {
  //   var params = new Map();
  //   params["stockcategoryid"] = stockcategoryid;
  //   params["category"] = category;
  //   params["categorydiscription"] = categorydiscription;
  //
  //
  //   var headers = {
  //     'Content-Type': 'application/json'
  //   };
  //   Future<ParsedResponse> future = _networkUtil.post(
  //       BASE_URL + 'stockcategory/add', body: jsonEncode(params),
  //       headers: headers);
  //
  //   return future.then((ParsedResponse res) async {
  //     print("Get server msg about stockcategory storage :: ****" +
  //         res.response.toString());
  //     if (res.isOk()) {
  //       StockCategoryList dataList = new StockCategoryList();
  //       print("success stored into server successfully");
  //       print(res.response.toString());
  //     } else if (res.statusCode == 401) {
  //       print("failed stored into server successfully");
  //       print(res.response.toString());
  //     } else {
  //       throw ImageRecoError.serverError;
  //     }
  //   }).catchError((Object e) {
  //     throw e;
  //   });
  // }


  // Future<StockCategoryList> getStockCategoryFetchList() {
  //   // var request = http.Request('GET', Uri.parse('http://localhost:9009/promotion/152'));
  //
  //   Future<ParsedResponse> future = _networkUtil.get(
  //       BASE_URL+'stockcategory/aaa');
  //
  //   return future.then((ParsedResponse res) async {
  //     print("Get server msg about promotion list :: ****" +
  //         res.response.toString());
  //     if (res.isOk()) {
  //       StockCategoryList dataList = new StockCategoryList();
  //       print("success get StockCategory");
  //       print(res.response.toString());
  //       dataList.parseFromServerResponse(jsonDecode(res.response));
  //       return dataList;
  //     } else if (res.statusCode == 401) {
  //       print("failed  get StockCategory");
  //       print(res.response.toString());
  //     } else {
  //       throw ImageRecoError.serverError;
  //     }
  //   }).catchError((Object e) {
  //     throw e;
  //   });
  // }













//Future<KeywordFetchList> getKeyWordTagList() {
// var request = http.Request('GET', Uri.parse('http://localhost:9009/promotion/152'));

//Future<ParsedResponse> future =_networkUtil.get(
// 'https://5a4928f2cddc.ngrok.io/keywordTags/');

//return future.then((ParsedResponse res) async {
//print("Get server msg about keyword tag list :: ****" +
// res.response.toString());
// if (res.isOk()) {
//KeywordFetchList dataList = new KeywordFetchList();
// print("success get keyword tag");
//print(res.response.toString());
// dataList.parseFromServerResponse(jsonDecode(res.response));
// return dataList;
//} else if (res.statusCode == 401) {
//print("failed  get keyword tag");
// print(res.response.toString());
//} else {
// throw ImageRecoError.serverError;
// }
// }).catchError((Object e) {
// throw e;
//});
//}
//}

