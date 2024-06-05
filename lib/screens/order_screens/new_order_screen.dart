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
  double _animatedHeightValue = 40;
  bool vegOnlySwitchStatus = true;
  bool _isLoading = false;

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
    if(kTillVal!='')
      {
        _getCashRegisterData(context);
      }
    super.didChangeDependencies();
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

  _getCashRegisterData(BuildContext context)async{
    if(kEnableCashRegisterVal!='No'&&kEnableCashRegisterVal!='')
      {
        setState(()=>_isLoading=true);
        try{
          CashRegisterModel? cashRegisterModel = await getCashRegisterData(tillCode: kTillVal);
          if(cashRegisterModel==null)
            {
              throw CustomException('Something went wrong try again later');
            }
            cashRegisterNumber = cashRegisterModel.data?.cashRegisterNumber;
        }catch(e){
          if(context.mounted)
            {
              showErrorAlertDialog(context: context, message: e.toString());
            }
        }
        setState(()=>_isLoading=false);
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
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                    child: Text(
                                                        '${provider.cartList[index].productName}')),
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
                                                      'Veg only',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .grey.shade700,
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
                                                    const Expanded(
                                                      child: TextField(
                                                        decoration:
                                                            InputDecoration(
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
                                                        .categoryMap[
                                                            selectedCategoryType]
                                                        ?.length,
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
                                                                        padding:
                                                                            const EdgeInsets.all(
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
                                                                        padding:
                                                                            const EdgeInsets.all(
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
                                                                    child: Text(
                                                                        '${provider.categoryMap[selectedCategoryType]?[index].productName}',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey.shade600,
                                                                            fontSize: 16))),
                                                                Column(
                                                                  children: [
                                                                    Text(
                                                                        '$rupeeSymbol${double.parse(provider.categoryMap[selectedCategoryType]?[index].purchasePrice ?? '0.0')}',
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w700)),
                                                                    ElevatedButton(
                                                                        style: ButtonStyle(
                                                                            backgroundColor: WidgetStateProperty.all<Color?>(
                                                                                appThemeColor),
                                                                            foregroundColor: WidgetStateProperty.all<Color?>(Colors
                                                                                .white)),
                                                                        onPressed:
                                                                            () {
                                                                          provider
                                                                              .addToCart(provider.categoryMap[selectedCategoryType]![index]);
                                                                        },
                                                                        child:
                                                                            const Row(
                                                                          children: [
                                                                            Text('Add  '),
                                                                            Icon(
                                                                              Icons.add,
                                                                              size: 30,
                                                                            )
                                                                          ],
                                                                        ))
                                                                  ],
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
                                        onPressed: () async{
                                          if(provider.cartList.isNotEmpty)
                                            {

                                              _postOrderKotData(provider.cartList);
                                            }else{
                                            showCustomAlertDialog(context: context,title: 'Add items to Order');
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
                        kTillVal==""? Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.black54,
                            ),
                            tillBaseModel != null
                                ? Center(
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.8,
                                width: MediaQuery.of(context).size.width * 0.8,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Material(
                                  child: Column(
                                    children: [
                                      Text('Select your cash register (till)',
                                          style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.w600)),
                                      const Divider(),
                                      Expanded(
                                        child: GridView.builder(
                                            gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10.0,
                                              mainAxisSpacing: 10.0,
                                            ),
                                            itemCount:
                                            tillBaseModel?.data?.length ?? 0,
                                            // Total number of items
                                            itemBuilder: (BuildContext context, int index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  kTillVal = tillBaseModel!
                                                      .data![index].tillCode ??
                                                      '';
                                                  kEnableCashRegisterVal = tillBaseModel!
                                                      .data![index].enableCashRegister ??
                                                      '';
                                                  _getCashRegisterData(context);
                                                  _saveInSharedPreference();
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                      border: Border.all(
                                                          color:
                                                          Colors.grey.shade700,
                                                          style:
                                                          BorderStyle.solid)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      const SizedBox(
                                                          height: 80,
                                                          width: 80,
                                                          child: Image(
                                                              image: AssetImage(
                                                                  'assets/images/till_counter_image.png'),
                                                              fit: BoxFit.fill)),
                                                      FittedBox(
                                                          child: Text(
                                                              '${tillBaseModel!.data?[index].tillCode} / ${tillBaseModel!.data?[index].tillName}',
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .purple
                                                                      .shade700,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600)))
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
                                : const Center(child: CircularProgressIndicator()),
                          ],
                        ) : const SizedBox()
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
            borderRadius: BorderRadius.all(Radius.circular(18))),
        child: Center(
            child: Icon(iconData,
                color: iconData == Icons.remove ? Colors.red : Colors.green)),
      ),
    );
  }
}
