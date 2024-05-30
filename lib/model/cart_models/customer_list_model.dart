class CustomerListModel {
  bool? status;
  String? statusCode;
  List<CustomerData>? data;
  String? message;
  Error? error;
  String? log;

  CustomerListModel({this.status, this.statusCode, this.data});

  CustomerListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <CustomerData>[];
      json['data'].forEach((v) {
        data!.add(new CustomerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerData {
  String? ledgerCode;
  String? ledgerName;
  String? tradeName;
  String? gSTNumber;
  String? ledgerGroup;
  String? phone;
  String? mobile;
  String? email;
  String? conductPersonName;
  String? conductPersonMobile;
  String? billingAddressLine1;
  String? billingAddressLine2;
  String? billingCity;
  String? billingState;
  String? billingCountry;
  String? billingPincode;
  String? creditPayment;
  String? advancePayment;
  String? loyaltyPoint;
  String? paymentTerms;
  String? creditLimit;

  CustomerData(
      {this.ledgerCode,
        this.ledgerName,
        this.tradeName,
        this.gSTNumber,
        this.ledgerGroup,
        this.phone,
        this.mobile,
        this.email,
        this.conductPersonName,
        this.conductPersonMobile,
        this.billingAddressLine1,
        this.billingAddressLine2,
        this.billingCity,
        this.billingState,
        this.billingCountry,
        this.billingPincode,
        this.creditPayment,
        this.advancePayment,
        this.loyaltyPoint,
        this.paymentTerms,
        this.creditLimit});

  CustomerData.fromJson(Map<String, dynamic> json) {
    ledgerCode = json['Ledger_Code'];
    ledgerName = json['Ledger_Name'];
    tradeName = json['Trade_Name'];
    gSTNumber = json['GST_Number'];
    ledgerGroup = json['Ledger_Group'];
    phone = json['Phone'];
    mobile = json['Mobile'];
    email = json['Email'];
    conductPersonName = json['Conduct_Person_Name'];
    conductPersonMobile = json['Conduct_Person_Mobile'];
    billingAddressLine1 = json['Billing_Address_Line_1'];
    billingAddressLine2 = json['Billing_Address_Line_2'];
    billingCity = json['Billing_City'];
    billingState = json['Billing_State'];
    billingCountry = json['Billing_Country'];
    billingPincode = json['Billing_Pincode'];
    creditPayment = json['Credit_Payment'];
    advancePayment = json['Advance_Payment'];
    loyaltyPoint = json['Loyalty_Point'];
    paymentTerms = json['Payment_Terms'];
    creditLimit = json['Credit_Limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Ledger_Code'] = this.ledgerCode;
    data['Ledger_Name'] = this.ledgerName;
    data['Trade_Name'] = this.tradeName;
    data['GST_Number'] = this.gSTNumber;
    data['Ledger_Group'] = this.ledgerGroup;
    data['Phone'] = this.phone;
    data['Mobile'] = this.mobile;
    data['Email'] = this.email;
    data['Conduct_Person_Name'] = this.conductPersonName;
    data['Conduct_Person_Mobile'] = this.conductPersonMobile;
    data['Billing_Address_Line_1'] = this.billingAddressLine1;
    data['Billing_Address_Line_2'] = this.billingAddressLine2;
    data['Billing_City'] = this.billingCity;
    data['Billing_State'] = this.billingState;
    data['Billing_Country'] = this.billingCountry;
    data['Billing_Pincode'] = this.billingPincode;
    data['Credit_Payment'] = this.creditPayment;
    data['Advance_Payment'] = this.advancePayment;
    data['Loyalty_Point'] = this.loyaltyPoint;
    data['Payment_Terms'] = this.paymentTerms;
    data['Credit_Limit'] = this.creditLimit;
    return data;
  }
}