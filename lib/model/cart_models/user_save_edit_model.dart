class UserSaveEditModel {
  String? ledgerName;
  String? mobile;
  String? email;
  String? billingAddressLine1;
  String? billingAddressLine2;
  String? billingCity;
  String? billingState;
  String? billingCountry;
  String? billingPincode;
  String? tradeName;
  String? phone;
  String? website;
  String? gSTType;
  String? gSTNumber;
  String? pANNumber;
  String? mSMENumber;
  String? bankName;
  String? bankBranch;
  String? iFSCCode;
  String? aCHolderName;
  String? aCNumber;
  String? ledgerType;
  String? ledgerGroup;
  String? coupenCardNo;
  String? openingBalance;
  String? paymentTerms;
  String? creditLimit;
  int? payBillBy;
  String? referralDetail;
  String? conductPersonName;
  String? conductPersonMobile;
  String? placeOfSupply;
  String? stateCode;
  int? isActive;

  UserSaveEditModel(
      {this.ledgerName,
        this.mobile,
        this.email,
        this.billingAddressLine1,
        this.billingAddressLine2,
        this.billingCity,
        this.billingState,
        this.billingCountry,
        this.billingPincode,
        this.tradeName,
        this.phone,
        this.website,
        this.gSTType,
        this.gSTNumber,
        this.pANNumber,
        this.mSMENumber,
        this.bankName,
        this.bankBranch,
        this.iFSCCode,
        this.aCHolderName,
        this.aCNumber,
        this.ledgerType,
        this.ledgerGroup,
        this.coupenCardNo,
        this.openingBalance,
        this.paymentTerms,
        this.creditLimit,
        this.payBillBy,
        this.referralDetail,
        this.conductPersonName,
        this.conductPersonMobile,
        this.placeOfSupply,
        this.stateCode,
        this.isActive});

  UserSaveEditModel.fromJson(Map<String, dynamic> json) {
    ledgerName = json['Ledger_Name'];
    mobile = json['Mobile'];
    email = json['Email'];
    billingAddressLine1 = json['Billing_Address_Line_1'];
    billingAddressLine2 = json['Billing_Address_Line_2'];
    billingCity = json['Billing_City'];
    billingState = json['Billing_State'];
    billingCountry = json['Billing_Country'];
    billingPincode = json['Billing_Pincode'];
    tradeName = json['Trade_Name'];
    phone = json['Phone'];
    website = json['Website'];
    gSTType = json['GST_Type'];
    gSTNumber = json['GST_Number'];
    pANNumber = json['PAN_Number'];
    mSMENumber = json['MSME_Number'];
    bankName = json['Bank_Name'];
    bankBranch = json['Bank_Branch'];
    iFSCCode = json['IFSC_Code'];
    aCHolderName = json['AC_Holder_Name'];
    aCNumber = json['AC_Number'];
    ledgerType = json['Ledger_Type'];
    ledgerGroup = json['Ledger_Group'];
    coupenCardNo = json['Coupen_Card_No'];
    openingBalance = json['Opening_Balance'];
    paymentTerms = json['Payment_Terms'];
    creditLimit = json['Credit_Limit'];
    payBillBy = json['Pay_Bill_By'];
    referralDetail = json['Referral_Detail'];
    conductPersonName = json['Conduct_Person_Name'];
    conductPersonMobile = json['Conduct_Person_Mobile'];
    placeOfSupply = json['Place_Of_Supply'];
    stateCode = json['State_Code'];
    isActive = json['Is_Active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Ledger_Name'] = this.ledgerName;
    data['Mobile'] = this.mobile;
    data['Email'] = this.email;
    data['Billing_Address_Line_1'] = this.billingAddressLine1;
    data['Billing_Address_Line_2'] = this.billingAddressLine2;
    data['Billing_City'] = this.billingCity;
    data['Billing_State'] = this.billingState;
    data['Billing_Country'] = this.billingCountry;
    data['Billing_Pincode'] = this.billingPincode;
    data['Trade_Name'] = this.tradeName;
    data['Phone'] = this.phone;
    data['Website'] = this.website;
    data['GST_Type'] = this.gSTType;
    data['GST_Number'] = this.gSTNumber;
    data['PAN_Number'] = this.pANNumber;
    data['MSME_Number'] = this.mSMENumber;
    data['Bank_Name'] = this.bankName;
    data['Bank_Branch'] = this.bankBranch;
    data['IFSC_Code'] = this.iFSCCode;
    data['AC_Holder_Name'] = this.aCHolderName;
    data['AC_Number'] = this.aCNumber;
    data['Ledger_Type'] = this.ledgerType;
    data['Ledger_Group'] = this.ledgerGroup;
    data['Coupen_Card_No'] = this.coupenCardNo;
    data['Opening_Balance'] = this.openingBalance;
    data['Payment_Terms'] = this.paymentTerms;
    data['Credit_Limit'] = this.creditLimit;
    data['Pay_Bill_By'] = this.payBillBy;
    data['Referral_Detail'] = this.referralDetail;
    data['Conduct_Person_Name'] = this.conductPersonName;
    data['Conduct_Person_Mobile'] = this.conductPersonMobile;
    data['Place_Of_Supply'] = this.placeOfSupply;
    data['State_Code'] = this.stateCode;
    data['Is_Active'] = this.isActive;
    return data;
  }
}
