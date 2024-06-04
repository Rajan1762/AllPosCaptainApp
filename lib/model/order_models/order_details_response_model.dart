class OrderDetailBaseModel {
  bool? status;
  String? statusCode;
  OrderDetailResponseModels? data;
  String? message;
  Error? error;
  String? log;

  OrderDetailBaseModel(
      {this.status,
        this.statusCode,
        this.data,
        this.message,
        this.error,
        this.log});

  OrderDetailBaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    data = json['data'] != null ? new OrderDetailResponseModels.fromJson(json['data']) : null;
    message = json['message'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    log = json['log'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    data['log'] = this.log;
    return data;
  }
}

class OrderDetailResponseModels {
  String? branchCode;
  String? branchName;
  String? tillCode;
  String? tillName;
  String? shiftRegisterNumber;
  String? cashRegisterNumber;
  String? orderReferenceNumber;
  String? saleOrderNumber;
  String? saleOrderDate;
  String? saleOrderTime;
  String? saleOrderType;
  String? captainCode;
  String? captainName;
  String? floorName;
  String? tableName;
  String? chairs;
  String? ledgerCode;
  String? ledgerName;
  String? mobile;
  String? email;
  String? address;
  String? gSTNumber;
  String? saleOrderNotes;
  String? saleOrderStatus;
  String? tokenNumber;
  String? tokenStatus;
  List<SaleOrderProducts>? saleOrderProducts;

  OrderDetailResponseModels(
      {this.branchCode,
        this.branchName,
        this.tillCode,
        this.tillName,
        this.shiftRegisterNumber,
        this.cashRegisterNumber,
        this.orderReferenceNumber,
        this.saleOrderNumber,
        this.saleOrderDate,
        this.saleOrderTime,
        this.saleOrderType,
        this.captainCode,
        this.captainName,
        this.floorName,
        this.tableName,
        this.chairs,
        this.ledgerCode,
        this.ledgerName,
        this.mobile,
        this.email,
        this.address,
        this.gSTNumber,
        this.saleOrderNotes,
        this.saleOrderStatus,
        this.tokenNumber,
        this.tokenStatus,
        this.saleOrderProducts});

  OrderDetailResponseModels.fromJson(Map<String, dynamic> json) {
    branchCode = json['Branch_Code'];
    branchName = json['Branch_Name'];
    tillCode = json['Till_Code'];
    tillName = json['Till_Name'];
    shiftRegisterNumber = json['Shift_Register_Number'];
    cashRegisterNumber = json['Cash_Register_Number'];
    orderReferenceNumber = json['Order_Reference_Number'];
    saleOrderNumber = json['Sale_Order_Number'];
    saleOrderDate = json['Sale_Order_Date'];
    saleOrderTime = json['Sale_Order_Time'];
    saleOrderType = json['Sale_Order_Type'];
    captainCode = json['Captain_Code'];
    captainName = json['Captain_Name'];
    floorName = json['Floor_Name'];
    tableName = json['Table_Name'];
    chairs = json['Chairs'];
    ledgerCode = json['Ledger_Code'];
    ledgerName = json['Ledger_Name'];
    mobile = json['Mobile'];
    email = json['Email'];
    address = json['Address'];
    gSTNumber = json['GST_Number'];
    saleOrderNotes = json['Sale_Order_Notes'];
    saleOrderStatus = json['Sale_Order_Status'];
    tokenNumber = json['Token_Number'];
    tokenStatus = json['Token_Status'];
    if (json['Sale_Order_Products'] != null) {
      saleOrderProducts = <SaleOrderProducts>[];
      json['Sale_Order_Products'].forEach((v) {
        saleOrderProducts!.add(new SaleOrderProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Branch_Code'] = this.branchCode;
    data['Branch_Name'] = this.branchName;
    data['Till_Code'] = this.tillCode;
    data['Till_Name'] = this.tillName;
    data['Shift_Register_Number'] = this.shiftRegisterNumber;
    data['Cash_Register_Number'] = this.cashRegisterNumber;
    data['Order_Reference_Number'] = this.orderReferenceNumber;
    data['Sale_Order_Number'] = this.saleOrderNumber;
    data['Sale_Order_Date'] = this.saleOrderDate;
    data['Sale_Order_Time'] = this.saleOrderTime;
    data['Sale_Order_Type'] = this.saleOrderType;
    data['Captain_Code'] = this.captainCode;
    data['Captain_Name'] = this.captainName;
    data['Floor_Name'] = this.floorName;
    data['Table_Name'] = this.tableName;
    data['Chairs'] = this.chairs;
    data['Ledger_Code'] = this.ledgerCode;
    data['Ledger_Name'] = this.ledgerName;
    data['Mobile'] = this.mobile;
    data['Email'] = this.email;
    data['Address'] = this.address;
    data['GST_Number'] = this.gSTNumber;
    data['Sale_Order_Notes'] = this.saleOrderNotes;
    data['Sale_Order_Status'] = this.saleOrderStatus;
    data['Token_Number'] = this.tokenNumber;
    data['Token_Status'] = this.tokenStatus;
    if (this.saleOrderProducts != null) {
      data['Sale_Order_Products'] =
          this.saleOrderProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SaleOrderProducts {
  String? saleOrderProductId;
  String? saleOrderNumber;
  String? kOTNumber;
  String? kitchenName;
  String? cookingNotes;
  String? orderStatus;
  String? orderTime;
  String? productCode;
  String? sKUCode;
  String? hSNSACCode;
  String? productName;
  String? nativeName;
  String? productCategory;
  String? productType;
  String? productUOM;
  String? productPrice;
  String? addonPrice;
  String? basePrice;
  String? quantity;
  String? subTotal;
  String? discountPercentage;
  String? discountAmount;
  String? taxableAmount;
  String? taxGroup;
  String? taxPercentage;
  String? taxAmount;
  String? cessPercentage;
  String? cessAmount;
  String? salePrice;
  String? productAddons;
  String? isCancelled;
  String? isInvoiced;

  SaleOrderProducts(
      {this.saleOrderProductId,
        this.saleOrderNumber,
        this.kOTNumber,
        this.kitchenName,
        this.cookingNotes,
        this.orderStatus,
        this.orderTime,
        this.productCode,
        this.sKUCode,
        this.hSNSACCode,
        this.productName,
        this.nativeName,
        this.productCategory,
        this.productType,
        this.productUOM,
        this.productPrice,
        this.addonPrice,
        this.basePrice,
        this.quantity,
        this.subTotal,
        this.discountPercentage,
        this.discountAmount,
        this.taxableAmount,
        this.taxGroup,
        this.taxPercentage,
        this.taxAmount,
        this.cessPercentage,
        this.cessAmount,
        this.salePrice,
        this.productAddons,
        this.isCancelled,
        this.isInvoiced});

  SaleOrderProducts.fromJson(Map<String, dynamic> json) {
    saleOrderProductId = json['Sale_Order_Product_Id'];
    saleOrderNumber = json['Sale_Order_Number'];
    kOTNumber = json['KOT_Number'];
    kitchenName = json['Kitchen_Name'];
    cookingNotes = json['Cooking_Notes'];
    orderStatus = json['Order_Status'];
    orderTime = json['Order_Time'];
    productCode = json['Product_Code'];
    sKUCode = json['SKU_Code'];
    hSNSACCode = json['HSN_SAC_Code'];
    productName = json['Product_Name'];
    nativeName = json['Native_Name'];
    productCategory = json['Product_Category'];
    productType = json['Product_Type'];
    productUOM = json['Product_UOM'];
    productPrice = json['Product_Price'];
    addonPrice = json['Addon_Price'];
    basePrice = json['Base_Price'];
    quantity = json['Quantity'];
    subTotal = json['Sub_Total'];
    discountPercentage = json['Discount_Percentage'];
    discountAmount = json['Discount_Amount'];
    taxableAmount = json['Taxable_Amount'];
    taxGroup = json['Tax_Group'];
    taxPercentage = json['Tax_Percentage'];
    taxAmount = json['Tax_Amount'];
    cessPercentage = json['Cess_Percentage'];
    cessAmount = json['Cess_Amount'];
    salePrice = json['Sale_Price'];
    productAddons = json['Product_Addons'];
    isCancelled = json['Is_Cancelled'];
    isInvoiced = json['Is_Invoiced'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Sale_Order_Product_Id'] = this.saleOrderProductId;
    data['Sale_Order_Number'] = this.saleOrderNumber;
    data['KOT_Number'] = this.kOTNumber;
    data['Kitchen_Name'] = this.kitchenName;
    data['Cooking_Notes'] = this.cookingNotes;
    data['Order_Status'] = this.orderStatus;
    data['Order_Time'] = this.orderTime;
    data['Product_Code'] = this.productCode;
    data['SKU_Code'] = this.sKUCode;
    data['HSN_SAC_Code'] = this.hSNSACCode;
    data['Product_Name'] = this.productName;
    data['Native_Name'] = this.nativeName;
    data['Product_Category'] = this.productCategory;
    data['Product_Type'] = this.productType;
    data['Product_UOM'] = this.productUOM;
    data['Product_Price'] = this.productPrice;
    data['Addon_Price'] = this.addonPrice;
    data['Base_Price'] = this.basePrice;
    data['Quantity'] = this.quantity;
    data['Sub_Total'] = this.subTotal;
    data['Discount_Percentage'] = this.discountPercentage;
    data['Discount_Amount'] = this.discountAmount;
    data['Taxable_Amount'] = this.taxableAmount;
    data['Tax_Group'] = this.taxGroup;
    data['Tax_Percentage'] = this.taxPercentage;
    data['Tax_Amount'] = this.taxAmount;
    data['Cess_Percentage'] = this.cessPercentage;
    data['Cess_Amount'] = this.cessAmount;
    data['Sale_Price'] = this.salePrice;
    data['Product_Addons'] = this.productAddons;
    data['Is_Cancelled'] = this.isCancelled;
    data['Is_Invoiced'] = this.isInvoiced;
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
