import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/cart_models/customer_list_model.dart';
import '../../model/cart_models/save_edit_user_response_model.dart';
import '../../model/cart_models/user_save_edit_model.dart';
import '../../utils/constants.dart';

Future<List<CustomerData>?> getCustomerListData() async{
  print('customerListUrl = $customerListUrl');
  var response = await http.get(Uri.parse(customerListUrl),headers: {'OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'});
  print("getProductListData status code = ${response.statusCode}\nbody = ${response.body}");
  if(response.statusCode == 200 && response.body!="")
  {
    return CustomerListModel.fromJson(json.decode(response.body)).data;
  }
  return null;
}

Future<bool> postNewUserData({required UserSaveEditModel userModel}) async{
  print('newUserSaveURL = $newUserSaveURL');
  var response = await http.post(Uri.parse(newUserSaveURL),
      body: json.encode(userModel.toJson()),
      headers: {'Content-Type': 'application/json','OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'});
  print("postNewUserData status code = ${response.statusCode}\nbody = ${response.body}");
  if(response.statusCode == 200 && response.body!="")
  {
    SaveEditUserResponseModel saveEditUserResponseModel = SaveEditUserResponseModel.fromJson(json.decode(response.body));
    if(saveEditUserResponseModel.message == 'New Ledger Created Successfully.')
      {
        return true;
      }
  }
  return false;
}

Future<bool> updateUserData({required UserSaveEditModel userModel}) async{
  print('updateUserURL = $updateUserURL');
  var response = await http.put(Uri.parse(updateUserURL),
      body: json.encode(userModel.toJson()),
      headers: {'Content-Type': 'application/json','OID': kOrganizationCodeVal,'EID': kEmployeeCodeVal,'Authorization': 'Bearer $kAuthTokenVal'});
  print("postNewUserData status code = ${response.statusCode}\nbody = ${response.body}");
  if(response.statusCode == 200 && response.body!="")
  {
    SaveEditUserResponseModel saveEditUserResponseModel = SaveEditUserResponseModel.fromJson(json.decode(response.body));
    if(saveEditUserResponseModel.message == 'Ledger Details Updated Successfully.')
    {
      return true;
    }
  }
  return false;
}