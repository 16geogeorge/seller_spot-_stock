class InventoryProductCategoryList {
  List<InventoryProductCategory> inventoryProductCategoryList = new List();

  List<InventoryProductCategory> parseFromServerResponse(Map json) {

    inventoryProductCategoryList.clear();
    if (null != json && json.isNotEmpty) {

      dynamic results = json;
      // dynamic dataResult=json['data'];
      //
      InventoryProductCategory item = InventoryProductCategory.fromJson(results);

      inventoryProductCategoryList.add(item);

    }
    return inventoryProductCategoryList;
  }
}
class InventoryProductCategory {
  String inventoryProductCategoryId;
  String inventoryProductCategoryName;
  String inventoryProductCategoryDescription;
  String inventoryProductCategoryDeleted;
  String inventoryProductCategoryUpdated;

  InventoryProductCategory(
      {this.inventoryProductCategoryId,
        this.inventoryProductCategoryName,
        this.inventoryProductCategoryDescription,
        this.inventoryProductCategoryDeleted,
        this.inventoryProductCategoryUpdated});

  InventoryProductCategory.fromJson(Map<String, dynamic> json) {
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
