import 'package:captain_app/list_screen/list_screen_old.dart';
import 'package:captain_app/order_screens/order_screen.dart';
import 'package:captain_app/setting/setting_screen.dart';
import 'package:captain_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../list_screen/list_screen.dart';
import '../services/network_services/home_screen_services.dart';
import '../services/provider_services/bottom_provider.dart';
import '../utils/common_values.dart';
import '../utils/constants.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _getTillData(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Consumer<BottomProvider>(
        builder: (context, provider, _) {
      return Scaffold(
        body: provider.bottomIndex == 0
            ? const OrderScreen()
            : provider.bottomIndex == 1
                ? const ListScreen()
                : const SettingScreen(),
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
          currentIndex: provider.bottomIndex,
          selectedItemColor: appComboColor,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey.shade600,
            onTap: (index) {
            print('provider.bottomIndex = ${provider.bottomIndex}, index = $index');
                 provider.bottomIndex = index;
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
