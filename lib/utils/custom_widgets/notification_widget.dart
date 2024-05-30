import 'package:flutter/material.dart';

void showErrorAlertDialog({required BuildContext context,required String message})
{
  showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      title: const Text('Error',style: TextStyle(color: Colors.red)),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed:()=>Navigator.of(context).pop(),
          child: const Text('OK',style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  });
}