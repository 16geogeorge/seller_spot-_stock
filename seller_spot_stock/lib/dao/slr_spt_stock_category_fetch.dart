class StockCategoryFetchList {
  List<StockCategoryFetch> stockCategoryFetchList = new List();

  List<StockCategoryFetch> parseFromServerResponse(Map json) {

    stockCategoryFetchList.clear();
    if (null != json && json.isNotEmpty) {

      dynamic results = json;
      // dynamic dataResult=json['data'];
      //

      StockCategoryFetch item = StockCategoryFetch.fromJson(results);

      stockCategoryFetchList.add(item);

    }
    return stockCategoryFetchList;
  }
}


class StockCategoryFetch {
  List<StockCategoryData> stockCategoryData;

  StockCategoryFetch({this.stockCategoryData});

  StockCategoryFetch.fromJson(Map<String, dynamic> json) {
    if (json['stockCategoryData'] != null) {
      stockCategoryData = new List<StockCategoryData>();
      json['stockCategoryData'].forEach((v) {
        stockCategoryData.add(new StockCategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stockCategoryData != null) {
      data['stockCategoryData'] =
          this.stockCategoryData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StockCategoryData {
  String stockcategoryid;
  String category;
  String categorydiscription;

  StockCategoryData(
      {this.stockcategoryid, this.category, this.categorydiscription});

  StockCategoryData.fromJson(Map<String, dynamic> json) {
    stockcategoryid = json['stockcategoryid'];
    category = json['category'];
    categorydiscription = json['categorydiscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stockcategoryid'] = this.stockcategoryid;
    data['category'] = this.category;
    data['categorydiscription'] = this.categorydiscription;
    return data;
  }
}