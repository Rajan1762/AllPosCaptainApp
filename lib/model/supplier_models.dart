class SupplierBaseModel {
  bool? status;
  String? statusCode;
  List<SupplierModel>? data;
  String? message;
  Error? error;
  String? log;

  SupplierBaseModel(
      {this.status,
        this.statusCode,
        this.data,
        this.message,
        this.error,
        this.log});

  SupplierBaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <SupplierModel>[];
      json['data'].forEach((v) {
        data!.add(SupplierModel.fromJson(v));
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

class SupplierModel {
  String? branchCode;
  String? employeeCode;
  String? employeeName;
  String? softwareRightsGroup;
  String? employeeImage;

  SupplierModel(
      {this.branchCode,
        this.employeeCode,
        this.employeeName,
        this.softwareRightsGroup,
        this.employeeImage});

  SupplierModel.fromJson(Map<String, dynamic> json) {
    branchCode = json['Branch_Code'];
    employeeCode = json['Employee_Code'];
    employeeName = json['Employee_Name'];
    softwareRightsGroup = json['Software_Rights_Group'];
    employeeImage = json['Employee_Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Branch_Code'] = branchCode;
    data['Employee_Code'] = employeeCode;
    data['Employee_Name'] = employeeName;
    data['Software_Rights_Group'] = softwareRightsGroup;
    data['Employee_Image'] = employeeImage;
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