import 'package:captain_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showErrorAlertDialog({required BuildContext context,required String message,Function()? onPressed})
{
  showDialog(context: context,barrierDismissible: false, builder: (BuildContext context){
    return AlertDialog(
      title: const Text('Error',style: TextStyle(color: Colors.red)),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: onPressed ?? ()=>Navigator.of(context).pop(),
          child: const Text('OK',style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  });
}

void showCustomAlertDialog({required BuildContext context,String? message,String? title,Function()? onTap})
{
  showDialog(context: context,barrierDismissible: false, builder: (BuildContext context){
    return AlertDialog(
      title: title!=null? Text(title) : null,
      content: message!=null?Text(message):null,
      actions: <Widget>[
        TextButton(
          onPressed:()=>Navigator.of(context).pop(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onTap ?? ()=>Navigator.of(context).pop(),
                  child: Text('OK',style: TextStyle(color: appThemeColor))),
            ],
          ),
        ),
      ],
    );
  });
}