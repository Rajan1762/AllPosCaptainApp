import 'package:captain_app/services/provider_services/product_provider_service.dart';
import 'package:captain_app/utils/colors.dart';
import 'package:captain_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/order_models/order_details_response_model.dart';
import '../../model/order_models/order_response_model.dart';
import '../../services/network_services/orders_network_service.dart';
import '../../utils/custom_widgets/notification_widget.dart';

class OrderDetailsScreen extends StatefulWidget {
  final OrderDataModel? orderDataModel;
  final String time;

  const OrderDetailsScreen(
      {super.key, this.orderDataModel, required this.time});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late final Future<OrderDetailResponseModels?> orderDetailsResponseModelList;

  _getOrderDetailData()async{
        orderDetailsResponseModelList = getOrderDetailData(widget.orderDataModel?.saleOrderNumber ?? '');
  }

  @override
  void initState() {
    _getOrderDetailData();
    super.initState();
  }

  _cancelSingleProduct({required BuildContext context,required String saleOrderProductID}) async
  {
    try{
      await cancelSingleProduct(saleOrderProductID: saleOrderProductID);
    }catch(e)
    {
      if(context.mounted)
        {
          showErrorAlertDialog(context: context, message: e.toString());
        }
    }

  }

  Future<bool> _cancelAllProduct({required BuildContext context,required String saleOrderNumber}) async
  {
    try{
      return await cancelAllProduct(saleOrderNumber: saleOrderNumber);
    }catch(e)
    {
      if(context.mounted)
      {
        showErrorAlertDialog(context: context, message: e.toString());
      }
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ProductProviderService ProductProvider = Provider.of<ProductProviderService>(context,listen: false);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Order Details'),
            ),
            body: FutureBuilder<OrderDetailResponseModels?>(
              future: orderDetailsResponseModelList,
              builder: (BuildContext context,
                  AsyncSnapshot<OrderDetailResponseModels?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(
                          strokeWidth: 6,
                        )),
                  );
                } else if (snapshot.hasError) {
                  showErrorAlertDialog(
                      context: context, message: snapshot.error.toString());
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return Column(
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                          child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 5)
                                ]),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                          '#${widget.orderDataModel?.saleOrderNumber}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    Expanded(
                                        child: Text(
                                          '#${widget.time}',
                                          textAlign: TextAlign.end,
                                          maxLines: 1,
                                        ))
                                  ],
                                ),
                                const Divider(),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                            '${widget.orderDataModel?.saleOrderType}')),
                                    OrderDetailsCancelBtWidget(
                                      title: 'Cancel',
                                      onPressed: () async {
                                        bool result = await _cancelAllProduct(saleOrderNumber: '${widget.orderDataModel?.saleOrderNumber}', context: context);
                                        if(result&&context.mounted)
                                          {
                                            ProductProvider.orderDataModelList = null;
                                            Navigator.pop(context,true);
                                          }
                                      },
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                            '$rupeeSymbol${double.parse(widget.orderDataModel!.amount ?? '0.0')}',
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600))),
                                    OrderDetailsCancelBtWidget(
                                      title: 'Re-Order',
                                      onPressed: () {},
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, blurRadius: 5)
                                  ]),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 30)),
                                          backgroundColor:
                                          WidgetStateProperty.all<Color?>(
                                              appThemeColor),
                                          foregroundColor:
                                          WidgetStateProperty.all<Color?>(
                                              Colors.white),
                                          shape: WidgetStateProperty.all<OutlinedBorder?>(
                                              const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8))))),
                                      onPressed: () {},
                                      child: const Text(
                                        'Re-Print - KOT -001',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  Container(
                                    color: appThemeColorShade200,
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.all(10),
                                    child: const Row(
                                      children: [
                                        OrderDetailFieldWidget(value: 'Kitchen'),
                                        OrderDetailFieldWidget(value: 'Product'),
                                        OrderDetailFieldWidget(value: 'Status'),
                                        OrderDetailFieldWidget(value: 'Quantity'),
                                        OrderDetailFieldWidget(value: 'Action'),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.data?.saleOrderProducts?.length,itemBuilder: (context,index){
                                      return Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                                  '${snapshot.data!.saleOrderProducts?[index].kOTNumber} / ${snapshot.data!.saleOrderProducts?[index].kitchenName}')),
                                          Expanded(
                                              child: Text('${snapshot.data!.saleOrderProducts?[index].productCode} / ${snapshot.data!.saleOrderProducts?[index].productName}')),
                                          Expanded(
                                              child: OrderDetailsCancelWidget(title: '${snapshot.data!.saleOrderProducts?[index].orderStatus}', color: Colors.green, bgColor: Colors.green.shade100)),
                                          Expanded(
                                              child: Column(
                                                children: [
                                                  Text('${snapshot.data!.saleOrderProducts?[index].quantity} ${snapshot.data!.saleOrderProducts?[index].productUOM}'),
                                                  Container(
                                                    padding: const EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                        color: Colors.red.shade100,
                                                        borderRadius: const BorderRadius.all(
                                                            Radius.circular(5))),
                                                    child: FittedBox(
                                                        child: Text(
                                                            '$rupeeSymbol${double.parse(snapshot.data!.saleOrderProducts?[index].salePrice ?? '0.0')}',
                                                            style: const TextStyle(
                                                                color: Colors.red,
                                                                fontWeight:
                                                                FontWeight.w600))),
                                                  )
                                                ],
                                              )),
                                          Expanded(
                                              child: snapshot.data!.saleOrderProducts![index].isCancelled == '1' ? OrderDetailsCancelWidget(title: 'Cancelled', color: Colors.red, bgColor: Colors.red.shade100) : GestureDetector(
                                                onTap: (){
                                                  _cancelSingleProduct(saleOrderProductID: snapshot.data!.saleOrderProducts![index].saleOrderProductId??'', context: context);
                                                },
                                                child: const Icon(Icons.delete_outline,
                                                    color: Colors.red),
                                              ))
                                        ],
                                      );
                                    }),
                                  ),
                                  const SizedBox(height: 5)
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                      Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
                                        const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 30)),
                                    backgroundColor:
                                    WidgetStateProperty.all<Color?>(
                                        appThemeColor),
                                    foregroundColor:
                                    WidgetStateProperty.all<Color?>(
                                        Colors.white),
                                    shape: WidgetStateProperty.all<OutlinedBorder?>(
                                        const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))))),
                                onPressed: () {},
                                child: const Text(
                                  'Back',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                          const Spacer()
                        ],
                      ),
                      const SizedBox(height: 20)
                    ],
                  );
                } else {
                  return const Text('No data');
                }
              },
            )));
  }
}

class OrderDetailsCancelWidget extends StatelessWidget {
  final String title;
  final Color color;
  final Color bgColor;
  const OrderDetailsCancelWidget({
    super.key, required this.title, required this.color, required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(
              Radius.circular(20))),
      child: Center(
        child: Text(title,
            style:
            TextStyle(color: color)),
      ),
    );
  }
}

class OrderDetailFieldWidget extends StatelessWidget {
  final String value;

  const OrderDetailFieldWidget({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(
      value,
      textAlign: TextAlign.center,
      style: TextStyle(color: appThemeColor, fontWeight: FontWeight.bold),
    ));
  }
}

class OrderDetailsCancelBtWidget extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const OrderDetailsCancelBtWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135,
      child: ElevatedButton(
          style: ButtonStyle(
              padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
                  const EdgeInsets.symmetric(vertical: 10)),
              backgroundColor: WidgetStateProperty.all<Color?>(appThemeColor),
              foregroundColor: WidgetStateProperty.all<Color?>(Colors.white),
              shape: WidgetStateProperty.all<OutlinedBorder?>(
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))))),
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )),
    );
  }
}
