import 'package:captain_app/services/provider_services/floor_table_provider_service.dart';
import 'package:captain_app/services/provider_services/product_provider_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/order_models/order_response_model.dart';
import '../../utils/colors.dart';
import 'new_order_screen.dart';
import 'order_screen.dart';

class TableChoosingScreenScreen extends StatefulWidget {
  final OrderDataModel? orderDataModel;
  const TableChoosingScreenScreen({super.key, this.orderDataModel});

  @override
  State<TableChoosingScreenScreen> createState() => _TableChoosingScreenScreenState();
}

class _TableChoosingScreenScreenState extends State<TableChoosingScreenScreen> {
  String orderTypeDropDownValue = 'Dine In';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('Choose Table'),
      ),
      body: Consumer2<FloorTableProviderService,ProductProviderService>(builder: (context, floorTableProvider,productProvider, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 80,
              // width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: DropDownOuterContainer(title: 'OrderType', dropDownValue: orderTypeDropDownValue, onChanged: (s){
                      setState(() {
                        orderTypeDropDownValue = s??'';
                      });
                    }, dropDownList: orderTypeDropDownList!, titleBgColor: Colors.white,),
                  ),
                  // const SizedBox(width: 15),
                  // Expanded(
                  //   child: GestureDetector(
                  //     onTap: (){
                  //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NewOrderScreen()));
                  //     },
                  //     child: Container(
                  //       margin: const EdgeInsets.only(top: 10),
                  //       decoration: BoxDecoration(
                  //           color: appThemeColor,
                  //           borderRadius: const BorderRadius.all(Radius.circular(20)),
                  //           border: const Border()
                  //       ),
                  //       child: const Center(child: Text('NEW ORDER',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white))),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: 60,
                      child: DropDownOuterContainer(title: 'Floor', dropDownValue: floorTableProvider.selectedFloor??'', onChanged: (s){
                        floorTableProvider.selectedFloor = s;
                      }, dropDownList: floorTableProvider.floorList, titleBgColor: scaffoldBgColor),
                    ),
                  ),
                ),
                const SizedBox(width: 40,),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                  decoration: BoxDecoration(
                      color: scaffoldBgColor,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.grey.shade400),
                      boxShadow: const [
                        BoxShadow(blurRadius: 2,color: Colors.grey)
                      ]
                  ),
                  child: Center(child: Text('Refresh',style: TextStyle(color: appThemeColor))),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                    itemCount: floorTableProvider.selectedFloorTableList.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        crossAxisCount: 2),
                    itemBuilder: (_, index){
                      return GestureDetector(
                        onTap: (){
                          if(widget.orderDataModel != null)
                            {
                              productProvider.setTableData(orderDataModel: widget.orderDataModel!, floorName: floorTableProvider.selectedFloorTableList[index].floorName ?? '', tableName: floorTableProvider.selectedFloorTableList[index].tableName ?? '');
                            }
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: 40,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: appThemeColorShade200,
                                            borderRadius: const BorderRadius.all(Radius.circular(20))
                                        ),
                                        child: Center(child: Text('Order ${index+1}')),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text('${floorTableProvider.selectedFloorTableList[index].chairs}/4'),
                                          Container(
                                            height: 10,
                                            // width: 50,
                                            decoration: BoxDecoration(
                                                color: appComboColor,
                                                borderRadius: const BorderRadius.all(Radius.circular(5))
                                            ),
                                          )
                                        ],

                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 120,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                    border: Border.all(color: Colors.cyan)
                                ),
                                child: Center(child: Text('${floorTableProvider.selectedFloorTableList[index].tableName}',style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold,fontSize: 16))),
                              ),
                              const Spacer(),
                              Container(
                                // height: 30,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    color: appComboColor,
                                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                                ),
                                child: Center(child: Text('${floorTableProvider.selectedFloorTableList[index].availableStatus}'.toUpperCase(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            )
            // Row(
            //   children: [
            //     DropDownOuterContainer(title: 'Floor', dropDownValue: floorDropDownValue, onChanged: (s){
            //       setState(() {
            //         floorDropDownValue = s??'';
            //       });
            //     }, dropDownList: floorDropDownList!,),
            //     Container(
            //       padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            //       decoration: BoxDecoration(
            //         borderRadius: const BorderRadius.all(Radius.circular(20)),
            //         border: Border.all()
            //       ),
            //       child: Text('Refresh',style: TextStyle(color: appThemeColor),),
            //     )
            //   ],
            // ),
          ],
        );
      },),
    ));
  }
}
