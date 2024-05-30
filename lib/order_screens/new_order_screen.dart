import 'package:captain_app/services/provider_services/product_provider_service.dart';
import 'package:captain_app/utils/colors.dart';
import 'package:captain_app/utils/common_values.dart';
import 'package:captain_app/utils/constants.dart';
import 'package:captain_app/utils/custom_widgets/full_screen_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/network_services/product_network_services.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({super.key});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  double _animatedHeightValue = 40;
  bool vegOnlySwitchStatus = true;
  bool _isLoading = true;

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
    super.didChangeDependencies();
  }

  _getProductListData(BuildContext context) async {
    ProductProviderService provider =
        Provider.of<ProductProviderService>(context, listen: false);
    if (provider.categoryMap.isEmpty) {
      try {
        provider.productBaseModel = await getProductListData(context);
        if (provider.categoryMap.isNotEmpty) {
          setState(() {
            _isLoading = false;
          });
        }
      } catch (e) {
        print("Error Occurred");
      }
    }
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: appThemeColor,
                                      size: 30,
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
                                  const Expanded(
                                      child: Icon(Icons.person,
                                          color: Colors.orange, size: 35)),
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
                                      return Container();
                                    }))
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          child: AnimatedContainer(
                              curve: Curves.fastOutSlowIn,
                              duration: const Duration(milliseconds: 500),
                              height: _animatedHeightValue,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.transparent,
                              child: Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 40),
                                    height: (MediaQuery.of(context).size.height * 0.8),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'Veg only',
                                                style: TextStyle(
                                                    color: Colors.grey.shade700,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Switch(
                                                  activeColor: Colors.green,
                                                  value: vegOnlySwitchStatus,
                                                  onChanged: (s) {
                                                    setState(() {
                                                      vegOnlySwitchStatus = s;
                                                    });
                                                  })
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 65,
                                          width: MediaQuery.of(context).size.width,
                                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10))),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: double.infinity,
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                                            child: Text(value,
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
                                                  decoration: InputDecoration(
                                                      hintText: 'Search'),
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
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                                                      child: Row(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(bottom: 10,),
                                                                padding: EdgeInsets.all(2),
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                      color: Colors.green
                                                                    )
                                                                  ),
                                                                  child: const Center(child: Icon(Icons.circle,color: Colors.green,size: 12,))),

                                                              Container(
                                                                  padding: EdgeInsets.all(2),
                                                                  decoration: BoxDecoration(
                                                                      color: Colors.teal.shade200,
                                                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                                                  ),
                                                                  child: Icon(Icons.emoji_food_beverage_outlined,size: 12,color: Colors.grey.shade600))
                                                            ],
                                                          ),
                                                          const SizedBox(width: 15),
                                                          Expanded(child: Text('${provider.categoryMap[selectedCategoryType]?[index].productName}',style: TextStyle(color: Colors.grey.shade600,fontSize: 16))),
                                                          Column(
                                                            children: [
                                                              Text('$rupeeSymbol${double.parse(provider.categoryMap[selectedCategoryType]?[index].purchasePrice ?? '0.0')}',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w700)),
                                                              ElevatedButton(
                                                                style: ButtonStyle(
                                                                  backgroundColor: WidgetStateProperty.all<Color?>(appThemeColor),
                                                                  foregroundColor: WidgetStateProperty.all<Color?>(Colors.white)
                                                                ),
                                                                  onPressed: (){}, child: const Row(
                                                                children: [
                                                                  Text('Add  '),
                                                                  Icon(Icons.add,size: 30,)
                                                                ],
                                                              ))
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Divider()
                                                  ],
                                                );
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _incrementDecrementAnimation(
                                          MediaQuery.of(context).size.height *
                                              0.6);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 60,
                                      margin: const EdgeInsets.only(left: 5),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 3)
                                          ]),
                                      child: const Center(
                                          child: Icon(Icons.keyboard_arrow_down,
                                              size: 30)),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    )
                  : FullScreenLoadingWidget(isLoading: _isLoading),
            ],
          );
        },
      ),
    ));
  }
}
