class CashRegisterModel {
  bool? status;
  String? statusCode;
  Data? data;
  String? message;
  Error? error;
  String? log;

  CashRegisterModel(
      {this.status,
        this.statusCode,
        this.data,
        this.message,
        this.error,
        this.log});

  CashRegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  String? branchCode;
  String? tillCode;
  String? cashRegisterNumber;
  String? remarks;
  String? openedOn;
  String? openedBy;
  String? closedOn;
  String? closedBy;
  String? openingCash;
  String? closingCash;
  String? actualCash;
  String? timeDiffMin;

  Data(
      {this.branchCode,
        this.tillCode,
        this.cashRegisterNumber,
        this.remarks,
        this.openedOn,
        this.openedBy,
        this.closedOn,
        this.closedBy,
        this.openingCash,
        this.closingCash,
        this.actualCash,
        this.timeDiffMin});

  Data.fromJson(Map<String, dynamic> json) {
    branchCode = json['Branch_Code'];
    tillCode = json['Till_Code'];
    cashRegisterNumber = json['Cash_Register_Number'];
    remarks = json['Remarks'];
    openedOn = json['Opened_On'];
    openedBy = json['Opened_By'];
    closedOn = json['Closed_On'];
    closedBy = json['Closed_By'];
    openingCash = json['Opening_Cash'];
    closingCash = json['Closing_Cash'];
    actualCash = json['Actual_Cash'];
    timeDiffMin = json['Time_Diff_Min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Branch_Code'] = this.branchCode;
    data['Till_Code'] = this.tillCode;
    data['Cash_Register_Number'] = this.cashRegisterNumber;
    data['Remarks'] = this.remarks;
    data['Opened_On'] = this.openedOn;
    data['Opened_By'] = this.openedBy;
    data['Closed_On'] = this.closedOn;
    data['Closed_By'] = this.closedBy;
    data['Opening_Cash'] = this.openingCash;
    data['Closing_Cash'] = this.closingCash;
    data['Actual_Cash'] = this.actualCash;
    data['Time_Diff_Min'] = this.timeDiffMin;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
