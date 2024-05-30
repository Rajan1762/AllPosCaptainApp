class ProductBaseModel {
  bool? status;
  String? statusCode;
  Data? data;
  String? message;
  Error? error;
  String? log;

  ProductBaseModel(
      {this.status,
        this.statusCode,
        this.data,
        this.message,
        this.error,
        this.log});

  ProductBaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    log = json['log'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    data['log'] = log;
    return data;
  }
}

class Data {
  List<ProductList>? productList;
  List<CategoryList>? categoryList;
  List<TypeList>? typeList;

  Data({this.productList, this.categoryList, this.typeList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['ProductList'] != null) {
      productList = <ProductList>[];
      json['ProductList'].forEach((v) {
        productList!.add(ProductList.fromJson(v));
      });
    }
    if (json['CategoryList'] != null) {
      categoryList = <CategoryList>[];
      json['CategoryList'].forEach((v) {
        categoryList!.add(CategoryList.fromJson(v));
      });
    }
    if (json['TypeList'] != null) {
      typeList = <TypeList>[];
      json['TypeList'].forEach((v) {
        typeList!.add(TypeList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productList != null) {
      data['ProductList'] = productList!.map((v) => v.toJson()).toList();
    }
    if (categoryList != null) {
      data['CategoryList'] = categoryList!.map((v) => v.toJson()).toList();
    }
    if (typeList != null) {
      data['TypeList'] = typeList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductList {
  String? productCode;
  String? sKUCode;
  String? hSNSACCode;
  String? productName;
  String? description;
  String? productCategory;
  String? productType;
  String? foodType;
  String? productUOM;
  String? kitchenName;
  String? imageUrl;
  String? expiryHours;
  String? enableWeighing;
  String? branchCode;
  String? nativeName;
  String? taxGroup;
  String? taxPercentage;
  String? cessPercentage;
  String? purchasePrice;
  String? salePrice1;
  String? salePrice2;
  String? salePrice3;
  String? salePrice4;
  String? salePrice5;
  String? salePrice6;
  String? salePrice7;
  String? salePrice8;
  String? salePrice9;
  String? salePrice10;
  String? discountPercentage;
  String? enablePriceChangeOnSale;
  bool addStatus = false;
  int quantity = 1;

  ProductList(
      {this.productCode,
        this.sKUCode,
        this.hSNSACCode,
        this.productName,
        this.description,
        this.productCategory,
        this.productType,
        this.foodType,
        this.productUOM,
        this.kitchenName,
        this.imageUrl,
        this.expiryHours,
        this.enableWeighing,
        this.branchCode,
        this.nativeName,
        this.taxGroup,
        this.taxPercentage,
        this.cessPercentage,
        this.purchasePrice,
        this.salePrice1,
        this.salePrice2,
        this.salePrice3,
        this.salePrice4,
        this.salePrice5,
        this.salePrice6,
        this.salePrice7,
        this.salePrice8,
        this.salePrice9,
        this.salePrice10,
        this.discountPercentage,
        this.enablePriceChangeOnSale});

  ProductList.fromJson(Map<String, dynamic> json) {
    productCode = json['Product_Code'];
    sKUCode = json['SKU_Code'];
    hSNSACCode = json['HSN_SAC_Code'];
    productName = json['Product_Name'];
    description = json['Description'];
    productCategory = json['Product_Category'];
    productType = json['Product_Type'];
    foodType = json['Food_Type'];
    productUOM = json['Product_UOM'];
    kitchenName = json['Kitchen_Name'];
    imageUrl = json['Image_Url'];
    expiryHours = json['Expiry_Hours'];
    enableWeighing = json['Enable_Weighing'];
    branchCode = json['Branch_Code'];
    nativeName = json['Native_Name'];
    taxGroup = json['Tax_Group'];
    taxPercentage = json['Tax_Percentage'];
    cessPercentage = json['Cess_Percentage'];
    purchasePrice = json['Purchase_Price'];
    salePrice1 = json['Sale_Price_1'];
    salePrice2 = json['Sale_Price_2'];
    salePrice3 = json['Sale_Price_3'];
    salePrice4 = json['Sale_Price_4'];
    salePrice5 = json['Sale_Price_5'];
    salePrice6 = json['Sale_Price_6'];
    salePrice7 = json['Sale_Price_7'];
    salePrice8 = json['Sale_Price_8'];
    salePrice9 = json['Sale_Price_9'];
    salePrice10 = json['Sale_Price_10'];
    discountPercentage = json['Discount_Percentage'];
    enablePriceChangeOnSale = json['Enable_Price_Change_OnSale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Product_Code'] = productCode;
    data['SKU_Code'] = sKUCode;
    data['HSN_SAC_Code'] = hSNSACCode;
    data['Product_Name'] = productName;
    data['Description'] = description;
    data['Product_Category'] = productCategory;
    data['Product_Type'] = productType;
    data['Food_Type'] = foodType;
    data['Product_UOM'] = productUOM;
    data['Kitchen_Name'] = kitchenName;
    data['Image_Url'] = imageUrl;
    data['Expiry_Hours'] = expiryHours;
    data['Enable_Weighing'] = enableWeighing;
    data['Branch_Code'] = branchCode;
    data['Native_Name'] = nativeName;
    data['Tax_Group'] = taxGroup;
    data['Tax_Percentage'] = taxPercentage;
    data['Cess_Percentage'] = cessPercentage;
    data['Purchase_Price'] = purchasePrice;
    data['Sale_Price_1'] = salePrice1;
    data['Sale_Price_2'] = salePrice2;
    data['Sale_Price_3'] = salePrice3;
    data['Sale_Price_4'] = salePrice4;
    data['Sale_Price_5'] = salePrice5;
    data['Sale_Price_6'] = salePrice6;
    data['Sale_Price_7'] = salePrice7;
    data['Sale_Price_8'] = salePrice8;
    data['Sale_Price_9'] = salePrice9;
    data['Sale_Price_10'] = salePrice10;
    data['Discount_Percentage'] = discountPercentage;
    data['Enable_Price_Change_OnSale'] = enablePriceChangeOnSale;
    return data;
  }
}

class CategoryList {
  String? productCategory;
  String? sortOrder;

  CategoryList({this.productCategory, this.sortOrder});

  CategoryList.fromJson(Map<String, dynamic> json) {
    productCategory = json['Product_Category'];
    sortOrder = json['Sort_Order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Product_Category'] = productCategory;
    data['Sort_Order'] = sortOrder;
    return data;
  }
}

class TypeList {
  String? productType;
  String? sortOrder;

  TypeList({this.productType, this.sortOrder});

  TypeList.fromJson(Map<String, dynamic> json) {
    productType = json['Product_Type'];
    sortOrder = json['Sort_Order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Product_Type'] = productType;
    data['Sort_Order'] = sortOrder;
    return data;
  }
}

class Error {
  String? code;
  String? message;

  Error({this.code, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}
