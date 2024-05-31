import 'package:captain_app/utils/colors.dart';
import 'package:flutter/material.dart';
import '../model/cart_models/customer_list_model.dart';
import '../services/network_services/cart_screen_services.dart';
import '../utils/custom_widgets/notification_widget.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  // List<CustomerData>? _customerList;

  Future<List<CustomerData>?> _getCustomerListData() async {
      return getCustomerListData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.close),
        title: const Text('Customer'),
        actions: [
          ElevatedButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(const EdgeInsets.symmetric(horizontal: 30)),
                  backgroundColor:
                      WidgetStateProperty.all<Color?>(Colors.orange.shade800),
                  foregroundColor:
                      WidgetStateProperty.all<Color?>(Colors.white),
                  shape: WidgetStateProperty.all<OutlinedBorder?>(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))))),
              onPressed: () {},
              child: const Text('ADD')),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: Icon(Icons.search, color: Colors.grey.shade700),
                    enabledBorder: _searchFieldBorder(),
                    focusedBorder: _searchFieldBorder(),
                  ),
                ),
              ),
              Expanded(child:  FutureBuilder<List<CustomerData>?>(
                future: _getCustomerListData(),
                builder: (BuildContext context, AsyncSnapshot<List<CustomerData>?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    showErrorAlertDialog(context: context, message: snapshot.error.toString());
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return ListView.builder(itemCount: snapshot.data?.length,itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:3),
                        child: GestureDetector(
                          onTap: (){
                            _showCustomerDetailDialog(context: context,
                                name: '${snapshot.data?[index].ledgerName}',
                                phoneNumber: '${snapshot.data?[index].mobile}', email: '${snapshot.data?[index].email}',
                                address: '${snapshot.data?[index].billingAddressLine1}');
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Text('${snapshot.data?[index].ledgerName}',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                                  Expanded(child: Text('${snapshot.data?[index].email}',style: const TextStyle(color: Colors.grey),textAlign: TextAlign.end,)),
                                ],
                              ),
                              const SizedBox(height: 5,),
                              Row(
                                children: [
                                  Expanded(child: Text('${snapshot.data?[index].billingCity}',style: const TextStyle(color: Colors.grey))),
                                  Expanded(child: Text('${snapshot.data?[index].mobile}',style: const TextStyle(color: Colors.grey),textAlign: TextAlign.end,)),
                                ],
                              ),
                              const SizedBox(height: 5,),
                              const Divider()
                            ],
                          ),
                        ),
                      );
                    });
                  } else {
                    return Text('No data');
                  }
                },
              ))
            ],
          )
        ],
      ),
    ));
  }

  _showCustomerDetailDialog({required BuildContext context,required String name,required String phoneNumber,required String email,required String address})
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          title: Text(name,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomerListDialogFieldWidget(iconData: Icons.call, value: phoneNumber),
              CustomerListDialogFieldWidget(iconData: Icons.mail_outline_outlined, value: email),
              CustomerListDialogFieldWidget(iconData: Icons.location_on, value: address)
            ],
          ),
          actions: const <Widget>[
            CustomerDialogAddWidget(btTitle: 'CLOSE'),
            SizedBox(width: 1),
            CustomerDialogAddWidget(btTitle: 'ADD'),
          ],
        );
      },
    );
  }

  OutlineInputBorder _searchFieldBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: Colors.grey));
  }
}

class CustomerDialogAddWidget extends StatelessWidget {
  final String btTitle;
  const CustomerDialogAddWidget({
    super.key, required this.btTitle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(EdgeInsets.symmetric(horizontal: btTitle == 'ADD' ? 27: 20)),
          backgroundColor: WidgetStateProperty.all<Color?>(btTitle == 'ADD' ? Colors.teal.shade700 : Colors.grey),
          foregroundColor: WidgetStateProperty.all<Color?>(Colors.white),
          shape: WidgetStateProperty.all<OutlinedBorder?>(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))
          ))
      ),
      child: Text(btTitle),
      onPressed: () {
        Navigator.of(context).pop(); // Close the dialog
        // Handle the OK action here if needed
      },
    );
  }
}

class CustomerListDialogFieldWidget extends StatelessWidget {
  final IconData iconData;
  final String value;
  const CustomerListDialogFieldWidget({
    super.key, required this.iconData, required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(iconData,color: Colors.grey.shade600),
        const SizedBox(width: 10),
        Text(value,style: TextStyle(color: Colors.grey.shade600))
      ],
    );
  }
}
