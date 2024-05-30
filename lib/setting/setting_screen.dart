import 'package:captain_app/utils/colors.dart';
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
        title: Row(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: const Image(image: AssetImage('assets/appBarBgImage.png'),fit: BoxFit.fill,)),
            const Spacer(),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Jayaraj J', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
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
            const SettingFiledWidget(leadingIcon: Icons.print_outlined, title: 'KOT Printers'),
            const SettingFiledWidget(leadingIcon: Icons.print_outlined, title: 'Waiter Printer'),
            SettingFiledWidget(leadingIcon: Icons.countertops_outlined, title: 'Till',trailingWidget: Text('T03-CR2-Android',style: TextStyle(color: Colors.grey.shade600,fontSize: 14))),
            const SettingFiledWidget(leadingIcon: Icons.sync, title: 'Sync masters'),
            SettingFiledWidget(leadingIcon: Icons.pin_end, title: 'Show prices',trailingWidget: Switch(
                activeColor: Colors.orange,
                value: showPriceSwitch, onChanged: (value){
              setState(() {
                showPriceSwitch = value;
              });
            })),
            SettingFiledWidget(leadingIcon: Icons.sticky_note_2_rounded, title: 'Show Categories',trailingWidget: Switch(
                activeColor: Colors.orange,
                value: showPriceSwitch, onChanged: (value){
              setState(() {
                showPriceSwitch = value;
              });
            })),
            SettingFiledWidget(leadingIcon: Icons.type_specimen_outlined, title: 'Show types',trailingWidget: Switch(
                activeColor: Colors.orange,
                value: showPriceSwitch, onChanged: (value){
              setState(() {
                showPriceSwitch = value;
              });
            })),
            SettingFiledWidget(leadingIcon: Icons.event_note, title: 'Product list view in POS',trailingWidget: Switch(
                activeColor: Colors.orange,
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
}

class SettingFiledWidget extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final Widget? trailingWidget;
  const SettingFiledWidget({
    super.key, required this.leadingIcon, required this.title, this.trailingWidget,
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
        side: title == 'LOGOUT' ? WidgetStateProperty.all(const BorderSide(color: Colors.orange, width: 2)) : null,
        backgroundColor: WidgetStateProperty.all<Color?>(title != 'LOGOUT' ? appThemeColor : scaffoldBgColor),
        foregroundColor: WidgetStateProperty.all<Color?>(title != 'LOGOUT' ? Colors.white : Colors.orange),
      ),
        onPressed: (){}, child: Text(title,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600)));
  }
}
