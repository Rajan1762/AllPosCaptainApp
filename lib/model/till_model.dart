class TillBaseModel {
  bool? status;
  String? statusCode;
  List<Data>? data;
  String? message;
  Error? error;
  String? log;

  TillBaseModel(
      {this.status,
        this.statusCode,
        this.data,
        this.message,
        this.error,
        this.log});

  TillBaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  String? branch;
  String? tillCode;
  String? tillName;
  String? enableCashRegister;
  String? enableOnlineOrder;
  String? enablePrintReceipt;
  String? enablePrintKOT;
  String? enableTenderExchange;
  String? activeStatus;
  bool isSelected = false;

  Data(
      {this.branch,
        this.tillCode,
        this.tillName,
        this.enableCashRegister,
        this.enableOnlineOrder,
        this.enablePrintReceipt,
        this.enablePrintKOT,
        this.enableTenderExchange,
        this.activeStatus});

  Data.fromJson(Map<String, dynamic> json) {
    branch = json['Branch'];
    tillCode = json['Till_Code'];
    tillName = json['Till_Name'];
    enableCashRegister = json['Enable_Cash_Register'];
    enableOnlineOrder = json['Enable_Online_Order'];
    enablePrintReceipt = json['Enable_Print_Receipt'];
    enablePrintKOT = json['Enable_Print_KOT'];
    enableTenderExchange = json['Enable_Tender_Exchange'];
    activeStatus = json['Active_Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Branch'] = branch;
    data['Till_Code'] = tillCode;
    data['Till_Name'] = tillName;
    data['Enable_Cash_Register'] = enableCashRegister;
    data['Enable_Online_Order'] = enableOnlineOrder;
    data['Enable_Print_Receipt'] = enablePrintReceipt;
    data['Enable_Print_KOT'] = enablePrintKOT;
    data['Enable_Tender_Exchange'] = enableTenderExchange;
    data['Active_Status'] = activeStatus;
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