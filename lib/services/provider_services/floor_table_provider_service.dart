import 'package:flutter/material.dart';
import '../../model/floor_table_model.dart';
import '../../utils/common_values.dart';

enum FloorTableTypeEnum { availableTables, bookedTable }

class FloorTableProviderService extends ChangeNotifier{
  String? _selectedFloor;
  String? get selectedFloor => _selectedFloor;
  List<FloorTableModel> _selectedFloorTableList = [];

  List<FloorTableModel> get selectedFloorTableList => _selectedFloorTableList;

  set selectedFloor(String? floorName) {
    _selectedFloor = floorName;
    _selectedFloorTableList = _listOfFloorTableListVal.expand((value) => value.where((data) => data.floorName == floorName)).toList();
    notifyListeners();
  }

  List<List<FloorTableModel>> _listOfFloorTableListVal = [];
  List<String> _floorList = [];
  List<String> get floorList => _floorList;

  setFloorTableListValues({required List<List<FloorTableModel>> floorTableList, required List<String> floorList})
  {
    _listOfFloorTableListVal = floorTableList;
    _floorList = floorList;
    _selectedFloor = _floorList.first;
    _selectedFloorTableList = _listOfFloorTableListVal.expand((value) => value.where((data) => data.floorName == _selectedFloor)).toList();
    notifyListeners();
  }
}
