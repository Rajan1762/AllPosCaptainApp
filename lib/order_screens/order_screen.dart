import 'package:captain_app/order_screens/new_order_screen.dart';
import 'package:captain_app/utils/colors.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String orderTypeDropDownValue = 'Dine In';
  String floorDropDownValue = 'First Floor';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: const Image(image: AssetImage('assets/appBarBgImage.png'),fit: BoxFit.fill,)),
            const Spacer(),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('TILL', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                Text('TO3-CR2-Android', style: TextStyle(fontSize: 14))
              ],
            )
          ],
        ),
      ),
      body: Column(
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
                const SizedBox(width: 15),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NewOrderScreen()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: appThemeColor,
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          border: const Border()
                      ),
                      child: const Center(child: Text('NEW ORDER',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white))),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(),
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(
                    height: 60,
                    child: DropDownOuterContainer(title: 'Floor', dropDownValue: floorDropDownValue, onChanged: (s){
                      setState(() {
                        floorDropDownValue = s??'';
                      });
                    }, dropDownList: floorDropDownList!, titleBgColor: scaffoldBgColor,),
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
              child: GridView.builder(itemCount: 3,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2),
                  itemBuilder: (_, index){
                    return Container(
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
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.teal.shade200,
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                    child: Center(child: Text('Order 1')),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text('8/4'),
                                      Container(
                                        height: 10,
                                        // width: 50,
                                        decoration: const BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius: BorderRadius.all(Radius.circular(5))
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
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border: Border.all(color: Colors.cyan)
                            ),
                            child: Center(child: Text('S$index',style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold,fontSize: 16))),
                          ),
                          Spacer(),
                          Container(
                            // height: 30,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: const BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                            ),
                            child: const Center(child: Text('OCCUPIED',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
                          )
                        ],
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
      ),
    );

  }
}

List<String>? orderTypeDropDownList = ['Dine In','TakeAway'];
List<String>? floorDropDownList = ['First Floor','Second Floor','Third Floor', 'Fourth Floor', 'Ground Floor'];

class DropDownOuterContainer extends StatelessWidget {
  final String title;
  final String dropDownValue;
  final Function(String?)? onChanged;
  final List<String> dropDownList;
  final Color titleBgColor;
  const DropDownOuterContainer({
    super.key, required this.title, required this.dropDownValue, required this.onChanged, required this.dropDownList, required this.titleBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.grey)
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              // hint: const Text('Select Waiter'),
              value: dropDownValue,
              items: dropDownList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(value: value, child: Text(value,style: TextStyle(color: Colors.grey.shade700)));
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 15,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
                color : titleBgColor,child: Text(title,style: TextStyle(color: Colors.grey),)))
      ],
    );
  }
}

