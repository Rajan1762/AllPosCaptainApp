class OrderResponseModel {
  bool? status;
  String? statusCode;
  List<OrderDataModel>? data;
  String? message;
  Error? error;
  String? log;

  OrderResponseModel(
      {this.status,
        this.statusCode,
        this.data,
        this.message,
        this.error,
        this.log});

  OrderResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <OrderDataModel>[];
      json['data'].forEach((v) {
        data!.add(OrderDataModel.fromJson(v));
      });
    }
    message = json['message'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    log = json['log'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    data['log'] = log;
    return data;
  }
}

class OrderDataModel {
  String? tillCode;
  String? tillName;
  String? orderReferenceNumber;
  String? saleOrderNumber;
  String? saleOrderDate;
  String? saleOrderTime;
  String? saleOrderType;
  String? captainCode;
  String? captainName;
  String? floorName;
  String? tableName;
  String? ledgerName;
  String? mobile;
  String? saleOrderStatus;
  String? tokenNumber;
  String? tokenStatus;
  String? kOTNumber;
  String? amount;

  OrderDataModel(
      {this.tillCode,
        this.tillName,
        this.orderReferenceNumber,
        this.saleOrderNumber,
        this.saleOrderDate,
        this.saleOrderTime,
        this.saleOrderType,
        this.captainCode,
        this.captainName,
        this.floorName,
        this.tableName,
        this.ledgerName,
        this.mobile,
        this.saleOrderStatus,
        this.tokenNumber,
        this.tokenStatus,
        this.kOTNumber,
        this.amount});

  OrderDataModel.fromJson(Map<String, dynamic> json) {
    tillCode = json['Till_Code'];
    tillName = json['Till_Name'];
    orderReferenceNumber = json['Order_Reference_Number'];
    saleOrderNumber = json['Sale_Order_Number'];
    saleOrderDate = json['Sale_Order_Date'];
    saleOrderTime = json['Sale_Order_Time'];
    saleOrderType = json['Sale_Order_Type'];
    captainCode = json['Captain_Code'];
    captainName = json['Captain_Name'];
    floorName = json['Floor_Name'] == '' ? '_' : json['Floor_Name'];
    tableName = json['Table_Name'] == '' ? '_' : json['Table_Name'];
    ledgerName = json['Ledger_Name'] == '' ? '_' : json['Ledger_Name'];
    mobile = json['Mobile'] == '' ? '_' : json['Mobile'];
    saleOrderStatus = json['Sale_Order_Status'];
    tokenNumber = json['Token_Number'];
    tokenStatus = json['Token_Status'];
    kOTNumber = json['KOT_Number'];
    amount = json['Amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Till_Code'] = this.tillCode;
    data['Till_Name'] = this.tillName;
    data['Order_Reference_Number'] = this.orderReferenceNumber;
    data['Sale_Order_Number'] = this.saleOrderNumber;
    data['Sale_Order_Date'] = this.saleOrderDate;
    data['Sale_Order_Time'] = this.saleOrderTime;
    data['Sale_Order_Type'] = this.saleOrderType;
    data['Captain_Code'] = this.captainCode;
    data['Captain_Name'] = this.captainName;
    data['Floor_Name'] = this.floorName;
    data['Table_Name'] = this.tableName;
    data['Ledger_Name'] = this.ledgerName;
    data['Mobile'] = this.mobile;
    data['Sale_Order_Status'] = this.saleOrderStatus;
    data['Token_Number'] = this.tokenNumber;
    data['Token_Status'] = this.tokenStatus;
    data['KOT_Number'] = this.kOTNumber;
    data['Amount'] = this.amount;
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