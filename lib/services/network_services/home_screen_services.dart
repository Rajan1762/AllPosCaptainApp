import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../model/floor_table_model.dart';
import '../../model/pos_models.dart';
import '../../model/supplier_models.dart';
import '../../model/till_model.dart';
import '../../utils/common_values.dart';
import '../../utils/constants.dart';
import 'package:http/http.dart' as http;
import '../provider_services/floor_table_provider_service.dart';

Future<bool> getFloorTableData({required BuildContext context}) async{
  print('kAuthTokenVal = $kAuthTokenVal');
  print("getFloorTableData url = $baseUrl$floorTableUrl");
  var response = await http.get(Uri.parse("$baseUrl$floorTableUrl"),headers: {'OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'});
  print("getFloorTableData status code = ${response.statusCode}\nbody = ${response.body}");
  if(response.statusCode == 200 && response.body!=""){}
  // {
  //   FloorTableBaseModel floorTableBaseModel = FloorTableBaseModel.fromJson(json.decode(response.body));
  //   final List<String?> floorNameList = floorTableBaseModel.data!.map((element) => element.floorName).toSet().toList();
  //   for (var floorName in floorNameList) {
  //     List<FloorTableModel> floorList = floorTableBaseModel.data!.where((element) => element.floorName == floorName).toList();
  //     listOfFloorTableListVal.add(floorList);
  //   }
  //   if(context.mounted)
  //     {
  //       FloorTableProviderService provider = Provider.of<FloorTableProviderService>(context,listen: false);
  //       provider.listOfFloorTableList = listOfFloorTableListVal;
  //     }
  // }
  return false;
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

Future<TillBaseModel?> getTillData() async{
  print("tillListUrl url = $tillListUrl");
  var response = await http.get(Uri.parse(tillListUrl),headers: {'OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'});
  print("getTillData status code = ${response.statusCode}\nbody = ${response.body}");
  if(response.statusCode == 200 && response.body!="")
  {
    return TillBaseModel.fromJson(json.decode(response.body));
  }
  return null;
}

Future<PosBaseModel?> getPOSData() async{
  print("getPOSData url = $posUrl");
  var response = await http.get(Uri.parse(posUrl),headers: {'OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'});
  print("getPOSData status code = ${response.statusCode}\nbody = ${response.body}");
  if(response.statusCode == 200 && response.body!="")
  {
    return PosBaseModel.fromJson(json.decode(response.body));
  }
  return null;
}


