import 'package:captain_app/utils/colors.dart';
import 'package:captain_app/utils/constants.dart';
import 'package:flutter/material.dart';
import '../model/order_models/order_response_model.dart';

class OrderDetailsScreen extends StatefulWidget {
  final OrderDataModel? orderDataModel;
  final String time;

  const OrderDetailsScreen({super.key, this.orderDataModel, required this.time});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5
                )
              ]
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text('#${widget.orderDataModel?.saleOrderNumber}',maxLines: 2,overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
                    Expanded(child: Text('#${widget.time}',textAlign: TextAlign.end,maxLines: 1,))
                  ],
                ),
                const Divider(),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(child: Text('${widget.orderDataModel?.saleOrderType}')),
                    OrderDetailsCancelBtWidget(title: 'Cancel', onPressed: () {  },)
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(child: Text('$rupeeSymbol${double.parse(widget.orderDataModel!.amount ?? '0.0')}',style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.w600))),
                    OrderDetailsCancelBtWidget(title: 'Re-Order', onPressed: () {  },)
                  ],
                )
              ],
            ),
          ),
      Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5
              )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(const EdgeInsets.symmetric(vertical: 10,horizontal: 30)),
                    backgroundColor: WidgetStateProperty.all<Color?>(appThemeColor),
                    foregroundColor: WidgetStateProperty.all<Color?>(Colors.white),
                    shape: WidgetStateProperty.all<OutlinedBorder?>(const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ))
                ),
                onPressed: (){}, child: Text('Re-Print - KOT -001',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
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
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(child: Text('${widget.orderDataModel?.kOTNumber} / INDIAN')),
                const Expanded(child: Text('00125 / BUCKET BIRYANI')),
                Expanded(child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: const BorderRadius.all(Radius.circular(20))
                  ),
                  child: FittedBox(child: const Text('Ordered',style: TextStyle(color: Colors.green))),
                )),
                Expanded(child: Column(children: [
                  const Text('3 Nos'),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: const BorderRadius.all(Radius.circular(5))
                    ),
                    child: FittedBox(child: Text('$rupeeSymbol${double.parse(widget.orderDataModel!.amount ?? '0.0')}',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600))),
                  )
                ],)),
                const Expanded(child: Icon(Icons.delete_outline,color: Colors.red))
              ],
            ),
            SizedBox(height: 5)
          ],
        ),
      ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(const EdgeInsets.symmetric(vertical: 10,horizontal: 30)),
                        backgroundColor: WidgetStateProperty.all<Color?>(appThemeColor),
                        foregroundColor: WidgetStateProperty.all<Color?>(Colors.white),
                        shape: WidgetStateProperty.all<OutlinedBorder?>(const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))
                        ))
                    ),
                    onPressed: (){}, child: Text('Back',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
              ),
              Spacer()
            ],
          ),
          SizedBox(height: 20)
        ],
      ),
    ));
  }
}

class OrderDetailFieldWidget extends StatelessWidget {
  final String value;
  const OrderDetailFieldWidget({
    super.key, required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(value,textAlign: TextAlign.center,style: TextStyle(color: appThemeColor,fontWeight: FontWeight.bold),));
  }
}

class OrderDetailsCancelBtWidget extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const OrderDetailsCancelBtWidget({
    super.key, required this.title, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(const EdgeInsets.symmetric(vertical: 10)),
          backgroundColor: WidgetStateProperty.all<Color?>(appThemeColor),
          foregroundColor: WidgetStateProperty.all<Color?>(Colors.white),
          shape: WidgetStateProperty.all<OutlinedBorder?>(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))
          ))
        ),
          onPressed: onPressed, child: Text(title,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
    );
  }
}

