class ShiftRegisterModel {
  bool? status;
  String? statusCode;
  Data? data;
  String? message;
  Error? error;
  String? log;

  ShiftRegisterModel(
      {this.status,
        this.statusCode,
        this.data,
        this.message,
        this.error,
        this.log});

  ShiftRegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    log = json['log'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
  String? shiftRegisterNumber;
  String? remarks;
  String? openedOn;
  String? openedBy;
  String? openedTill;
  String? closedOn;
  String? closedBy;
  String? closedTill;
  String? timeDiffMin;

  Data(
      {this.branchCode,
        this.shiftRegisterNumber,
        this.remarks,
        this.openedOn,
        this.openedBy,
        this.openedTill,
        this.closedOn,
        this.closedBy,
        this.closedTill,
        this.timeDiffMin});

  Data.fromJson(Map<String, dynamic> json) {
    branchCode = json['Branch_Code'];
    shiftRegisterNumber = json['Shift_Register_Number'];
    remarks = json['Remarks'];
    openedOn = json['Opened_On'];
    openedBy = json['Opened_By'];
    openedTill = json['Opened_Till'];
    closedOn = json['Closed_On'];
    closedBy = json['Closed_By'];
    closedTill = json['Closed_Till'];
    timeDiffMin = json['Time_Diff_Min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Branch_Code'] = this.branchCode;
    data['Shift_Register_Number'] = this.shiftRegisterNumber;
    data['Remarks'] = this.remarks;
    data['Opened_On'] = this.openedOn;
    data['Opened_By'] = this.openedBy;
    data['Opened_Till'] = this.openedTill;
    data['Closed_On'] = this.closedOn;
    data['Closed_By'] = this.closedBy;
    data['Closed_Till'] = this.closedTill;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
