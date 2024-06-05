import 'package:captain_app/services/provider_services/floor_table_provider_service.dart';
import 'package:captain_app/utils/colors.dart';
import 'package:captain_app/utils/common_functions.dart';
import 'package:captain_app/utils/custom_widgets/full_screen_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/pos_models.dart';
import '../../model/shift_register_model.dart';
import '../../services/network_services/home_screen_services.dart';
import '../../services/provider_services/bottom_provider.dart';
import '../../utils/common_values.dart';
import '../../utils/constants.dart';
import '../../utils/custom_widgets/notification_widget.dart';
import '../list_screen/list_screen.dart';
import '../order_screens/order_screen.dart';
import '../setting/setting_screen.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  bool tillSelectedStatus = false;
  // final List<SalesPriceModel> salesPriceModelList = [];

  _getTillData(BuildContext context) async {
    if (kTillVal == "") {
        await getTillData().then((v)async{
          tillBaseModel = v;
          PosBaseModel? posBaseModel= await getPOSData();
          ShiftRegisterModel? shiftRegisterModel = await getShiftRegisterData(branchCode: kBranchCodeVal);
          if(shiftRegisterModel==null||posBaseModel==null)
          {
            throw CustomException('Something went wrong try again later');
          }
          shiftRegisterNumber = shiftRegisterModel.data?.shiftRegisterNumber;
        });
    }
  }

  _getFloorTableData(BuildContext context) async {
    try {
      getFloorTableData(context: context).then((z) async {
        if(context.mounted)
          {
            await _getTillData(context);
            setState(() {});
          }
      });
    } catch (e) {
      if(context.mounted)
      {
        print('Exception Occurred = $e');
        showErrorAlertDialog(context: context, message: e.toString(),onPressed: (){
          _emptyDataAndNavigateToLoginScreen(context);
        });
      }
    }
  }

  _emptyDataAndNavigateToLoginScreen(BuildContext context)async{
    kOrganizationCodeVal = "";
    kEmployeeCodeVal = "";
    kEmployeeNameVal = "";
    kIsCaptainVal = "";
    kAuthTokenVal = "";
    kBranchCodeVal = "";
    kTillVal = "";
    selectedCategoryType = 'ITEMS';
    tillBaseModel = null;
    selectedFloor = null;
    selectedTable = null;
    numberOfChairsInSelectedTable = null;
    customerMobileNumber = null;
    customerEmailId = null;
    customerLedgerCode = null;
    customerLedgerName = null;
    customerGSTNumber = null;
    customerAddress = null;
    posBaseModel = null;
    shiftRegisterNumber = null;
    kEnableCashRegisterVal = 'No';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    if(context.mounted)
      {
        Navigator.of(context).pop();
      }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _getFloorTableData(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Consumer2<BottomProvider,FloorTableProviderService>(
        builder: (context, bottomProvider,floorTableProvider, _) {
      return Scaffold(
        body: floorTableProvider.floorList.isNotEmpty ? bottomProvider.bottomIndex == 0
            ? const OrderScreen()
            : bottomProvider.bottomIndex == 1
                ? const ListScreen()
                : const SettingScreen() : const FullScreenLoadingWidget(isLoading: true),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_rounded),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: bottomProvider.bottomIndex,
          selectedItemColor: appComboColor,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey.shade600,
            onTap: (index) {
            print('provider.bottomIndex = ${bottomProvider.bottomIndex}, index = $index');
                 bottomProvider.bottomIndex = index;
            }),
      );
    }));
  }
}
// body: provider.bottomIndex == 0 ?
// const OrderScreen() : provider.bottomIndex == 1 ? const ListScreen() : const SettingScreen();
// bottomNavigationBar: BottomNavigationBar(
// items: const <BottomNavigationBarItem>[
// BottomNavigationBarItem(
// icon: Icon(Icons.receipt_long_outlined, size: 20),
// label: 'Order',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.receipt_long_outlined, size: 20),
// label: 'List',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.settings, size: 20),
// label: 'Settings',
// ),
// ],
// currentIndex: provider.bottomBarIndex,
// selectedItemColor: appThemeColor,
// showUnselectedLabels: true,
// unselectedItemColor: Colors.grey.shade600,
// onTap: (index) {
// setState(() {
// provider.bottomBarIndex = index;
// });
// },
// )