import 'package:captain_app/model/cash_register_model.dart';
import 'package:captain_app/model/product_models/new_order_kot_model.dart';
import 'package:captain_app/services/provider_services/product_provider_service.dart';
import 'package:captain_app/utils/colors.dart';
import 'package:captain_app/utils/common_functions.dart';
import 'package:captain_app/utils/common_values.dart';
import 'package:captain_app/utils/constants.dart';
import 'package:captain_app/utils/custom_widgets/full_screen_loading_widget.dart';
import 'package:captain_app/utils/custom_widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/product_models/product_model.dart';
import '../../services/network_services/product_network_services.dart';
import '../cutomer_screens/customer_list_screen.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({super.key});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  double _animatedHeightValue = (screenHeight * 0.6) + 40;
  bool vegOnlySwitchStatus = true;
  bool _isLoading = false;
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();

  _incrementDecrementAnimation(double val) {
    print(
        'before val = ${val.toInt()}, _animatedHeightValue = ${_animatedHeightValue.toInt()}');
    if (_animatedHeightValue.toInt() > 40) {
      _animatedHeightValue -= val.toInt();
    } else {
      _animatedHeightValue += val.toInt();
    }
    print(
        'after val = ${val.toInt()}, _animatedHeightValue = ${_animatedHeightValue.toInt()}');
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    _getProductListData(context);
    if (kTillVal != '') {
      _getCashRegisterData(context);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

  _getProductListData(BuildContext context) async {
    ProductProviderService provider =
        Provider.of<ProductProviderService>(context, listen: false);
    if (provider.categoryMap.isEmpty) {
      try {
        provider.productBaseModel = await getProductListData();
        // if (provider.categoryMap.isNotEmpty) {
        //   // setState(() {
        //   //   _isLoading = false;
        //   // });
        // }
      } catch (e) {
        print("Error Occurred");
      }
    }
  }

  _getCashRegisterData(BuildContext context) async {
    if (kEnableCashRegisterVal != 'No' && kEnableCashRegisterVal != '') {
      setState(() => _isLoading = true);
      try {
        CashRegisterModel? cashRegisterModel =
            await getCashRegisterData(tillCode: kTillVal);
        if (cashRegisterModel == null) {
          throw CustomException('Something went wrong try again later');
        }
        cashRegisterNumber = cashRegisterModel.data?.cashRegisterNumber;
      } catch (e) {
        if (context.mounted) {
          showErrorAlertDialog(context: context, message: e.toString());
        }
      }
      setState(() => _isLoading = false);
    }
  }

  _postOrderKotData(List<ProductList> cartListValues) async {
    List<SaleOrderProducts> saleOrderProductList = [];
    for (var cartProduct in cartListValues) {
      saleOrderProductList.add(SaleOrderProducts.fromProductList(cartProduct));
    }
    await postOrderKotData(
        newOrderKotModel: NewOrderKotModel(
            shiftRegisterNumber: shiftRegisterNumber,
            cashRegisterNumber: cashRegisterNumber,
            mobile: customerMobileNumber,
            email: customerEmailId,
            tillCode: kTillVal,
            floorName: selectedFloor,
            tableName: selectedTable,
            captainCode: kEmployeeCodeVal,
            captainName: kEmployeeNameVal,
            chairs: numberOfChairsInSelectedTable,
            ledgerCode: customerLedgerCode,
            ledgerName: customerLedgerName,
            gSTNumber: customerGSTNumber,
            address: customerAddress,
            branchCode: cartListValues.first.branchCode,
            saleOrderProducts: saleOrderProductList));
  }

  void _saveInSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(kTillString, kTillVal);
    preferences.setString(kEnableCashRegisterString, kEnableCashRegisterVal);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer<ProductProviderService>(
        builder: (context, provider, _) {
          return Stack(
            children: [
              provider.categoryMap.isNotEmpty
                  ? Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 50,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Icon(
                                        Icons.arrow_circle_left_outlined,
                                        color: appThemeColor,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Text('Dine In',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: appThemeColor,
                                              fontWeight: FontWeight.w600))),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CustomerListScreen()));
                                    },
                                    child: const Icon(Icons.person,
                                        color: Colors.orange, size: 35),
                                  )),
                                  const VerticalDivider(),
                                  Expanded(
                                      child: Icon(Icons.table_bar_outlined,
                                          color: Colors.grey.shade600)),
                                ],
                              ),
                            ),
                            Expanded(
                                child: ListView.builder(
                                    itemCount: provider.cartList.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0, vertical: 2),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return Dialog(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets.all(20.0),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(provider.cartList[index].productName ?? ''),
                                                                  AddNotesTextFieldWidget(focusNode: _focusNode1, controller: textEditingController1,hintText: 'Cooking Notes'),
                                                                  AddNotesTextFieldWidget(focusNode: _focusNode2, controller: textEditingController2,hintText: 'Quantity'),
                                                                  const SizedBox(height: 10),
                                                                  AddNotesRowWidget(v1: '1', v2: '2', v3: '3', onTap1: () {_addNotesOnTapFunction('1');}, onTap2: () {_addNotesOnTapFunction('2');}, onTap3: () {_addNotesOnTapFunction('3');},),
                                                                  AddNotesRowWidget(v1: '4', v2: '5', v3: '6', onTap1: () {_addNotesOnTapFunction('4');}, onTap2: () {_addNotesOnTapFunction('5');}, onTap3: () {_addNotesOnTapFunction('6');},),
                                                                  AddNotesRowWidget(v1: '7', v2: '8', v3: '9', onTap1: () {_addNotesOnTapFunction('7');}, onTap2: () {_addNotesOnTapFunction('8');}, onTap3: () {_addNotesOnTapFunction('9');},),
                                                                  AddNotesRowWidget(v1: 'CLR', v2: '0', v3: '.', onTap1: () {textEditingController1.text = '';textEditingController2.text = '';}, onTap2: () {_addNotesOnTapFunction('0');}, onTap3: () {_addNotesOnTapFunction('.');},),
                                                                  Row(
                                                                    children: [
                                                                      Expanded(
                                                                        child: Container(
                                                                          padding: const EdgeInsets.all(10),
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                                                                            border: Border.all(
                                                                              color: Colors.red
                                                                            )
                                                                          ),
                                                                          child: const Center(child: Text('CLOSE',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600),)),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(width: 10),
                                                                      Expanded(
                                                                        child: Container(
                                                                          padding: const EdgeInsets.all(10),
                                                                          decoration: BoxDecoration(
                                                                            color: appThemeColor,
                                                                              borderRadius: const BorderRadius.all(Radius.circular(5)),
                                                                              // border: Border.all(
                                                                              //     color: Colors.red
                                                                              // )
                                                                          ),
                                                                          child: const Center(child: Text('CONFIRM',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                  },
                                                  child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                      child: Text(
                                                          '${provider.cartList[index].productName}')),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                              '${double.parse(provider.cartList[index].purchasePrice ?? '0.0')}',
                                                              maxLines: 1)),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.28,
                                                        child: Row(
                                                          children: [
                                                            CartAddRemoveWidget(
                                                              iconData:
                                                                  Icons.remove,
                                                              onTap: () {
                                                                provider.removeFromCart(
                                                                    provider.cartList[
                                                                        index]);
                                                              },
                                                            ),
                                                            Expanded(
                                                                child: Text(
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    '${provider.cartList[index].quantity}',
                                                                    maxLines:
                                                                        1)),
                                                            CartAddRemoveWidget(
                                                              iconData:
                                                                  Icons.add,
                                                              onTap: () {
                                                                provider.addToCart(
                                                                    provider.cartList[
                                                                        index]);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                          child: Text(
                                                              '${provider.cartList[index].quantity * double.parse(provider.cartList[index].purchasePrice ?? '0.0')}',
                                                              textAlign:
                                                                  TextAlign.end,
                                                              maxLines: 1))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Divider()
                                        ],
                                      );
                                    }))
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedContainer(
                                  curve: Curves.fastOutSlowIn,
                                  duration: const Duration(milliseconds: 500),
                                  height: _animatedHeightValue,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.transparent,
                                  child: Stack(
                                    children: [
                                      SingleChildScrollView(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 40),
                                          height: (MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.8),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: const BoxDecoration(
                                              color: Colors.white),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0,
                                                        vertical: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      vegOnlySwitchStatus
                                                          ? 'Veg only'
                                                          : 'Non Veg',
                                                      style: TextStyle(
                                                          color:
                                                              vegOnlySwitchStatus
                                                                  ? Colors.green
                                                                  : Colors.red,
                                                          //Colors.grey.shade700,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Switch(
                                                        activeColor:
                                                            Colors.green,
                                                        inactiveThumbColor:
                                                            Colors.red,
                                                        inactiveTrackColor:
                                                            Colors.red.shade100,
                                                        value:
                                                            vegOnlySwitchStatus,
                                                        onChanged: (s) {
                                                          setState(() {
                                                            vegOnlySwitchStatus =
                                                                s;
                                                          });
                                                        })
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 65,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        15, 0, 15, 10),
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: double.infinity,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .teal.shade200,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                                    Radius.circular(
                                                                        10))),
                                                        child:
                                                            DropdownButtonHideUnderline(
                                                          child: DropdownButton(
                                                            isExpanded: true,
                                                            // hint: const Text('Select Waiter'),
                                                            value:
                                                                selectedCategoryType,
                                                            items: provider
                                                                .categoryList
                                                                .map<
                                                                    DropdownMenuItem<
                                                                        String>>((String
                                                                    value) {
                                                              return DropdownMenuItem<
                                                                      String>(
                                                                  value: value,
                                                                  child: Text(
                                                                      value,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade700)));
                                                            }).toList(),
                                                            onChanged: (c) {
                                                              selectedCategoryType =
                                                                  c ?? '';
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Expanded(
                                                      child: TextField(
                                                        onChanged: provider
                                                            .filterSearchValues,
                                                        decoration:
                                                            const InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    'Search'),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: ListView.builder(
                                                    itemCount: provider
                                                        .filteredValues.length,
                                                    // itemCount: provider.categoryMap[selectedCategoryType]?.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        10.0,
                                                                    vertical:
                                                                        5),
                                                            child: Row(
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Container(
                                                                        margin: const EdgeInsets
                                                                            .only(
                                                                          bottom:
                                                                              10,
                                                                        ),
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            2),
                                                                        decoration:
                                                                            BoxDecoration(border: Border.all(color: Colors.green)),
                                                                        child: const Center(
                                                                            child: Icon(
                                                                          Icons
                                                                              .circle,
                                                                          color:
                                                                              Colors.green,
                                                                          size:
                                                                              12,
                                                                        ))),
                                                                    Container(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            2),
                                                                        decoration: BoxDecoration(
                                                                            color: Colors
                                                                                .teal.shade200,
                                                                            borderRadius: const BorderRadius.all(Radius.circular(
                                                                                10))),
                                                                        child: Icon(
                                                                            Icons
                                                                                .emoji_food_beverage_outlined,
                                                                            size:
                                                                                12,
                                                                            color:
                                                                                Colors.grey.shade600))
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    width: 15),
                                                                Expanded(
                                                                    flex: 3,
                                                                    child: Text(
                                                                        '${provider.filteredValues[index].productName}',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey.shade600,
                                                                            fontSize: 18))),
                                                                // Text('${provider.categoryMap[selectedCategoryType]?[index].productName}', style: TextStyle(color: Colors.grey.shade600, fontSize: 16))),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                          '$rupeeSymbol${double.parse(provider.filteredValues[index].purchasePrice ?? '0.0')}',
                                                                          style: const TextStyle(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.w700)),
                                                                      Row(
                                                                        children: [
                                                                          CartAddRemoveWidget(
                                                                            iconData:
                                                                                Icons.remove,
                                                                            onTap: provider.filteredValues[index].quantity > 0
                                                                                ? () {
                                                                                    provider.removeFromCart(provider.filteredValues[index]);
                                                                                  }
                                                                                : () {},
                                                                          ),
                                                                          Expanded(
                                                                              child: Text(textAlign: TextAlign.center, '${provider.filteredValues[index].quantity}', maxLines: 1)),
                                                                          CartAddRemoveWidget(
                                                                            iconData:
                                                                                Icons.add,
                                                                            onTap:
                                                                                () {
                                                                              provider.addToCart(provider.filteredValues[index]);
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      // ElevatedButton(
                                                                      //     style: ButtonStyle(
                                                                      //         backgroundColor: WidgetStateProperty.all<Color?>(
                                                                      //             appThemeColor),
                                                                      //         foregroundColor: WidgetStateProperty.all<Color?>(Colors
                                                                      //             .white)),
                                                                      //     onPressed:
                                                                      //         () {
                                                                      //       provider.addToCart(provider.filteredValues[index]);
                                                                      //     },
                                                                      //     child:
                                                                      //         const Row(
                                                                      //       children: [
                                                                      //         Text('Add  '),
                                                                      //         Icon(
                                                                      //           Icons.add,
                                                                      //           size: 30,
                                                                      //         )
                                                                      //       ],
                                                                      //     ))
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          const Divider()
                                                        ],
                                                      );
                                                    }),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _incrementDecrementAnimation(
                                              MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.6);
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 60,
                                          margin:
                                              const EdgeInsets.only(left: 5),
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20)),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 3)
                                              ]),
                                          child: const Center(
                                              child: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  size: 30)),
                                        ),
                                      ),
                                    ],
                                  )),
                              Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.orange,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ProductOverAllFieldWidget(
                                      title: 'ITEMS',
                                      value: '${provider.cartList.length}',
                                    ),
                                    ProductOverAllFieldWidget(
                                      title: 'QTY',
                                      value: '${provider.overAllQuantity}',
                                    ),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            padding: WidgetStateProperty.all<
                                                    EdgeInsetsGeometry?>(
                                                const EdgeInsets.symmetric(
                                                    vertical: 15,
                                                    horizontal: 30)),
                                            shape: WidgetStateProperty.all<
                                                    OutlinedBorder?>(
                                                const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(15))))),
                                        onPressed: () async {
                                          if (provider.cartList.isNotEmpty) {
                                            _postOrderKotData(
                                                provider.cartList);
                                          } else {
                                            showCustomAlertDialog(
                                                context: context,
                                                title: 'Add items to Order');
                                          }
                                        },
                                        child: Text(
                                          'ORDER KOT',
                                          style: TextStyle(
                                              color: Colors.grey.shade900,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        kTillVal == ""
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
                                                        gridDelegate:
                                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          crossAxisSpacing:
                                                              10.0,
                                                          mainAxisSpacing: 10.0,
                                                        ),
                                                        itemCount: tillBaseModel
                                                                ?.data
                                                                ?.length ??
                                                            0,
                                                        // Total number of items
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              kTillVal = tillBaseModel!
                                                                      .data![
                                                                          index]
                                                                      .tillCode ??
                                                                  '';
                                                              kEnableCashRegisterVal =
                                                                  tillBaseModel!
                                                                          .data![
                                                                              index]
                                                                          .enableCashRegister ??
                                                                      '';
                                                              _getCashRegisterData(
                                                                  context);
                                                              _saveInSharedPreference();
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
                              )
                            : const SizedBox()
                      ],
                    )
                  : const FullScreenLoadingWidget(isLoading: true),
              FullScreenLoadingWidget(isLoading: _isLoading),
            ],
          );
        },
      ),
    ));
  }

  void _addNotesOnTapFunction(String s) {
    print('s = $s');
    if(_focusNode1.hasFocus)
      {
          textEditingController1.text = '${textEditingController1.value.text}$s';
      }else{
      textEditingController2.text = '${textEditingController2.value.text}$s';
    }
    setState(() {});
  }
}

class AddNotesTextFieldWidget extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final String? hintText;
  const AddNotesTextFieldWidget({super.key,
    required this.focusNode, required this.controller, this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        keyboardType: TextInputType.none,
        // readOnly: true,
        decoration: _addNoteFieldDecoration(hintText: hintText),
      ),
    );
  }
  InputDecoration _addNoteFieldDecoration({String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      border: _addNoteTextFieldBorder(),
      enabledBorder: _addNoteTextFieldBorder(),
      focusedBorder: _addNoteTextFieldBorder(),
      disabledBorder: _addNoteTextFieldBorder(),
    );
  }

  OutlineInputBorder _addNoteTextFieldBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: Colors.grey));
  }
}

class AddNotesRowWidget extends StatelessWidget {
  final String v1;
  final String v2;
  final String v3;
  final Function() onTap1;
  final Function() onTap2;
  final Function() onTap3;

  const AddNotesRowWidget({
    super.key,
    required this.v1,
    required this.v2,
    required this.v3,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          AddNotesKeyBordWidget(value: v1, onTap: onTap1),
          const SizedBox(width: 10),
          AddNotesKeyBordWidget(value: v2, onTap: onTap2),
          const SizedBox(width: 10),
          AddNotesKeyBordWidget(value: v3, onTap: onTap3)
        ],
      ),
    );
  }
}

class AddNotesKeyBordWidget extends StatelessWidget {
  final String value;
  final Function() onTap;

  const AddNotesKeyBordWidget({
    super.key,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.grey)),
          child: Center(child: Text(value,style: const TextStyle(fontSize: 16))),
        ),
      ),
    );
  }
}

class ProductOverAllFieldWidget extends StatelessWidget {
  final String title;
  final String value;

  const ProductOverAllFieldWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 5),
        Text(value,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600))
      ],
    );
  }
}

class CartAddRemoveWidget extends StatelessWidget {
  final IconData iconData;
  final Function() onTap;

  const CartAddRemoveWidget({
    super.key,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
            color: iconData == Icons.remove
                ? Colors.red.shade100
                : Colors.greenAccent.shade100,
            borderRadius: const BorderRadius.all(Radius.circular(18))),
        child: Center(
            child: Icon(iconData,
                color: iconData == Icons.remove ? Colors.red : Colors.green)),
      ),
    );
  }
}
