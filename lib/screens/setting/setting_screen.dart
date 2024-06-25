import 'package:captain_app/model/till_model.dart';
import 'package:captain_app/screens/setting/kot_print_detail_screen.dart';
import 'package:captain_app/utils/colors.dart';
import 'package:captain_app/utils/common_values.dart';
import 'package:captain_app/utils/constants.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool showPriceSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading : false,
        title: Row(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: const Image(image: AssetImage(kAppBarBGImage))),
            const Spacer(),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Rajan D', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                Text('Admin', style: TextStyle(fontSize: 14))
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            const SizedBox(
              height: 130,
                child: Image(image: AssetImage(kUserDummyImage),fit: BoxFit.fill,)),
            const Text('E001 - Jayaraj J',style: TextStyle(fontSize: 16),),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SettingChangePinBtWidget(title: 'CHANGE PIN', onPressed: () {  },),
                  const SizedBox(width: 10),
                  SettingChangePinBtWidget(title: 'LOGOUT', onPressed: () {  },),
                ],
              ),
            ),
            SettingFiledWidget(leadingIcon: Icons.print_outlined, title: 'KOT Printers',onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const KotPrintDetailScreen()));
            }),
            const SettingFiledWidget(leadingIcon: Icons.print_outlined, title: 'Waiter Printer'),
            SettingFiledWidget(leadingIcon: Icons.countertops_outlined, title: 'Till',trailingWidget: Text('T03-CR2-Android',style: TextStyle(color: Colors.grey.shade600,fontSize: 14)),
            onTap: (){
              print('kTillVal = $kTillVal');
              if(tillBaseModel!=null)
                {
                  tillAlertDialog(context: context);
                }
            }),
            const SettingFiledWidget(leadingIcon: Icons.sync, title: 'Sync masters'),
            SettingFiledWidget(leadingIcon: Icons.pin_end, title: 'Show prices',trailingWidget: Switch(
                activeColor: appThemeColor,
                value: showPriceSwitch, onChanged: (value){
              setState(() {
                showPriceSwitch = value;
              });
            })),
            SettingFiledWidget(leadingIcon: Icons.sticky_note_2_rounded, title: 'Show Categories',trailingWidget: Switch(
                activeColor: appThemeColor,
                value: showPriceSwitch, onChanged: (value){
              setState(() {
                showPriceSwitch = value;
              });
            })),
            SettingFiledWidget(leadingIcon: Icons.type_specimen_outlined, title: 'Show types',trailingWidget: Switch(
                activeColor: appThemeColor,
                value: showPriceSwitch, onChanged: (value){
              setState(() {
                showPriceSwitch = value;
              });
            })),
            SettingFiledWidget(leadingIcon: Icons.event_note, title: 'Product list view in POS',trailingWidget: Switch(
                activeColor: appThemeColor,
                value: showPriceSwitch, onChanged: (value){
              setState(() {
                showPriceSwitch = value;
              });
            })),
            const SettingFiledWidget(leadingIcon: Icons.translate, title: 'Language'),
            const SettingFiledWidget(leadingIcon: Icons.info_outline_rounded, title: 'About'),
          ],
        ),
      ),
    );
  }

  Future<dynamic> tillAlertDialog({required BuildContext context}) {
    return showDialog(context: context, builder: (BuildContext context){
                  return Dialog(
                    insetPadding: const EdgeInsets.all(0),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const TillAlertDialogStatefulWidget(),
                    ),
                  );
                });
  }
}

class TillAlertDialogStatefulWidget extends StatefulWidget {
  const TillAlertDialogStatefulWidget({super.key});

  @override
  State<TillAlertDialogStatefulWidget> createState() => _TillAlertDialogStatefulWidgetState();
}

class _TillAlertDialogStatefulWidgetState extends State<TillAlertDialogStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20,10,5,20),
          child: Text('Select Till',style: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.w600,fontSize: 18),),
        ),
        Divider(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: tillBaseModel?.data?.length
                ,itemBuilder: (context,index){
              return InkWell(
                splashColor: appThemeColor,
                onTap: (){
                  print('tillBaseModel?.data?[index].isSelected = ${tillBaseModel?.data?[index].isSelected}');
                  kTillVal = tillBaseModel?.data?[index].tillCode ?? '';
                  kEnableCashRegisterVal = tillBaseModel?.data?[index].enableCashRegister ?? '';
                  for(int i = 0;i<tillBaseModel!.data!.length;i++)
                  {
                    if(i == index)
                    {
                      tillBaseModel?.data?[i].isSelected = true;
                    }else{
                      tillBaseModel?.data?[i].isSelected = false;
                    }
                  }
                  setState(() {
                    print('After isSelected = ${tillBaseModel?.data?[index].isSelected}');
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${tillBaseModel?.data?[index].tillName}',style: TextStyle(color: Colors.grey.shade600),),
                      Visibility(
                          visible: tillBaseModel?.data![index].isSelected ?? false,
                          child: Icon(Icons.check_circle_rounded,color: Colors.grey.shade600))
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(onTap: (){Navigator.of(context).pop();},child: Text('CANCEL',style: TextStyle(color: appThemeColor,fontSize: 18,fontWeight: FontWeight.w600))),
              const SizedBox(width: 20),
              GestureDetector(onTap: (){Navigator.of(context).pop();},child: const Text('CONFIRM',style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600))),
              const SizedBox(width: 10,)
            ],
          ),
        )
      ],
    );
  }
}


class SettingFiledWidget extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final Widget? trailingWidget;
  final Function()? onTap;
  const SettingFiledWidget({
    super.key, required this.leadingIcon, required this.title, this.trailingWidget,this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        ListTile(
          leading: Icon(leadingIcon,color: Colors.grey.shade700),
          title: Text(title,style: TextStyle(color: Colors.grey.shade600)),
          trailing: trailingWidget,
          onTap: onTap,
        )
      ],
    );
  }
}

class SettingChangePinBtWidget extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const SettingChangePinBtWidget({
    super.key, required this.title, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        side: title == 'LOGOUT' ? WidgetStateProperty.all(BorderSide(color: appThemeColor, width: 2)) : null,
        backgroundColor: WidgetStateProperty.all<Color?>(title != 'LOGOUT' ? appThemeColor : scaffoldBgColor),
        foregroundColor: WidgetStateProperty.all<Color?>(title != 'LOGOUT' ? Colors.white : appThemeColor),
      ),
        onPressed: (){}, child: Text(title,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600)));
  }
}
