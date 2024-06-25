// import 'package:flutter/widgets.dart';
// import '../../model/cart_models/customer_list_model.dart';
// import '../../model/order_models/order_response_model.dart';

// class OrderProvider extends ChangeNotifier{
//   List<OrderDataModel>? _orderDataModelList;
//
//   List<OrderDataModel>? get orderDataModelList => _orderDataModelList;
//
//   set orderDataModelList(List<OrderDataModel>? value) {
//     _orderDataModelList = value;
//     notifyListeners();
//   }
//   setTableData({required OrderDataModel orderDataModel,required String floorName,required String tableName})
//   {
//     orderDataModel.floorName = floorName;
//     orderDataModel.tableName = tableName;
//     notifyListeners();
//   }
//
//   removeFloorTable({required OrderDataModel orderDataModel})
//   {
//     orderDataModel.floorName = null;
//     orderDataModel.tableName = null;
//     notifyListeners();
//   }

//   setSelectUserData({required OrderDataModel orderDataModel, required CustomerData customerData})
//   {
//     orderDataModel.ledgerName = customerData.ledgerName;
//     orderDataModel.mobile = customerData.mobile;
//     notifyListeners();
//   }
// }
