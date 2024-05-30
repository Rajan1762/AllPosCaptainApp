import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../model/product_model.dart';
import '../../utils/constants.dart';
import '../provider_services/product_provider_service.dart';

Future<ProductBaseModel?> getProductListData(BuildContext context) async{
  print('productListUrl = $productListUrl');
  var response = await http.get(Uri.parse(productListUrl),headers: {'OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'});
  print("getProductListData status code = ${response.statusCode}\nbody = ${response.body}");
  if(response.statusCode == 200 && response.body!="")
  {
    if(context.mounted)
      {
       return ProductBaseModel.fromJson(json.decode(response.body));
      }
  }
  return null;
}
