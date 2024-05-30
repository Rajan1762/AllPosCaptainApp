import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/order_models/order_detail_response_model.dart';
import '../../model/order_models/order_response_model.dart';
import '../../utils/constants.dart';

Future<List<OrderDetailResponseModel>?> getOrderDetailData(String saleOrderNumber) async{
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
