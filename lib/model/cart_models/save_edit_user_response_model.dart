class SaveEditUserResponseModel {
  bool? status;
  String? statusCode;
  String? data;
  String? message;
  Error? error;
  String? log;

  SaveEditUserResponseModel(
      {this.status,
        this.statusCode,
        this.data,
        this.message,
        this.error,
        this.log});

  SaveEditUserResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    data = json['data'];
    message = json['message'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    log = json['log'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    data['data'] = this.data;
    data['message'] = message;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    data['log'] = log;
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
