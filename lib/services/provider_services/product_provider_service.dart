import 'package:flutter/cupertino.dart';
import '../../model/product_model.dart';
import '../../utils/common_values.dart';

class ProductProviderService extends ChangeNotifier{
  final List<String> _categoryList = [];
  final Map<String,List<ProductList>> _categoryMap = {};

  final List<ProductList> _cartList = [];

  List<ProductList> get cartList => _cartList;

  addToCart(ProductList value,int index) {
    _categoryMap[selectedCategoryType]?[index].quantity += 1;
    if(!_cartList.contains(value))
      {
        _cartList.add(value);
      }else{
      for(int i = 0; i < _cartList.length; i++)
        {
          if(_cartList[i]==value)
            {
              _cartList[i].quantity += 1;
            }
        }
    }
    notifyListeners();
  }

  removeFromCart(ProductList value,int index) {
    if(_cartList.contains(value))
      {
        for(int i = 0; i < _cartList.length; i++)
        {
          if(_cartList[i]==value)
          {
            if(_cartList[i].quantity>1)
              {
                _cartList[i].quantity -= 1;
              }else{
              _cartList.remove(value);
            }
          }
        }
      }
    if((_categoryMap[selectedCategoryType]?[index].quantity)! > 1)
    {
      _categoryMap[selectedCategoryType]?[index].quantity -= 1;
      notifyListeners();
    }else{
      changeAddStatus(index);
    }
    //notifyListeners();
  }

  deleteFromCart(ProductList value)
  {
    _cartList.remove(value);
    notifyListeners();
  }

  Map<String, List<ProductList>> get categoryMap => _categoryMap;
  List<String> get categoryList => _categoryList;

  changeCategoryTypeValue(String value){
    selectedCategoryType = value;
    notifyListeners();
  }

  set productBaseModel(ProductBaseModel? value) {
    // _productBaseModelVal = value;
    // _categoryList = value?.data?.categoryList;
    if(value?.data != null)
      {
        _categoryMap['All'] = value!.data!.productList ?? [];
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

  // set categoryList(List<CategoryList>? value) {
  //   _categoryList = value;
  // }

  // addQuantity(int index){
  //   _categoryMap[selectedCategoryType]?[index].quantity += 1;
  //    // _productBaseModelVal?.data!.productList?[index].quantity += 1;
  //   notifyListeners();
  // }

  changeAddStatus(int index)
  {
    _categoryMap[selectedCategoryType]?[index].addStatus = !(_categoryMap[selectedCategoryType]?[index].addStatus)!;
    _cartList.add(_categoryMap[selectedCategoryType]![index]);
    notifyListeners();
  }

  // removeQuantity(int index)
  // {
  //   if((_categoryMap[selectedCategoryType]?[index].quantity)! > 1)
  //   {
  //     _categoryMap[selectedCategoryType]?[index].quantity -= 1;
  //     notifyListeners();
  //   }else{
  //     changeAddStatus(index);
  //   }
  // }
}
