import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class KotPrintDetailScreen extends StatefulWidget {
  const KotPrintDetailScreen({super.key});

  @override
  State<KotPrintDetailScreen> createState() => _KotPrintDetailScreenState();
}

class _KotPrintDetailScreenState extends State<KotPrintDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _printImageStatus = false;

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text('KOT Printers')),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    KOTPrintFieldWidget(
                        labelText: 'Kitchen Name', onChanged: (s) {}, initialValue: 'Chinesey2aad'),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: KOTPrintFieldWidget(
                                labelText: 'IP Address', onChanged: (s) {}, initialValue: '192.168.1.10')),
                        const SizedBox(width: 10),
                        Expanded(
                            flex: 1,
                            child: KOTPrintFieldWidget(
                                labelText: 'Port', onChanged: (s) {}, initialValue: '9100'))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Print as image',
                            style: TextStyle(color: Colors.grey)),
                        Switch(
                            activeColor: appThemeColor,
                            value: _printImageStatus,
                            onChanged: (value) {
                              setState(() {
                                _printImageStatus = value;
                              });
                            })
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: KOTPrintFieldWidget(
                                labelText: 'Start Feed', onChanged: (s) {}, initialValue: '0')),
                        const SizedBox(width: 10),
                        Expanded(
                            child: KOTPrintFieldWidget(
                                labelText: 'End Feed', onChanged: (s) {}, initialValue: '0')),
                      ],
                    ),
                    KOTPrintFieldWidget(labelText: 'Image Command', onChanged: (s) {},suffixIcon: const Icon(Icons.arrow_drop_down), initialValue: 'None'),
                    KOTPrintFieldWidget(labelText: 'Start Command', onChanged: (s) {},suffixIcon: const Icon(Icons.arrow_drop_down), initialValue: 'None'),
                    KOTPrintFieldWidget(labelText: 'End Command', onChanged: (s) {},suffixIcon: const Icon(Icons.arrow_drop_down), initialValue: 'None'),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.print_outlined,color: appThemeColor),
                        const SizedBox(width: 10),
                        Text('TEST PRINT',style: TextStyle(color: appThemeColor,fontSize: 16))
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class KOTPrintFieldWidget extends StatelessWidget {
  final String labelText;
  final String initialValue;
  final Function(String) onChanged;
  final Widget? suffixIcon;

  const KOTPrintFieldWidget({
    super.key,
    required this.labelText,
    required this.onChanged, this.suffixIcon, required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        initialValue: initialValue,
        style: const TextStyle(color: Colors.grey),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey.shade700),
          border: _kotFieldBorder(),
          enabledBorder: _kotFieldBorder(),
          errorBorder: _kotFieldBorder(),
          focusedBorder: _kotFieldBorder(),
          disabledBorder: _kotFieldBorder(),
          suffixIcon: suffixIcon
        ),
        onChanged: onChanged,
      ),
    );
  }

  OutlineInputBorder _kotFieldBorder() => const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: Colors.grey));
}
