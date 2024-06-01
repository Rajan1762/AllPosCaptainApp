import 'package:captain_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../cutomer_screens/customer_list_screen.dart';
import '../services/network_services/orders_network_service.dart';
import '../services/provider_services/order_provider.dart';
import '../utils/colors.dart';
import '../utils/custom_widgets/full_screen_loading_widget.dart';
import '../utils/custom_widgets/notification_widget.dart';
import 'order_detail_screenOld.dart';
import 'order_details_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  DateTime currentTime = DateTime.now();

  _getOrderList(BuildContext context) async {
    OrderProvider orderProvider =
    Provider.of<OrderProvider>(context, listen: false);
    try {
      orderProvider.orderDataModelList ??= await getOrderListData();
    } catch (e) {
      if (context.mounted) {
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
    super.didChangeDependencies();
    _getOrderList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('OrderList Screen'),
      ),
      body: Container(
        color: Colors.grey.shade100,
        child:
        Consumer<OrderProvider>(builder: (providerContext, orderProvider, _) {
          return orderProvider.orderDataModelList != null
              ? ListView.builder(
              itemCount: orderProvider.orderDataModelList?.length,
              itemBuilder: (context, index) {
                String dateTime =
                    '${orderProvider.orderDataModelList?[index].saleOrderDate ?? ''} ${orderProvider.orderDataModelList?[index].saleOrderTime ?? ''}';
                Duration difference = currentTime.difference(
                    DateFormat("dd-MM-yyyy HH:mm:ss").parse(dateTime));
                return Container(
                  margin:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Colors.grey.shade400),
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 5)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                                orderProvider.orderDataModelList?[index]
                                    .saleOrderNumber ??
                                    '',
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Text(dateTime,
                              style: TextStyle(
                                  color: Colors.grey.shade800, fontSize: 16))
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Divider(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            decoration: BoxDecoration(
                                color: appThemeColorShade200,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Text(
                                orderProvider.orderDataModelList?[index]
                                    .saleOrderType ??
                                    '',
                                style: TextStyle(
                                  // color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const OrderFieldIconWideget(
                                    iconData: Icons.table_bar_outlined),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: FittedBox(
                                    child: Text(
                                        '${orderProvider.orderDataModelList?[index].floorName ?? '_'} / ${orderProvider.orderDataModelList?[index].tableName ?? '_'}',
                                        style: TextStyle(
                                            color: Colors.grey.shade800,
                                            fontSize: 16)),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      if (('${orderProvider.orderDataModelList?[index].floorName ?? '_'} / ${orderProvider.orderDataModelList?[index].tableName ?? '_'}' ==
                                          '_ / _')) {
                                        //TODO
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             FloorTableChoosingScreen(
                                        //                 orderDataModel:
                                        //                 orderProvider
                                        //                     .orderDataModelList?[
                                        //                 index])));
                                      } else {
                                        orderProvider.removeFloorTable(
                                            orderDataModel: orderProvider
                                                .orderDataModelList![index]);
                                      }
                                    },
                                    child: OrderFieldIconWideget(
                                        iconData:
                                        ('${orderProvider.orderDataModelList?[index].floorName ?? '_'} / ${orderProvider.orderDataModelList?[index].tableName ?? '_'}' ==
                                            '_ / _')
                                            ? Icons.edit
                                            : Icons.delete_forever)),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('$rupeeSymbol${double.parse(orderProvider.orderDataModelList?[index].amount ??
                                '0.0')}',
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const OrderFieldIconWideget(
                                      iconData: Icons.person_outline),
                                  Flexible(
                                    child: Text(
                                        '${orderProvider.orderDataModelList?[index].ledgerName ?? '_'} / ${orderProvider.orderDataModelList?[index].mobile ?? '_'}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.grey.shade800,
                                            fontSize: 16)),
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const CustomerListScreen()));
                                      },
                                      child: const OrderFieldIconWideget(
                                          iconData: Icons.edit)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '${difference.inHours.toString().padLeft(2, '0')} hours ago',
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                  WidgetStateProperty.all<Color?>(
                                      appThemeColor),
                                  padding: WidgetStateProperty.all<
                                      EdgeInsetsGeometry?>(
                                      const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 50)),
                                  shape: WidgetStateProperty.all<
                                      OutlinedBorder?>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        5),
                                  ))),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => OrderDetailsScreen(orderDataModel : orderProvider.orderDataModelList?[index],time: dateTime,
                                      //Todo
                                      // saleOrderNumber: orderProvider
                                      //     .orderDataModelList![index]
                                      //     .saleOrderNumber ??
                                      //     ''
                                    )));
                              },
                              child: const Text('Open',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)))
                        ],
                      )
                    ],
                  ),
                );
              })
              : const FullScreenLoadingWidget(isLoading: true);
        }),
      ),
    );
    // return Consumer<FloorTableProviderService>(
    //   builder: (providerContext, floorTableListProvider, Widget? child) {
    //     return Column(
    //       children: [
    //         Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    //           Row(
    //             children: [
    //               SizedBox(
    //                 width: 30,
    //                 child: Radio<FloorTableTypeEnum>(
    //                   value: FloorTableTypeEnum.availableTables,
    //                   groupValue: floorTableListProvider.floorTableTypeEnum,
    //                   activeColor: appThemeColor,
    //                   onChanged: (FloorTableTypeEnum? value) {
    //                     floorTableListProvider.floorTableTypeEnum = value;
    //                   },
    //                 ),
    //               ),
    //               const Text(
    //                 'Available Tables',
    //                 style: TextStyle(fontSize: 13),
    //               )
    //             ],
    //           ),
    //           Row(
    //             children: [
    //               SizedBox(
    //                 width: 30,
    //                 child: Radio<FloorTableTypeEnum>(
    //                   value: FloorTableTypeEnum.bookedTable,
    //                   groupValue: floorTableListProvider.floorTableTypeEnum,
    //                   activeColor: appThemeColor,
    //                   onChanged: (FloorTableTypeEnum? value) {
    //                     floorTableListProvider.floorTableTypeEnum = value;
    //                   },
    //                 ),
    //               ),
    //               const Text(
    //                 'Booked Table',
    //                 style: TextStyle(fontSize: 13),
    //               )
    //             ],
    //           )
    //         ]),
    //         Expanded(
    //           child: ListView.builder(
    //             shrinkWrap: true,
    //             itemCount: floorTableListProvider.orderFloorTableList.length,
    //             itemBuilder: (context, floorIndex) {
    //               print('floorTableListProvider.orderFloorTableList.length = ${floorTableListProvider.orderFloorTableList.length}');
    //               print('floorIndex value ==== ${floorTableListProvider.orderFloorTableList[floorIndex]}\n${floorTableListProvider.orderFloorTableList}');
    //               return Container(
    //                 padding: const EdgeInsets.all(10),
    //                 margin:
    //                 const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //                 decoration: const BoxDecoration(
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.all(Radius.circular(5)),
    //                   boxShadow: [
    //                     BoxShadow(
    //                       color: Colors.grey,
    //                       blurRadius: 5.0,
    //                     ),
    //                   ],
    //                 ),
    //                 height: floorTableListProvider.orderFloorTableList[floorIndex].length <= 3
    //                     ? MediaQuery.of(context).size.height * 0.28
    //                     : floorTableListProvider.orderFloorTableList[floorIndex].length <= 6
    //                     ? MediaQuery.of(context).size.height * 0.44
    //                     : floorTableListProvider.orderFloorTableList[floorIndex].length <= 9
    //                     ? MediaQuery.of(context).size.height * 0.61
    //                     : floorTableListProvider.orderFloorTableList[floorIndex].length <= 12
    //                     ? MediaQuery.of(context).size.height * 0.80
    //                     : floorTableListProvider.orderFloorTableList[floorIndex].length <= 15
    //                     ? MediaQuery.of(context).size.height * 1.0
    //                     : MediaQuery.of(context).size.height * 1.20,
    //                 child: Column(
    //                   children: [
    //                     Text(
    //                       "Floor : ${floorTableListProvider.orderFloorTableList[floorIndex].first.floorName}",
    //                       style: const TextStyle(
    //                           fontSize: 16, fontWeight: FontWeight.w600),
    //                     ),
    //                     const Padding(
    //                       padding: EdgeInsets.all(10.0),
    //                       child: Divider(thickness: 2),
    //                     ),
    //                     Expanded(
    //                       child: GridView.builder(
    //                           itemCount: floorTableListProvider.orderFloorTableList[floorIndex].length,
    //                           scrollDirection: Axis.vertical,
    //                           physics: floorTableListProvider.orderFloorTableList[floorIndex].length <= 15
    //                               ? const NeverScrollableScrollPhysics()
    //                               : null,
    //                           gridDelegate:
    //                           const SliverGridDelegateWithFixedCrossAxisCount(
    //                               crossAxisSpacing: 10,
    //                               mainAxisSpacing: 10,
    //                               crossAxisCount: 3,
    //                               childAspectRatio: 0.84),
    //                           itemBuilder: (_, tableIndex) {
    //                             print('[floorIndex][tableIndex] = ${floorTableListProvider.orderFloorTableList[floorIndex][tableIndex]}');
    //                             return GestureDetector(
    //                               // onTap: floorTableListProvider.listOfFloorTableList[floorIndex]
    //                               // [tableIndex]
    //                               //     .isAvailable ==
    //                               //     'D'
    //                               //     ? null
    //                               //     : () {
    //                               //   _incrementDecrementAnimation(
    //                               //       MediaQuery.of(context).size.height *
    //                               //           0.40);
    //                               // },
    //                               child: Container(
    //                                 decoration: BoxDecoration(
    //                                   color: floorTableListProvider.floorTableTypeEnum == FloorTableTypeEnum.bookedTable
    //                                       ? Colors.red
    //                                       : Colors.grey,
    //                                   borderRadius: const BorderRadius.all(
    //                                       Radius.circular(5)),
    //                                   boxShadow: const [
    //                                     BoxShadow(
    //                                       color: Colors.grey,
    //                                       blurRadius: 3.0,
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 child: Column(
    //                                   children: [
    //                                     Padding(
    //                                       padding: const EdgeInsets.only(top: 5),
    //                                       child: Text('',
    //                                         //TODO
    //                                         // floorTableListProvider.orderFloorTableList[floorIndex][tableIndex].tableName,
    //                                         style: TextStyle(
    //                                             color: tableIndex % 4 == 0
    //                                                 ? Colors.white
    //                                                 : Colors.black),
    //                                       ),
    //                                     ),
    //                                     const Padding(
    //                                       padding: EdgeInsets.symmetric(
    //                                           vertical: 5, horizontal: 2),
    //                                       child: Image(
    //                                           image: AssetImage(tableAssetImage),
    //                                           fit: BoxFit.contain),
    //                                     ),
    //                                     Row(
    //                                       mainAxisAlignment: MainAxisAlignment.end,
    //                                       children: [
    //                                         Container(
    //                                           height: 22,
    //                                           width: 22,
    //                                           margin:
    //                                           const EdgeInsets.only(right: 10),
    //                                           decoration: const BoxDecoration(
    //                                               color: Colors.red,
    //                                               borderRadius: BorderRadius.all(
    //                                                   Radius.circular(11))),
    //                                           child: const Center(
    //                                             child: Text(
    //                                               '',
    //                                               //TODO
    //                                               // floorTableListProvider.orderFloorTableList[floorIndex][tableIndex].noOfChars,
    //                                               style: TextStyle(
    //                                                   color: Colors.white,
    //                                                   fontWeight: FontWeight.w600),
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       ],
    //                                     )
    //                                   ],
    //                                 ),
    //                               ),
    //                             );
    //                           }),
    //                     ),
    //                   ],
    //                 ),
    //               );
    //             }),
    //         ),
    //       ],
    //     ); },
    // );
  }
}

class OrderFieldIconWideget extends StatelessWidget {
  final IconData iconData;

  const OrderFieldIconWideget({
    super.key,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(iconData, color: appThemeColor);
  }
}