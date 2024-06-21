import 'dart:convert';
import 'package:captain_app/model/errorResponseModel.dart';
import 'package:captain_app/model/shift_register_model.dart';
import 'package:captain_app/utils/common_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/floor_table_model.dart';
import '../../model/pos_models.dart';
import '../../model/supplier_models.dart';
import '../../model/till_model.dart';
import '../../utils/common_values.dart';
import '../../utils/constants.dart';
import 'package:http/http.dart' as http;
import '../provider_services/floor_table_provider_service.dart';

Future<ErrorResponseModel> getFloorTableData({required BuildContext context}) async {
  print("getFloorTableData url = $baseUrl$floorTableUrl");
  try {
    var response = await http.get(
        Uri.parse("$baseUrl$floorTableUrl"),
        headers: {'OID': kOrganizationCodeVal, 'EID': kEmployeeCodeVal, 'Authorization': 'Bearer $kAuthTokenVal'}
    );
    print("getFloorTableData status code = ${response.statusCode}\nbody = ${response.body}");
    if (response.statusCode == 401 || response.statusCode != 200 || response.body.isEmpty) {
      return ErrorResponseModel(obj: null, errorMessage: kSessionTimeOutTitle);
    }
    var floorTableBaseModel = FloorTableBaseModel.fromJson(json.decode(response.body));
    var floorNameList = floorTableBaseModel.data!.map((e) => e.floorName ?? '').toSet().toList();
    var listOfFloorTableListVal = floorNameList.map((name) =>
        floorTableBaseModel.data!.where((e) => e.floorName == name).toList()
    ).toList();
    if (context.mounted) {
      Provider.of<FloorTableProviderService>(context, listen: false)
          .setFloorTableListValues(floorTableList: listOfFloorTableListVal, floorList: floorNameList);
    }
    return ErrorResponseModel(obj: floorTableBaseModel, errorMessage: null);
  } catch (e) {
    return ErrorResponseModel(obj: null, errorMessage: e.toString());
  }
}

Future<SupplierBaseModel?> getSupplierData({required BuildContext context}) async{
  print("getSupplierData url = $baseUrl$supplierUrl");
  var response = await http.get(Uri.parse("$baseUrl$supplierUrl"),headers: {'OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'});
  print("getSupplierData status code = ${response.statusCode}\nbody = ${response.body}");
  if(response.statusCode == 200 && response.body!="")
  {
    return SupplierBaseModel.fromJson(json.decode(response.body));
  }
  return null;
}

Future<ErrorResponseModel> getTillData() async{
  print("tillListUrl url = $tillListUrl");
  ErrorResponseModel errorResponseModel;
  try{
    var response = await http.get(Uri.parse(tillListUrl),headers: {'OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'});
    print("getTillData status code = ${response.statusCode}\nbody = ${response.body}");
    
    errorResponseModel =  response.statusCode == 401 || (response.statusCode != 200 || response.body.isEmpty)
        ? ErrorResponseModel(obj: null, errorMessage: kSessionTimeOutTitle)
        : ErrorResponseModel(obj: TillBaseModel.fromJson(json.decode(response.body)), errorMessage: null);
  }catch(e){
    errorResponseModel = ErrorResponseModel(obj: null, errorMessage: e.toString());
  }
  return errorResponseModel;
  // var response = await http.get(Uri.parse(tillListUrl),headers: {'OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'});
  // print("getTillData status code = ${response.statusCode}\nbody = ${response.body}");
  // if(response.statusCode == 200 && response.body!="")
  // {
  //   // final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // prefs.setString(kTillString, tillBaseModel.data?.first.tillCode ?? '');
  //   return TillBaseModel.fromJson(json.decode(response.body));
  // }
  // return null;
}

Future<ErrorResponseModel> getPOSData() async{
  print("getPOSData url = $posUrl");
  ErrorResponseModel errorResponseModel;
  try{
    var response = await http.get(Uri.parse(posUrl),headers: {'OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'});
    print("getPOSData status code = ${response.statusCode} body = ${response.body}");
    printFull('body = ${response.body}');
    errorResponseModel =  response.statusCode == 401 || (response.statusCode != 200 || response.body.isEmpty)
        ? ErrorResponseModel(obj: null, errorMessage: kSessionTimeOutTitle)
        : ErrorResponseModel(obj: PosBaseModel.fromJson(json.decode(response.body)), errorMessage: null);
  }catch(e){
    errorResponseModel = ErrorResponseModel(obj: null, errorMessage: e.toString());
  }
  return errorResponseModel;
}

Future<ShiftRegisterModel?> getShiftRegisterData({required String branchCode}) async{
  print("getShiftRegisterData url = $shiftNumberFetchURL$branchCode");
  var response = await http.get(Uri.parse('$shiftNumberFetchURL$branchCode'),headers: {'OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'});
  print("getShiftRegisterData status code = ${response.statusCode}body = ${response.body}");
  printFull('body = ${response.body}');
  if(response.statusCode == 200 && response.body!="")
  {
    return ShiftRegisterModel.fromJson(json.decode(response.body));
  }
  return null;
}
