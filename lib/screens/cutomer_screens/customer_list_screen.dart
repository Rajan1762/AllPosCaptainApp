import 'package:captain_app/services/provider_services/product_provider_service.dart';
import 'package:captain_app/utils/colors.dart';
import 'package:captain_app/utils/custom_widgets/full_screen_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/cart_models/customer_list_model.dart';
import '../../model/cart_models/user_save_edit_model.dart';
import '../../model/order_models/order_response_model.dart';
import '../../services/network_services/cart_screen_services.dart';
import '../../utils/custom_widgets/notification_widget.dart';

class CustomerListScreen extends StatefulWidget {
  final OrderDataModel? orderDataModel;
  const CustomerListScreen({super.key, this.orderDataModel});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  final _formKey = GlobalKey<FormState>();
  StringBuffer customerName = StringBuffer();
  StringBuffer phoneNumber = StringBuffer();
  StringBuffer emailID = StringBuffer();
  StringBuffer taxNumber = StringBuffer();
  StringBuffer address1 = StringBuffer();
  StringBuffer address2 = StringBuffer();
  StringBuffer country = StringBuffer();
  StringBuffer state = StringBuffer();
  StringBuffer city = StringBuffer();
  StringBuffer pinCode = StringBuffer();
  // List<CustomerData>? _customerList;
  double _animatedHeightValue = 0;
  bool addCustomerStatus = false;
  late final Future<List<CustomerData>?> customerListData;
  bool _isLoading = false;

  Future<bool> _postNewUserData(BuildContext context) async {
    try {
      UserSaveEditModel userSaveEditModel = UserSaveEditModel(
          ledgerName: customerName.toString(),
          mobile: phoneNumber.toString(),
          email: emailID.toString(),
          billingAddressLine1: address1.toString(),
          billingAddressLine2: address2.toString(),
          billingCountry: country.toString(),
          billingState: state.toString(),
          billingCity: city.toString(),
          billingPincode: pinCode.toString(),
          gSTNumber: taxNumber.toString(),
          ledgerType: 'Customer',
          ledgerGroup: 'Sundry Debtors',
          payBillBy: 1,
          isActive: 1);
      return await postNewUserData(userModel: userSaveEditModel);
    } catch (e) {
      showErrorAlertDialog(context: context, message: e.toString());
      return false;
    }
  }

  Future<List<CustomerData>?> _getCustomerListData() async {
    return getCustomerListData();
  }

  @override
  void initState() {
    customerListData = _getCustomerListData();
    super.initState();
  }

  Future<void> _selectDate(BuildContext context,bool birthDateStatus) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: birthDateStatus ? (selectedBirthDate ?? DateTime.now()) : (selectedAnniversaryDate ?? DateTime.now()),
      firstDate: DateTime(1920),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        if (birthDateStatus) {
          if (pickedDate != selectedBirthDate) {
            selectedBirthDate = pickedDate;
          }
        } else {
          if (pickedDate != selectedAnniversaryDate) {
            selectedAnniversaryDate = pickedDate;
          }
        }
      });
    }
  }
  _openAddCustomerScreen(BuildContext context)
  {
    if(_animatedHeightValue > 0)
      {
        _animatedHeightValue -= (MediaQuery.of(context).size.height * 0.65).toInt();
      }else{
      _animatedHeightValue += (MediaQuery.of(context).size.height * 0.65).toInt();
    }
    _clearData();
    setState(() {
      addCustomerStatus = !addCustomerStatus;
    });
  }
  _clearData(){
    _formKey.currentState?.reset();
    customerName.clear();
    phoneNumber.clear();
    emailID.clear();
    taxNumber.clear();
    address1.clear();
    address2.clear();
    country.clear();
    state.clear();
    city.clear();
    pinCode.clear();
    selectedBirthDate = null;
    selectedAnniversaryDate = null;
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
          children: [
            Scaffold(
                  appBar: AppBar(
            leading: GestureDetector(onTap: (){
              Navigator.of(context).pop();
            },child: const Icon(Icons.close)),
            title: const Text('Customer'),
            actions: [
              ElevatedButton(
                  style: ButtonStyle(
                      padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
                          const EdgeInsets.symmetric(horizontal: 30)),
                      backgroundColor:
                          WidgetStateProperty.all<Color?>(Colors.orange.shade800),
                      foregroundColor:
                          WidgetStateProperty.all<Color?>(Colors.white),
                      shape: WidgetStateProperty.all<OutlinedBorder?>(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))))),
                  onPressed: () {
                    _openAddCustomerScreen(context);
                  },
                  child: const Text('ADD')),
              const SizedBox(
                width: 10,
              )
            ],
                  ),
                  body: Consumer<ProductProviderService>(
                    builder: (context, productProvider, _) {
                      return Column(
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
                          Expanded(
                              child: FutureBuilder<List<CustomerData>?>(
                                future: customerListData,
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<CustomerData>?> snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return const Center(
                                      child: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: CircularProgressIndicator(strokeWidth: 6,)),
                                    );
                                  } else if (snapshot.hasError) {
                                    showErrorAlertDialog(
                                        context: context, message: snapshot.error.toString());
                                    return Text('Error: ${snapshot.error}');
                                  } else if (snapshot.hasData) {
                                    return ListView.builder(
                                        itemCount: snapshot.data?.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 3),
                                            child: GestureDetector(
                                              onTap: () {
                                                _showCustomerDetailDialog(
                                                    context: context,
                                                    name: '${snapshot.data?[index].ledgerName}',
                                                    phoneNumber:
                                                    '${snapshot.data?[index].mobile}',
                                                    email: '${snapshot.data?[index].email}',
                                                    address:
                                                    '${snapshot.data?[index].billingAddressLine1}', cancelPressed: () {
                                                  Navigator.of(context).pop();
                                                }, addPressed: () {
                                                if(widget.orderDataModel!=null)
                                                  {
                                                    productProvider.setSelectUserData(orderDataModel: widget.orderDataModel!, customerData: snapshot.data![index]);
                                                    Navigator.of(context).pop();
                                                  }
                                                Navigator.of(context).pop();
                                                });
                                              },
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                            '${snapshot.data?[index].ledgerName}',
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.bold),
                                                          )),
                                                      Expanded(
                                                          child: Text(
                                                            '${snapshot.data?[index].email}',
                                                            style:
                                                            const TextStyle(color: Colors.grey),
                                                            textAlign: TextAlign.end,
                                                          )),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                              '${snapshot.data?[index].billingCity}',
                                                              style: const TextStyle(
                                                                  color: Colors.grey))),
                                                      Expanded(
                                                          child: Text(
                                                            '${snapshot.data?[index].mobile}',
                                                            style:
                                                            const TextStyle(color: Colors.grey),
                                                            textAlign: TextAlign.end,
                                                          )),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Divider()
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  } else {
                                    return const Text('No data');
                                  }
                                },
                              ))
                        ],
                      );
                    },
                  ),
                ),
            Visibility(
              visible: addCustomerStatus,
              child: Container(
                color: Colors.black54,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Positioned(
              bottom: 0,
              child: AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 500),
                height: _animatedHeightValue,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Scaffold(
                  body: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.teal.shade600,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      _openAddCustomerScreen(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5, right: 15),
                                      child: Icon(Icons.close,color: Colors.grey.shade800),
                                    ),
                                  ),
                                  const Expanded(child: Text('Add Customer',style: TextStyle(color: Colors.white,fontSize: 16))),
                                  Expanded(
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
                                                const EdgeInsets.symmetric(horizontal: 30,vertical: 5)),
                                            backgroundColor:
                                            WidgetStateProperty.all<Color?>(Colors.orange.shade800),
                                            foregroundColor:
                                            WidgetStateProperty.all<Color?>(Colors.white),
                                            shape: WidgetStateProperty.all<OutlinedBorder?>(
                                                const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))))),
                                        onPressed: () async {
                                          setState(()=>_isLoading = true);
                                          bool result = await _postNewUserData(context);
                                          _isLoading = false;
                                          if(context.mounted)
                                            {
                                              _openAddCustomerScreen(context);
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result ? 'User Saved Successfully': 'Something Went Wrong Try Again Later')));
                                            }
                                        },
                                        child: const Text('SAVE')),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          AddNewScreenFieldWidget(hintText1: 'Customer Name', hintText2: 'TAX/UID Number',
                            onChanged1: (s) { customerName.clear();customerName.write(s); }, onChanged2: (s) { taxNumber.clear(); taxNumber.write(s); },),
                          AddNewScreenFieldWidget(hintText1: 'Phone *', hintText2: 'Email',
                            onChanged1: (s) { phoneNumber.clear();phoneNumber.write(s); }, onChanged2: (s) { emailID.clear();emailID.write(s); },),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 15),
                            child: Text('Address',style: TextStyle(
                              fontSize: 16,
                              color: appThemeColor,
                              fontWeight: FontWeight.bold
                            )),
                          ),
                          AddNewScreenFieldWidget(hintText1: 'Address', hintText2: 'City',
                            onChanged1: (s) { address1.clear();address1.write(s); }, onChanged2: (s) { city.clear(); city.write(s); },),
                          AddNewScreenFieldWidget(hintText1: 'State', hintText2: 'Pincode',
                            onChanged1: (s) { state.clear();state.write(s); }, onChanged2: (s) { pinCode.clear(); pinCode.write(s); },),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 15),
                            child: Text('Personal details',style: TextStyle(
                                fontSize: 16,
                                color: appThemeColor,
                                fontWeight: FontWeight.bold
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                            child: Row(
                              children: [
                                AddCustomerBirthDateWidget(hintTextValue: 'Birthday', dateValue: selectedBirthDate == null? '' : '${selectedBirthDate?.day}-${selectedBirthDate?.month}-${selectedBirthDate?.year}',
                                  onTap: () {
                                  _selectDate(context,true); },),
                                const SizedBox(width: 15),
                                AddCustomerBirthDateWidget(hintTextValue: 'Anniversary', dateValue: selectedBirthDate == null? '' : '${selectedBirthDate?.day}-${selectedBirthDate?.month}-${selectedBirthDate?.year}',
                                  onTap: () { _selectDate(context,false); },)
                              ],
                            ),
                          ),
                          // const AddNewScreenFieldWidget(hintText1: 'Address', hintText2: 'City'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FullScreenLoadingWidget(isLoading: _isLoading,),
          ],
        ));
  }

  _showCustomerDetailDialog(
      {required BuildContext context,
      required String name,
      required String phoneNumber,
      required String email,
      required String address,required Function() cancelPressed,required Function() addPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          title: Text(name,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomerListDialogFieldWidget(
                  iconData: Icons.call, value: phoneNumber),
              CustomerListDialogFieldWidget(
                  iconData: Icons.mail_outline_outlined, value: email),
              CustomerListDialogFieldWidget(
                  iconData: Icons.location_on, value: address)
            ],
          ),
          actions: <Widget>[
            CustomerDialogAddWidget(btTitle: 'CLOSE', onTap: cancelPressed),
            const SizedBox(width: 1),
            CustomerDialogAddWidget(btTitle: 'ADD', onTap: addPressed),
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

class AddCustomerBirthDateWidget extends StatelessWidget {
  final String hintTextValue;
  final String dateValue;
  final Function() onTap;
  const AddCustomerBirthDateWidget({
    super.key, required this.hintTextValue, required this.dateValue, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          elevation: 2,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(hintTextValue,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: dateValue =='' ? 16 : 10)),
                    Visibility(
                      visible:  dateValue !='',
                        child: Text(dateValue))
                  ],
                ),
                Icon(Icons.calendar_month_outlined,color: Colors.grey.shade600,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

DateTime? selectedBirthDate;
DateTime? selectedAnniversaryDate;

class AddNewScreenFieldWidget extends StatelessWidget {
  final String hintText1;
  final String hintText2;
  final Function(String) onChanged1;
  final Function(String) onChanged2;
  const AddNewScreenFieldWidget({
    super.key, required this.hintText1, required this.hintText2, required this.onChanged1, required this.onChanged2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Material(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              elevation: 2,
              child: TextFormField(
                decoration: fieldDecoration(hintText1),
                onChanged: onChanged1,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Material(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              elevation: 2,
              child: TextFormField(
                decoration: fieldDecoration(hintText2),
                onChanged: onChanged2,
              ),
            ),
          )
        ],
      ),
    );
  }

  InputDecoration fieldDecoration(String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
          focusColor: Colors.white,
          hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      enabledBorder: outlineInputBorderMethod(),
        focusedBorder: outlineInputBorderMethod()
        );
  }

  OutlineInputBorder outlineInputBorderMethod() => const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(color: Colors.white)
  );
}

class CustomerDialogAddWidget extends StatelessWidget {
  final String btTitle;
  final Function() onTap;

  const CustomerDialogAddWidget({
    super.key,
    required this.btTitle, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
              EdgeInsets.symmetric(horizontal: btTitle == 'ADD' ? 27 : 20)),
          backgroundColor: WidgetStateProperty.all<Color?>(
              btTitle == 'ADD' ? Colors.teal.shade700 : Colors.grey),
          foregroundColor: WidgetStateProperty.all<Color?>(Colors.white),
          shape: WidgetStateProperty.all<OutlinedBorder?>(
              const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))))),
      child: Text(btTitle),
      onPressed: onTap,
    );
  }
}

class CustomerListDialogFieldWidget extends StatelessWidget {
  final IconData iconData;
  final String value;

  const CustomerListDialogFieldWidget({
    super.key,
    required this.iconData,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(iconData, color: Colors.grey.shade600),
        const SizedBox(width: 10),
        Text(value, style: TextStyle(color: Colors.grey.shade600))
      ],
    );
  }
}
