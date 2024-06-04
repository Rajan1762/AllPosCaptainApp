import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/order_models/order_details_response_model.dart';
import '../../model/order_models/order_response_model.dart';
import '../../utils/constants.dart';

Future cancelSingleProduct({required String saleOrderProductID}) async{
  print('cancelSingleProductUrl = $cancelSingleProductUrl , saleOrderProductID = $saleOrderProductID');
  print('Url Body = ${json.encode([{
    "Sale_Order_Product_Id":saleOrderProductID
  }])}');
  var response = await http.put(Uri.parse(cancelSingleProductUrl),headers: {'Content-Type': 'application/json','OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'},
  body: json.encode([{
    "Sale_Order_Product_Id":saleOrderProductID
  }]));
  print("cancelSingleProductUrl status code = ${response.statusCode}\nbody = ${response.body}");
  if(response.statusCode == 200 && response.body!="")
  {
    // OrderResponseModel orderResponseModel = OrderResponseModel.fromJson(json.decode(response.body));
    // return orderResponseModel.data;
  }
  return null;
}

Future cancelAllProduct({required String saleOrderNumber}) async{
  print('cancelAllProduct = $cancelAllProductOrderURL$saleOrderNumber , saleOrderProductID = $saleOrderNumber');
  var response = await http.put(Uri.parse('$cancelAllProductOrderURL$saleOrderNumber'),headers: {'OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'},);
  print("cancelAllProduct status code = ${response.statusCode}\nbody = ${response.body}");
  if(response.statusCode == 200 && response.body!="")
  {
    return true;
    // OrderResponseModel orderResponseModel = OrderResponseModel.fromJson(json.decode(response.body));
    // return orderResponseModel.data;
  }
  return false;
}

Future<OrderDetailResponseModels?> getOrderDetailData(String saleOrderNumber) async{
  print('orderDetailURL = $orderDetailURL$saleOrderNumber');
  var response = await http.get(Uri.parse('$orderDetailURL$saleOrderNumber'),headers: {'OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'});
  print("getOrderDetailData status code = ${response.statusCode}\nbody = ${response.body}");
  if(response.statusCode == 200 && response.body!="")
  {
    OrderDetailBaseModel orderDetailBaseModel = OrderDetailBaseModel.fromJson(json.decode(response.body));
    return orderDetailBaseModel.data;
    // OrderResponseModel orderResponseModel = OrderResponseModel.fromJson(json.decode(response.body));
    // return orderResponseModel.data;
  }
  return null;
}

Future<List<OrderDataModel>?> getOrderListData() async{
  print('getOrderListData = $getOrdersURL$kBranchCodeVal');
  var response = await http.get(Uri.parse('$getOrdersURL$kBranchCodeVal'),headers: {'OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'});
  print("getOrderListData status code = ${response.statusCode}\nbody = ${response.body}");
  if(response.statusCode == 200 && response.body!="")
  {
    OrderResponseModel orderResponseModel = OrderResponseModel.fromJson(json.decode(response.body));
    return orderResponseModel.data;
  }
  return null;
}
