import 'package:captain_app/services/provider_services/floor_table_provider_service.dart';
import 'package:captain_app/utils/colors.dart';
import 'package:captain_app/utils/custom_widgets/full_screen_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      tillBaseModel = await getTillData();
    }
  }

  _getFloorTableData(BuildContext context) async {
    try {
      getFloorTableData(context: context).then((z) async {
        setState(() {});
      });
    } catch (e) {
      if(context.mounted)
      {
        print('Exception Occurred = $e');
        showErrorAlertDialog(context: context, message: e.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _getFloorTableData(context);
    _getTillData(context);
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
