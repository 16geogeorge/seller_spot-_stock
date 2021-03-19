class StockCategoryByIdList {
  List<StockCategoryById> stockCategoryByIdList = new List();

  List<StockCategoryById> parseFromServerResponse(Map json) {

    stockCategoryByIdList.clear();
    if (null != json && json.isNotEmpty) {

      dynamic results = json;
      // dynamic dataResult=json['data'];
      //

      StockCategoryById item = StockCategoryById.fromJson(results);

      stockCategoryByIdList.add(item);

    }
    return stockCategoryByIdList;
  }
}


class StockCategoryById {
  String stockcategoryid;
  String category;
  String categorydiscription;

  StockCategoryById(
      {this.stockcategoryid, this.category, this.categorydiscription});

  StockCategoryById.fromJson(Map<String, dynamic> json) {
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