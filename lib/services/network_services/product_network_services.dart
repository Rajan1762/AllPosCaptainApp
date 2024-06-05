import 'dart:convert';
import 'package:captain_app/model/cash_register_model.dart';
import 'package:captain_app/model/product_models/new_order_kot_model.dart';
import 'package:captain_app/utils/common_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../model/product_models/product_model.dart';
import '../../utils/constants.dart';
import '../provider_services/product_provider_service.dart';

Future postOrderKotData({required NewOrderKotModel newOrderKotModel}) async{
  print('postOrderKotData = $newOrderKotURL');
  printFull('json.encode(newOrderKotModel.toJson()) = ${json.encode(newOrderKotModel.toJson())}');
  // print('json.encode(newOrderKotModel.toJson()) = ${json.encode(newOrderKotModel.toJson())}');
  var response = await http.post(Uri.parse(newOrderKotURL),headers: {'Content-Type': 'application/json','OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'});
  print("getProductListData status code = ${response.statusCode}\nbody = ${response.body}");
  if(response.statusCode == 200 && response.body!="")
  {
      return ProductBaseModel.fromJson(json.decode(response.body));
  }
  return null;
}

Future<ProductBaseModel?> getProductListData() async{
  print('productListUrl = $productListUrl');
  var response = await http.get(Uri.parse(productListUrl),headers: {'OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'});
  print("getProductListData status code = ${response.statusCode}\nbody = ${response.body}");
  if(response.statusCode == 200 && response.body!="")
  {
       return ProductBaseModel.fromJson(json.decode(response.body));
  }
  return null;
}

Future<CashRegisterModel?> getCashRegisterData({required String tillCode}) async{
  print("getCashRegisterData url = $cashRegisterNumberFetchURL$tillCode");
  var response = await http.get(Uri.parse('$cashRegisterNumberFetchURL$tillCode'),headers: {'OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'});
  print("getCashRegisterData status code = ${response.statusCode}body = ${response.body}");
  printFull('body = ${response.body}');
  if(response.statusCode == 200 && response.body!="")
  {
    return CashRegisterModel.fromJson(json.decode(response.body));
  }
  return null;
}

