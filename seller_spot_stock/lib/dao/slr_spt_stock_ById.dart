class StockFetchByIdList {
  List<StockFetchById> stockFetchByIdList = new List();

  List<StockFetchById> parseFromServerResponse(Map json) {

    stockFetchByIdList.clear();
    if (null != json && json.isNotEmpty) {

      dynamic results = json;
      // dynamic dataResult=json['data'];
      //

      StockFetchById item = StockFetchById.fromJson(results);

      stockFetchByIdList.add(item);

    }
    return stockFetchByIdList;
  }
}



class StockFetchById {
  String stockId;
  InventoryProductId inventoryProductId;
  StockCategoryId stockCategoryId;
  String stockProductQuantity;
  String expiryDate;
  String stockTotalAmount;
  String stockStatus;

  StockFetchById(
      {this.stockId,
        this.inventoryProductId,
        this.stockCategoryId,
        this.stockProductQuantity,
        this.expiryDate,
        this.stockTotalAmount,
        this.stockStatus});

  StockFetchById.fromJson(Map<String, dynamic> json) {
    stockId = json['stockId'];
    inventoryProductId = json['inventoryProductId'] != null
        ? new InventoryProductId.fromJson(json['inventoryProductId'])
        : null;
    stockCategoryId = json['stockCategoryId'] != null
        ? new StockCategoryId.fromJson(json['stockCategoryId'])
        : null;
    stockProductQuantity = json['stockProductQuantity'];
    expiryDate = json['expiryDate'];
    stockTotalAmount = json['stockTotalAmount'];
    stockStatus = json['stockStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stockId'] = this.stockId;
    if (this.inventoryProductId != null) {
      data['inventoryProductId'] = this.inventoryProductId.toJson();
    }
    if (this.stockCategoryId != null) {
      data['stockCategoryId'] = this.stockCategoryId.toJson();
    }
    data['stockProductQuantity'] = this.stockProductQuantity;
    data['expiryDate'] = this.expiryDate;
    data['stockTotalAmount'] = this.stockTotalAmount;
    data['stockStatus'] = this.stockStatus;
    return data;
  }
}

class InventoryProductId {
  String inventoryProductId;
  String inventoryProductName;
  String inventoryProductDescription;
  String inventoryProductPrice;
  String inventoryProductSize;
  String inventoryProductColor;
  InventoryProductHolidayId inventoryProductHolidayId;
  InventoryProductCategoryId inventoryProductCategoryId;
  InventoryProductBrandId inventoryProductBrandId;
  String inventoryProductQuantity;
  InventoryProductKeywordId inventoryProductKeywordId;
  int inventoryProductDeleted;
  int inventoryProductUpdated;

  InventoryProductId(
      {this.inventoryProductId,
        this.inventoryProductName,
        this.inventoryProductDescription,
        this.inventoryProductPrice,
        this.inventoryProductSize,
        this.inventoryProductColor,
        this.inventoryProductHolidayId,
        this.inventoryProductCategoryId,
        this.inventoryProductBrandId,
        this.inventoryProductQuantity,
        this.inventoryProductKeywordId,
        this.inventoryProductDeleted,
        this.inventoryProductUpdated});

  InventoryProductId.fromJson(Map<String, dynamic> json) {
    inventoryProductId = json['inventoryProductId'];
    inventoryProductName = json['inventoryProductName'];
    inventoryProductDescription = json['inventoryProductDescription'];
    inventoryProductPrice = json['inventoryProductPrice'];
    inventoryProductSize = json['inventoryProductSize'];
    inventoryProductColor = json['inventoryProductColor'];
    inventoryProductHolidayId = json['inventoryProductHolidayId'] != null
        ? new InventoryProductHolidayId.fromJson(
        json['inventoryProductHolidayId'])
        : null;
    inventoryProductCategoryId = json['inventoryProductCategoryId'] != null
        ? new InventoryProductCategoryId.fromJson(
        json['inventoryProductCategoryId'])
        : null;
    inventoryProductBrandId = json['inventoryProductBrandId'] != null
        ? new InventoryProductBrandId.fromJson(json['inventoryProductBrandId'])
        : null;
    inventoryProductQuantity = json['inventoryProductQuantity'];
    inventoryProductKeywordId = json['inventoryProductKeywordId'] != null
        ? new InventoryProductKeywordId.fromJson(
        json['inventoryProductKeywordId'])
        : null;
    inventoryProductDeleted = json['inventoryProductDeleted'];
    inventoryProductUpdated = json['inventoryProductUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inventoryProductId'] = this.inventoryProductId;
    data['inventoryProductName'] = this.inventoryProductName;
    data['inventoryProductDescription'] = this.inventoryProductDescription;
    data['inventoryProductPrice'] = this.inventoryProductPrice;
    data['inventoryProductSize'] = this.inventoryProductSize;
    data['inventoryProductColor'] = this.inventoryProductColor;
    if (this.inventoryProductHolidayId != null) {
      data['inventoryProductHolidayId'] =
          this.inventoryProductHolidayId.toJson();
    }
    if (this.inventoryProductCategoryId != null) {
      data['inventoryProductCategoryId'] =
          this.inventoryProductCategoryId.toJson();
    }
    if (this.inventoryProductBrandId != null) {
      data['inventoryProductBrandId'] = this.inventoryProductBrandId.toJson();
    }
    data['inventoryProductQuantity'] = this.inventoryProductQuantity;
    if (this.inventoryProductKeywordId != null) {
      data['inventoryProductKeywordId'] =
          this.inventoryProductKeywordId.toJson();
    }
    data['inventoryProductDeleted'] = this.inventoryProductDeleted;
    data['inventoryProductUpdated'] = this.inventoryProductUpdated;
    return data;
  }
}

class InventoryProductHolidayId {
  String holidayId;
  String holidayName;
  String holidayDescription;
  String holidayDate;
  String holidaySeason;
  String holidayDeleted;
  String holidayUpdated;

  InventoryProductHolidayId(
      {this.holidayId,
        this.holidayName,
        this.holidayDescription,
        this.holidayDate,
        this.holidaySeason,
        this.holidayDeleted,
        this.holidayUpdated});

  InventoryProductHolidayId.fromJson(Map<String, dynamic> json) {
    holidayId = json['holidayId'];
    holidayName = json['holidayName'];
    holidayDescription = json['holidayDescription'];
    holidayDate = json['holidayDate'];
    holidaySeason = json['holidaySeason'];
    holidayDeleted = json['holidayDeleted'];
    holidayUpdated = json['holidayUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['holidayId'] = this.holidayId;
    data['holidayName'] = this.holidayName;
    data['holidayDescription'] = this.holidayDescription;
    data['holidayDate'] = this.holidayDate;
    data['holidaySeason'] = this.holidaySeason;
    data['holidayDeleted'] = this.holidayDeleted;
    data['holidayUpdated'] = this.holidayUpdated;
    return data;
  }
}

class InventoryProductCategoryId {
  String inventoryProductCategoryId;
  String inventoryProductCategoryName;
  String inventoryProductCategoryDescription;
  String inventoryProductCategoryDeleted;
  String inventoryProductCategoryUpdated;

  InventoryProductCategoryId(
      {this.inventoryProductCategoryId,
        this.inventoryProductCategoryName,
        this.inventoryProductCategoryDescription,
        this.inventoryProductCategoryDeleted,
        this.inventoryProductCategoryUpdated});

  InventoryProductCategoryId.fromJson(Map<String, dynamic> json) {
    inventoryProductCategoryId = json['inventory_product_category_id'];
    inventoryProductCategoryName = json['inventory_product_category_name'];
    inventoryProductCategoryDescription =
    json['inventory_product_category_description'];
    inventoryProductCategoryDeleted =
    json['inventory_product_category_deleted'];
    inventoryProductCategoryUpdated =
    json['inventory_product_category_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inventory_product_category_id'] = this.inventoryProductCategoryId;
    data['inventory_product_category_name'] = this.inventoryProductCategoryName;
    data['inventory_product_category_description'] =
        this.inventoryProductCategoryDescription;
    data['inventory_product_category_deleted'] =
        this.inventoryProductCategoryDeleted;
    data['inventory_product_category_updated'] =
        this.inventoryProductCategoryUpdated;
    return data;
  }
}

class InventoryProductBrandId {
  String brandId;
  String brandName;
  String brandItems;
  BrandCategoryId brandCategoryId;
  String brandPriority;

  InventoryProductBrandId(
      {this.brandId,
        this.brandName,
        this.brandItems,
        this.brandCategoryId,
        this.brandPriority});

  InventoryProductBrandId.fromJson(Map<String, dynamic> json) {
    brandId = json['brandId'];
    brandName = json['brandName'];
    brandItems = json['brandItems'];
    brandCategoryId = json['brandCategoryId'] != null
        ? new BrandCategoryId.fromJson(json['brandCategoryId'])
        : null;
    brandPriority = json['brandPriority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brandId'] = this.brandId;
    data['brandName'] = this.brandName;
    data['brandItems'] = this.brandItems;
    if (this.brandCategoryId != null) {
      data['brandCategoryId'] = this.brandCategoryId.toJson();
    }
    data['brandPriority'] = this.brandPriority;
    return data;
  }
}

class BrandCategoryId {
  String brandCategoryId;
  String brandCategory;

  BrandCategoryId({this.brandCategoryId, this.brandCategory});

  BrandCategoryId.fromJson(Map<String, dynamic> json) {
    brandCategoryId = json['brandCategoryId'];
    brandCategory = json['brandCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brandCategoryId'] = this.brandCategoryId;
    data['brandCategory'] = this.brandCategory;
    return data;
  }
}

class InventoryProductKeywordId {
  String keywordId;
  String keywords;
  KeywordCategoryId keywordCategoryId;
  KeywordTag keywordTag;

  InventoryProductKeywordId(
      {this.keywordId, this.keywords, this.keywordCategoryId, this.keywordTag});

  InventoryProductKeywordId.fromJson(Map<String, dynamic> json) {
    keywordId = json['keywordId'];
    keywords = json['keywords'];
    keywordCategoryId = json['keywordCategoryId'] != null
        ? new KeywordCategoryId.fromJson(json['keywordCategoryId'])
        : null;
    keywordTag = json['keywordTag'] != null
        ? new KeywordTag.fromJson(json['keywordTag'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keywordId'] = this.keywordId;
    data['keywords'] = this.keywords;
    if (this.keywordCategoryId != null) {
      data['keywordCategoryId'] = this.keywordCategoryId.toJson();
    }
    if (this.keywordTag != null) {
      data['keywordTag'] = this.keywordTag.toJson();
    }
    return data;
  }
}

class KeywordCategoryId {
  String keywordCategoryId;
  String keywordCategoryName;
  String keywordCategoryDescription;

  KeywordCategoryId(
      {this.keywordCategoryId,
        this.keywordCategoryName,
        this.keywordCategoryDescription});

  KeywordCategoryId.fromJson(Map<String, dynamic> json) {
    keywordCategoryId = json['keywordCategoryId'];
    keywordCategoryName = json['keywordCategoryName'];
    keywordCategoryDescription = json['keywordCategoryDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keywordCategoryId'] = this.keywordCategoryId;
    data['keywordCategoryName'] = this.keywordCategoryName;
    data['keywordCategoryDescription'] = this.keywordCategoryDescription;
    return data;
  }
}

class KeywordTag {
  String keywordTagId;
  String keywordTagName;

  KeywordTag({this.keywordTagId, this.keywordTagName});

  KeywordTag.fromJson(Map<String, dynamic> json) {
    keywordTagId = json['keywordTagId'];
    keywordTagName = json['keywordTagName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keywordTagId'] = this.keywordTagId;
    data['keywordTagName'] = this.keywordTagName;
    return data;
  }
}

class StockCategoryId {
  String stockcategoryid;
  String category;
  String categorydiscription;

  StockCategoryId(
      {this.stockcategoryid, this.category, this.categorydiscription});

  StockCategoryId.fromJson(Map<String, dynamic> json) {
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