class OrderDetailBaseModel {
  bool? status;
  String? statusCode;
  List<OrderDetailResponseModel>? data;
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
    if (json['data'] != null) {
      data = <OrderDetailResponseModel>[];
      json['data'].forEach((v) {
        data!.add(new OrderDetailResponseModel.fromJson(v));
      });
    }
    message = json['message'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    log = json['log'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    data['log'] = this.log;
    return data;
  }
}

class OrderDetailResponseModel {
  String? branchCode;
  String? floorName;
  String? tableName;
  String? chairs;
  String? availableStatus;
  String? enableOnlineOrder;
  String? enableMultipleOrder;
  String? enableChairSelection;
  String? orders;
  String? saleOrderList;
  String? guests;

  OrderDetailResponseModel(
      {this.branchCode,
        this.floorName,
        this.tableName,
        this.chairs,
        this.availableStatus,
        this.enableOnlineOrder,
        this.enableMultipleOrder,
        this.enableChairSelection,
        this.orders,
        this.saleOrderList,
        this.guests});

  OrderDetailResponseModel.fromJson(Map<String, dynamic> json) {
    branchCode = json['Branch_Code'];
    floorName = json['Floor_Name'];
    tableName = json['Table_Name'];
    chairs = json['Chairs'];
    availableStatus = json['Available_Status'];
    enableOnlineOrder = json['Enable_Online_Order'];
    enableMultipleOrder = json['Enable_Multiple_Order'];
    enableChairSelection = json['Enable_Chair_Selection'];
    orders = json['Orders'];
    saleOrderList = json['Sale_Order_List'];
    guests = json['Guests'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Branch_Code'] = this.branchCode;
    data['Floor_Name'] = this.floorName;
    data['Table_Name'] = this.tableName;
    data['Chairs'] = this.chairs;
    data['Available_Status'] = this.availableStatus;
    data['Enable_Online_Order'] = this.enableOnlineOrder;
    data['Enable_Multiple_Order'] = this.enableMultipleOrder;
    data['Enable_Chair_Selection'] = this.enableChairSelection;
    data['Orders'] = this.orders;
    data['Sale_Order_List'] = this.saleOrderList;
    data['Guests'] = this.guests;
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