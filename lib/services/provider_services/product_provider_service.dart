import 'package:flutter/cupertino.dart';
import '../../model/cart_models/customer_list_model.dart';
import '../../model/order_models/order_response_model.dart';
import '../../model/product_models/product_model.dart';
import '../../utils/common_values.dart';

class ProductProviderService extends ChangeNotifier{
  final List<String> _categoryList = [];
  final Map<String,List<ProductList>> _categoryMap = {};
  final List<ProductList> _cartList = [];
  List<ProductList> _filteredValues = [];
  List<ProductList> get filteredValues => _filteredValues;

  List<OrderDataModel>? _orderDataModelList;

  List<OrderDataModel>? get orderDataModelList => _orderDataModelList;

  Map<String, List<ProductList>> get categoryMap => _categoryMap;
  List<String> get categoryList => _categoryList;

  changeCategoryTypeValue(String value){
    selectedCategoryType = value;
    _filteredValues = categoryMap[selectedCategoryType]!;
    notifyListeners();
  }

  void filterSearchValues(String s) {
    _filteredValues = categoryMap[selectedCategoryType]!
          .where((product) => (product.productName ?? '').toLowerCase().startsWith(s))
          .toList();
    notifyListeners();
  }

  set productBaseModel(ProductBaseModel? value) {
    if(value?.data != null)
    {
      _categoryMap['All'] = value!.data!.productList ?? [];
      _filteredValues = _categoryMap['All'] ?? [];
      value.data?.productList?.forEach((element) {
        if(!_categoryMap.containsKey(element.productCategory))
        {
          _categoryList.add(element.productCategory??'');
          _categoryMap[element.productCategory??''] = [];
          print('element.productCategory = ${element.productCategory}');
        }
        _categoryMap[element.productCategory]?.add(element);
      });
    }
    notifyListeners();
  }

  changeAddStatus(int index)
  {
    _categoryMap[selectedCategoryType]?[index].addStatus = !(_categoryMap[selectedCategoryType]?[index].addStatus)!;
    _cartList.add(_categoryMap[selectedCategoryType]![index]);
    notifyListeners();
  }

  set orderDataModelList(List<OrderDataModel>? value) {
    _orderDataModelList = value;
    notifyListeners();
  }

  setOrderFloorTableData({required OrderDataModel orderDataModel,required String floorName,required String tableName})
  {
    orderDataModel.floorName = floorName;
    orderDataModel.tableName = tableName;
    notifyListeners();
  }

  removeOrderFloorTable({required OrderDataModel orderDataModel})
  {
    orderDataModel.floorName = null;
    orderDataModel.tableName = null;
    notifyListeners();
  }

  setSelectUserData({required OrderDataModel orderDataModel, required CustomerData customerData})
  {
    orderDataModel.ledgerName = customerData.ledgerName;
    orderDataModel.mobile = customerData.mobile;
    notifyListeners();
  }

  removeUserData({required OrderDataModel orderDataModel})
  {
    orderDataModel.ledgerName = null;
    orderDataModel.mobile = null;
    notifyListeners();
  }

  List<ProductList> get cartList => _cartList;
  int _overAllQuantity = 0;

  int get overAllQuantity => _overAllQuantity;

  calculateOverAllQuantity(){
    _overAllQuantity = 0;
    for (var element in _cartList) {
      _overAllQuantity += element.quantity;
    }
    notifyListeners();
  }

  addToCart(ProductList value) {
    int quantity = 0;
    value.initialSelectionStatus = true;
    if(!_cartList.contains(value))
      {
        _cartList.add(value);
      }else{
      for(int i = 0; i < _cartList.length; i++)
        {
          if(_cartList[i]==value)
            {
              _cartList[i].quantity += 1;
              quantity = _cartList[i].quantity;
            }
        }
    }

    filteredValues.map((element){
      if(element == value)
          {
            return element.quantity = quantity;
          }
      return element;
    });
    calculateOverAllQuantity();
  }

  removeFromCart(ProductList value) {
    int quantity = 0;
    if(_cartList.contains(value))
      {
        for(int i = 0; i < _cartList.length; i++)
        {
          if(_cartList[i]==value)
          {
            if(_cartList[i].quantity>1)
              {
                _cartList[i].quantity -= 1;
                quantity = _cartList[i].quantity;
              }else{
              value.initialSelectionStatus = false;
              _cartList.remove(value);
            }
          }
        }
      }
    filteredValues.map((element){
      if(element == value)
      {
        return element.quantity = quantity;
      }
      return element;
    });
    calculateOverAllQuantity();
  }

  deleteFromCart(ProductList value)
  {
    _cartList.remove(value);
    notifyListeners();
  }
}

