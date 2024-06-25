import 'dart:ffi';

import 'package:captain_app/screens/order_screens/new_order_screen.dart';
import 'package:captain_app/utils/colors.dart';
import 'package:captain_app/utils/common_values.dart';
import 'package:captain_app/utils/custom_widgets/full_screen_loading_widget.dart';
import 'package:flutter/material.dart';

class TableDetailFillingPage extends StatefulWidget {
  const TableDetailFillingPage({super.key});

  @override
  State<TableDetailFillingPage> createState() => _TableDetailFillingPageState();
}

class _TableDetailFillingPageState extends State<TableDetailFillingPage> {
  bool _isLoading = false;
  bool _fullyOccupiedStatus = false;
  int _numberOfPersons = 0;
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _customerMobileController = TextEditingController();

  @override
  void dispose() {
    _customerNameController.dispose();
    _customerMobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('Table - $selectedTable')),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: appThemeColor
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 6
                    )
                  ]
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text('Table Name - $selectedTable',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: appThemeColor))
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(
                              flex: 2, child: Text('Table Capacity',style: TextStyle(fontSize: 18))),
                            const Text('-',style: TextStyle(fontSize: 18)),
                            Expanded(child: Center(
                              child: Container(
                                margin: const EdgeInsets.only(right: 25),
                                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: appThemeColor
                                      ),
                                      borderRadius: const BorderRadius.all(Radius.circular(5))
                                  ),
                                  child: Text('$numberOfChairsInSelectedTable',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: appThemeColor))),
                            )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(
                              flex: 2, child: Text('Available Seats',style: TextStyle(fontSize: 18))),
                            const Text('-',style: TextStyle(fontSize: 18)),
                            Expanded(child: Center(
                              child: Container(
                                  margin: const EdgeInsets.only(right: 25),
                                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: appThemeColor
                                      ),
                                      borderRadius: const BorderRadius.all(Radius.circular(5))
                                  ),
                                  child: Text('${int.parse(numberOfChairsInSelectedTable ?? '0') - _numberOfPersons}',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: appThemeColor))),
                            )),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(
                            flex: 2,
                              child: Text('Members',style: TextStyle(fontSize: 18))),
                          const Expanded(child: Text(':')),
                          Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                OrderMemberAddWidget(iconData: Icons.remove, onTap: !_fullyOccupiedStatus ? () {
                                  if(_numberOfPersons!=0)
                                  {
                                    setState(() {
                                      _numberOfPersons -= 1;
                                    });
                                  }
                                } : (){}),
                                Expanded(
                                  child: Container(
                                    // margin: EdgeInsets.symmetric(horizontal: 10),
                                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: appThemeColor
                                        ),
                                        borderRadius: const BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: Center(child: Text('$_numberOfPersons',style: const TextStyle(fontSize: 16))),
                                  ),
                                ),
                                OrderMemberAddWidget(iconData: Icons.add, onTap: !_fullyOccupiedStatus ? () {
                                  print('_numberOfPersons = $_numberOfPersons,\nnumberOfChairsInSelectedTable = $numberOfChairsInSelectedTable');
                                  setState(() {
                                    if(_numberOfPersons<double.parse(numberOfChairsInSelectedTable ?? '0'))
                                    {
                                      _numberOfPersons += 1;
                                    }else{
                                      _fullyOccupiedStatus = true;
                                    }
                                  });
                                } : (){})
                              ],
                            ),
                          ),
                        ],
                      ),
                      OrderNameNumberFieldWidget(title: 'Name', controller: _customerNameController),
                      OrderNameNumberFieldWidget(title: 'Number', controller: _customerMobileController),
                      Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.fromLTRB(5,2,10,2),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          border: Border.all(color: appThemeColor)
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: Checkbox(value: _fullyOccupiedStatus, onChanged: (v){
                                setState(() {
                                  _fullyOccupiedStatus = v ?? false;
                                });
                              }),
                            ),
                            GestureDetector(onTap : ()=>setState(()=>_fullyOccupiedStatus = !_fullyOccupiedStatus),child: const Text('Fully Occupied',style: TextStyle(fontSize: 18),)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color?>(appThemeColor),
                          foregroundColor: WidgetStateProperty.all<Color?>(Colors.white)
                        ),onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewOrderScreen()));
                      }, child: const Text('Take Order',style: TextStyle(fontSize: 18)))
                    ],
                  ),
                ),
              ),
            ),
          ),
          FullScreenLoadingWidget(isLoading: _isLoading)
        ],
      ),
    ));
  }
}

class OrderNameNumberFieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const OrderNameNumberFieldWidget({
    super.key, required this.title, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
              child: Text(title,style: const TextStyle(fontSize: 16))),
          const Expanded(
            flex: 1,
              child: Center(child: Text(':',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),))),
          Expanded(
            flex: 7,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                focusColor: Colors.white,
                border: _textFieldBorder(),
                focusedBorder: _textFieldBorder(focusedSize: 2),
                enabledBorder: _textFieldBorder(),
                disabledBorder: _textFieldBorder(),
                errorBorder: _textFieldBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder _textFieldBorder({double? focusedSize}) => OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(color: appThemeColor,width: focusedSize??1)
  );
}

class OrderMemberAddWidget extends StatelessWidget {
  final IconData iconData;
  final Function() onTap;
  const OrderMemberAddWidget({
    super.key, required this.iconData, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: appThemeColor,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: appThemeColor)
            ),
              child: Icon(iconData,color: Colors.white))),
    );
  }
}

