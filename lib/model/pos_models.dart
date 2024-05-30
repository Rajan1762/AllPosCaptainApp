class SalesPriceModel{
  final String salePriceStatus;
  final String salePriceName;
  final String salePriceTableOrder;
  final String salePriceCaptainOrder;
  final String saleKey;
  bool isSelected = false;
  SalesPriceModel({required this.salePriceStatus,required this.salePriceName, required this.salePriceTableOrder, required this.salePriceCaptainOrder, required this.saleKey});
}

class PosBaseModel {
  bool? status;
  String? statusCode;
  PosData? data;
  String? message;
  Error? error;
  String? log;

  PosBaseModel(
      {this.status,
        this.statusCode,
        this.data,
        this.message,
        this.error,
        this.log});

  PosBaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    data = json['data'] != null ? PosData.fromJson(json['data']) : null;
    message = json['message'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    log = json['log'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    data['log'] = log;
    return data;
  }
}

class PosData {
  String? salePrice1Status;
  String? salePrice1Name;
  String? salePrice1TableOrder;
  String? salePrice1CaptainOrder;
  String? salePrice2Status;
  String? salePrice2Name;
  String? salePrice2TableOrder;
  String? salePrice2CaptainOrder;
  String? salePrice3Status;
  String? salePrice3Name;
  String? salePrice3TableOrder;
  String? salePrice3CaptainOrder;
  String? salePrice4Status;
  String? salePrice4Name;
  String? salePrice4TableOrder;
  String? salePrice4CaptainOrder;
  String? salePrice5Status;
  String? salePrice5Name;
  String? salePrice5TableOrder;
  String? salePrice5CaptainOrder;
  String? taxInclusivePrice;
  String? shiftOpenClose;
  String? totalRoundOff;
  String? salePrice6Status;
  String? salePrice6Name;
  String? salePrice6TableOrder;
  String? salePrice6CaptainOrder;
  String? salePrice7Status;
  String? salePrice7Name;
  String? salePrice7TableOrder;
  String? salePrice7CaptainOrder;
  String? salePrice8Status;
  String? salePrice8Name;
  String? salePrice8TableOrder;
  String? salePrice8CaptainOrder;
  String? salePrice9Status;
  String? salePrice9Name;
  String? salePrice9TableOrder;
  String? salePrice9CaptainOrder;
  String? salePrice10Status;
  String? salePrice10Name;
  String? salePrice10TableOrder;
  String? salePrice10CaptainOrder;
  String? salePrice1GenerateToken;
  String? salePrice2GenerateToken;
  String? salePrice3GenerateToken;
  String? salePrice4GenerateToken;
  String? salePrice5GenerateToken;
  String? salePrice6GenerateToken;
  String? salePrice7GenerateToken;
  String? salePrice8GenerateToken;
  String? salePrice9GenerateToken;
  String? salePrice10GenerateToken;
  String? salePrice1Key;
  String? salePrice2Key;
  String? salePrice3Key;
  String? salePrice4Key;
  String? salePrice5Key;
  String? salePrice6Key;
  String? salePrice7Key;
  String? salePrice8Key;
  String? salePrice9Key;
  String? salePrice10Key;

  PosData(
      {this.salePrice1Status,
        this.salePrice1Name,
        this.salePrice1TableOrder,
        this.salePrice1CaptainOrder,
        this.salePrice2Status,
        this.salePrice2Name,
        this.salePrice2TableOrder,
        this.salePrice2CaptainOrder,
        this.salePrice3Status,
        this.salePrice3Name,
        this.salePrice3TableOrder,
        this.salePrice3CaptainOrder,
        this.salePrice4Status,
        this.salePrice4Name,
        this.salePrice4TableOrder,
        this.salePrice4CaptainOrder,
        this.salePrice5Status,
        this.salePrice5Name,
        this.salePrice5TableOrder,
        this.salePrice5CaptainOrder,
        this.taxInclusivePrice,
        this.shiftOpenClose,
        this.totalRoundOff,
        this.salePrice6Status,
        this.salePrice6Name,
        this.salePrice6TableOrder,
        this.salePrice6CaptainOrder,
        this.salePrice7Status,
        this.salePrice7Name,
        this.salePrice7TableOrder,
        this.salePrice7CaptainOrder,
        this.salePrice8Status,
        this.salePrice8Name,
        this.salePrice8TableOrder,
        this.salePrice8CaptainOrder,
        this.salePrice9Status,
        this.salePrice9Name,
        this.salePrice9TableOrder,
        this.salePrice9CaptainOrder,
        this.salePrice10Status,
        this.salePrice10Name,
        this.salePrice10TableOrder,
        this.salePrice10CaptainOrder,
        this.salePrice1GenerateToken,
        this.salePrice2GenerateToken,
        this.salePrice3GenerateToken,
        this.salePrice4GenerateToken,
        this.salePrice5GenerateToken,
        this.salePrice6GenerateToken,
        this.salePrice7GenerateToken,
        this.salePrice8GenerateToken,
        this.salePrice9GenerateToken,
        this.salePrice10GenerateToken,
        this.salePrice1Key,
        this.salePrice2Key,
        this.salePrice3Key,
        this.salePrice4Key,
        this.salePrice5Key,
        this.salePrice6Key,
        this.salePrice7Key,
        this.salePrice8Key,
        this.salePrice9Key,
        this.salePrice10Key});

  PosData.fromJson(Map<String, dynamic> json) {
    salePrice1Status = json['Sale_Price_1_Status'];
    salePrice1Name = json['Sale_Price_1_Name'];
    salePrice1TableOrder = json['Sale_Price_1_Table_Order'];
    salePrice1CaptainOrder = json['Sale_Price_1_Captain_Order'];
    salePrice2Status = json['Sale_Price_2_Status'];
    salePrice2Name = json['Sale_Price_2_Name'];
    salePrice2TableOrder = json['Sale_Price_2_Table_Order'];
    salePrice2CaptainOrder = json['Sale_Price_2_Captain_Order'];
    salePrice3Status = json['Sale_Price_3_Status'];
    salePrice3Name = json['Sale_Price_3_Name'];
    salePrice3TableOrder = json['Sale_Price_3_Table_Order'];
    salePrice3CaptainOrder = json['Sale_Price_3_Captain_Order'];
    salePrice4Status = json['Sale_Price_4_Status'];
    salePrice4Name = json['Sale_Price_4_Name'];
    salePrice4TableOrder = json['Sale_Price_4_Table_Order'];
    salePrice4CaptainOrder = json['Sale_Price_4_Captain_Order'];
    salePrice5Status = json['Sale_Price_5_Status'];
    salePrice5Name = json['Sale_Price_5_Name'];
    salePrice5TableOrder = json['Sale_Price_5_Table_Order'];
    salePrice5CaptainOrder = json['Sale_Price_5_Captain_Order'];
    taxInclusivePrice = json['Tax_Inclusive_Price'];
    shiftOpenClose = json['Shift_Open_Close'];
    totalRoundOff = json['Total_Round_Off'];
    salePrice6Status = json['Sale_Price_6_Status'];
    salePrice6Name = json['Sale_Price_6_Name'];
    salePrice6TableOrder = json['Sale_Price_6_Table_Order'];
    salePrice6CaptainOrder = json['Sale_Price_6_Captain_Order'];
    salePrice7Status = json['Sale_Price_7_Status'];
    salePrice7Name = json['Sale_Price_7_Name'];
    salePrice7TableOrder = json['Sale_Price_7_Table_Order'];
    salePrice7CaptainOrder = json['Sale_Price_7_Captain_Order'];
    salePrice8Status = json['Sale_Price_8_Status'];
    salePrice8Name = json['Sale_Price_8_Name'];
    salePrice8TableOrder = json['Sale_Price_8_Table_Order'];
    salePrice8CaptainOrder = json['Sale_Price_8_Captain_Order'];
    salePrice9Status = json['Sale_Price_9_Status'];
    salePrice9Name = json['Sale_Price_9_Name'];
    salePrice9TableOrder = json['Sale_Price_9_Table_Order'];
    salePrice9CaptainOrder = json['Sale_Price_9_Captain_Order'];
    salePrice10Status = json['Sale_Price_10_Status'];
    salePrice10Name = json['Sale_Price_10_Name'];
    salePrice10TableOrder = json['Sale_Price_10_Table_Order'];
    salePrice10CaptainOrder = json['Sale_Price_10_Captain_Order'];
    salePrice1GenerateToken = json['Sale_Price_1_Generate_Token'];
    salePrice2GenerateToken = json['Sale_Price_2_Generate_Token'];
    salePrice3GenerateToken = json['Sale_Price_3_Generate_Token'];
    salePrice4GenerateToken = json['Sale_Price_4_Generate_Token'];
    salePrice5GenerateToken = json['Sale_Price_5_Generate_Token'];
    salePrice6GenerateToken = json['Sale_Price_6_Generate_Token'];
    salePrice7GenerateToken = json['Sale_Price_7_Generate_Token'];
    salePrice8GenerateToken = json['Sale_Price_8_Generate_Token'];
    salePrice9GenerateToken = json['Sale_Price_9_Generate_Token'];
    salePrice10GenerateToken = json['Sale_Price_10_Generate_Token'];
    salePrice1Key = json['Sale_Price_1_Key'];
    salePrice2Key = json['Sale_Price_2_Key'];
    salePrice3Key = json['Sale_Price_3_Key'];
    salePrice4Key = json['Sale_Price_4_Key'];
    salePrice5Key = json['Sale_Price_5_Key'];
    salePrice6Key = json['Sale_Price_6_Key'];
    salePrice7Key = json['Sale_Price_7_Key'];
    salePrice8Key = json['Sale_Price_8_Key'];
    salePrice9Key = json['Sale_Price_9_Key'];
    salePrice10Key = json['Sale_Price_10_Key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Sale_Price_1_Status'] = salePrice1Status;
    data['Sale_Price_1_Name'] = salePrice1Name;
    data['Sale_Price_1_Table_Order'] = salePrice1TableOrder;
    data['Sale_Price_1_Captain_Order'] = salePrice1CaptainOrder;
    data['Sale_Price_2_Status'] = salePrice2Status;
    data['Sale_Price_2_Name'] = salePrice2Name;
    data['Sale_Price_2_Table_Order'] = salePrice2TableOrder;
    data['Sale_Price_2_Captain_Order'] = salePrice2CaptainOrder;
    data['Sale_Price_3_Status'] = salePrice3Status;
    data['Sale_Price_3_Name'] = salePrice3Name;
    data['Sale_Price_3_Table_Order'] = salePrice3TableOrder;
    data['Sale_Price_3_Captain_Order'] = salePrice3CaptainOrder;
    data['Sale_Price_4_Status'] = salePrice4Status;
    data['Sale_Price_4_Name'] = salePrice4Name;
    data['Sale_Price_4_Table_Order'] = salePrice4TableOrder;
    data['Sale_Price_4_Captain_Order'] = salePrice4CaptainOrder;
    data['Sale_Price_5_Status'] = salePrice5Status;
    data['Sale_Price_5_Name'] = salePrice5Name;
    data['Sale_Price_5_Table_Order'] = salePrice5TableOrder;
    data['Sale_Price_5_Captain_Order'] = salePrice5CaptainOrder;
    data['Tax_Inclusive_Price'] = taxInclusivePrice;
    data['Shift_Open_Close'] = shiftOpenClose;
    data['Total_Round_Off'] = totalRoundOff;
    data['Sale_Price_6_Status'] = salePrice6Status;
    data['Sale_Price_6_Name'] = salePrice6Name;
    data['Sale_Price_6_Table_Order'] = salePrice6TableOrder;
    data['Sale_Price_6_Captain_Order'] = salePrice6CaptainOrder;
    data['Sale_Price_7_Status'] = salePrice7Status;
    data['Sale_Price_7_Name'] = salePrice7Name;
    data['Sale_Price_7_Table_Order'] = salePrice7TableOrder;
    data['Sale_Price_7_Captain_Order'] = salePrice7CaptainOrder;
    data['Sale_Price_8_Status'] = salePrice8Status;
    data['Sale_Price_8_Name'] = salePrice8Name;
    data['Sale_Price_8_Table_Order'] = salePrice8TableOrder;
    data['Sale_Price_8_Captain_Order'] = salePrice8CaptainOrder;
    data['Sale_Price_9_Status'] = salePrice9Status;
    data['Sale_Price_9_Name'] = salePrice9Name;
    data['Sale_Price_9_Table_Order'] = salePrice9TableOrder;
    data['Sale_Price_9_Captain_Order'] = salePrice9CaptainOrder;
    data['Sale_Price_10_Status'] = salePrice10Status;
    data['Sale_Price_10_Name'] = salePrice10Name;
    data['Sale_Price_10_Table_Order'] = salePrice10TableOrder;
    data['Sale_Price_10_Captain_Order'] = salePrice10CaptainOrder;
    data['Sale_Price_1_Generate_Token'] = salePrice1GenerateToken;
    data['Sale_Price_2_Generate_Token'] = salePrice2GenerateToken;
    data['Sale_Price_3_Generate_Token'] = salePrice3GenerateToken;
    data['Sale_Price_4_Generate_Token'] = salePrice4GenerateToken;
    data['Sale_Price_5_Generate_Token'] = salePrice5GenerateToken;
    data['Sale_Price_6_Generate_Token'] = salePrice6GenerateToken;
    data['Sale_Price_7_Generate_Token'] = salePrice7GenerateToken;
    data['Sale_Price_8_Generate_Token'] = salePrice8GenerateToken;
    data['Sale_Price_9_Generate_Token'] = salePrice9GenerateToken;
    data['Sale_Price_10_Generate_Token'] = salePrice10GenerateToken;
    data['Sale_Price_1_Key'] = salePrice1Key;
    data['Sale_Price_2_Key'] = salePrice2Key;
    data['Sale_Price_3_Key'] = salePrice3Key;
    data['Sale_Price_4_Key'] = salePrice4Key;
    data['Sale_Price_5_Key'] = salePrice5Key;
    data['Sale_Price_6_Key'] = salePrice6Key;
    data['Sale_Price_7_Key'] = salePrice7Key;
    data['Sale_Price_8_Key'] = salePrice8Key;
    data['Sale_Price_9_Key'] = salePrice9Key;
    data['Sale_Price_10_Key'] = salePrice10Key;
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