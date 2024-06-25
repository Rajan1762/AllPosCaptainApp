import 'package:captain_app/model/errorResponseModel.dart';
import 'package:captain_app/screens/profile_screens/login_screen.dart';
import 'package:captain_app/services/provider_services/floor_table_provider_service.dart';
import 'package:captain_app/utils/colors.dart';
import 'package:captain_app/utils/common_functions.dart';
import 'package:captain_app/utils/custom_widgets/full_screen_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/cash_register_model.dart';
import '../../model/pos_models.dart';
import '../../model/shift_register_model.dart';
import '../../services/network_services/home_screen_services.dart';
import '../../services/network_services/product_network_services.dart';
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
  bool _isLoading = false;
  // final List<SalesPriceModel> salesPriceModelList = [];

  _getTillData(BuildContext context) async {
    if (kTillVal == "") {
        await getTillData().then((v)async{
          ErrorResponseModel tillErrorResponseModel = v;
          if (context.mounted) {
            if (tillErrorResponseModel.errorMessage != null) {
              showErrorAlertDialog(context: context, message: tillErrorResponseModel.errorMessage!);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (Route<dynamic> route) => false,
              );
            } else if (tillErrorResponseModel.obj != null) {
              tillBaseModel = tillErrorResponseModel.obj;
            }
          }
          ErrorResponseModel posResponseModel = await getPOSData();
          if (context.mounted) {
            if (posResponseModel.errorMessage != null) {
              showErrorAlertDialog(context: context, message: posResponseModel.errorMessage!);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (Route<dynamic> route) => false,
              );
            } else if (posResponseModel.obj != null) {
              PosBaseModel? posBaseModel = posResponseModel.obj;
            }
            ShiftRegisterModel? shiftRegisterModel = await getShiftRegisterData(branchCode: kBranchCodeVal);
            if(shiftRegisterModel==null)
            {
              throw CustomException('Something went wrong while retrieving ShiftRegister number');
            }
            shiftRegisterNumber = shiftRegisterModel.data?.shiftRegisterNumber;
          }
        });
    }
  }

  _getFloorTableData(BuildContext context) async {
    try {
      ErrorResponseModel errorResponseModel = await getFloorTableData(context: context);
      if (!context.mounted) return;
      if (errorResponseModel.errorMessage != null) {
        if (errorResponseModel.errorMessage == kSessionTimeOutTitle) {
          showCustomAlertDialog(
            context: context,
            title: errorResponseModel.errorMessage!,
            onTap: () => _emptyDataAndNavigateToLoginScreen(context),
          );
        } else {
          showErrorAlertDialog(context: context, message: errorResponseModel.errorMessage!);
        }
      } else if (errorResponseModel.obj != null) {
        await _getTillData(context);
        setState(() {});
      }
    } catch (e) {
      if (context.mounted) {
        print('[][]][]Exception Occurred = $e');
        showErrorAlertDialog(
          context: context,
          message: e.toString(),
        );
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
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
              (Route<dynamic> route) => false,
        );
      }
  }

  Future<void> _getCashRegisterData(BuildContext context) async {
    if (kEnableCashRegisterVal != 'No' && kEnableCashRegisterVal != '') {
      setState(() => _isLoading = true);
      try {
        CashRegisterModel? cashRegisterModel = await getCashRegisterData(tillCode: kTillVal);
        if (cashRegisterModel == null) {
          throw CustomException('Something went wrong try again later');
        }
        cashRegisterNumber = cashRegisterModel.data?.cashRegisterNumber;
      } catch (e) {
        if (context.mounted) {
          showErrorAlertDialog(context: context, message: e.toString());
        }
      }
    }
  }

  void _saveInSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(kTillString, kTillVal);
    preferences.setString(kEnableCashRegisterString, kEnableCashRegisterVal);
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
        body: kTillVal == ""
            ? Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black54,
            ),
            tillBaseModel != null
                ? Center(
              child: Container(
                height: MediaQuery.of(context)
                    .size
                    .height *
                    0.8,
                width: MediaQuery.of(context)
                    .size
                    .width *
                    0.8,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(10)),
                ),
                child: Material(
                  child: Column(
                    children: [
                      Text(
                          'Select your cash register (till)',
                          style: TextStyle(
                              color: Colors
                                  .grey.shade700,
                              fontWeight:
                              FontWeight.w600)),
                      const Divider(),
                      Expanded(
                        child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
                            itemCount: tillBaseModel?.data?.length ?? 0,
                            itemBuilder: (BuildContext context,int index) {
                              return GestureDetector(
                                onTap: () {
                                  print('index = $index tillBaseModel!.data![index].tillCode = ${tillBaseModel!.data![index].tillCode}');
                                  kTillVal = tillBaseModel!.data![index].tillCode ??'';
                                  kEnableCashRegisterVal = tillBaseModel!.data![index].enableCashRegister ?? '';
                                  _getCashRegisterData(context).then((c){
                                    _saveInSharedPreference();
                                    setState(() => _isLoading = false);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      const BorderRadius
                                          .all(
                                          Radius.circular(
                                              10)),
                                      border: Border.all(
                                          color: Colors
                                              .grey
                                              .shade700,
                                          style: BorderStyle
                                              .solid)),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                    children: [
                                      const SizedBox(
                                          height:
                                          80,
                                          width: 80,
                                          child: Image(
                                              image: AssetImage(
                                                  'assets/images/till_counter_image.png'),
                                              fit: BoxFit
                                                  .fill)),
                                      FittedBox(
                                          child: Text(
                                              '${tillBaseModel!.data?[index].tillCode} / ${tillBaseModel!.data?[index].tillName}',
                                              maxLines:
                                              1,
                                              style: TextStyle(
                                                  color: Colors.purple.shade700,
                                                  fontWeight: FontWeight.w600)))
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            )
                : const Center(
                child: CircularProgressIndicator()),
          ],
        ) : floorTableProvider.floorList.isNotEmpty ? bottomProvider.bottomIndex == 0
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
