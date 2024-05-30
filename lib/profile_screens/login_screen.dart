import 'package:captain_app/home_screen/home_main_screen.dart';
import 'package:captain_app/utils/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool checkBoxStatus = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image(image: AssetImage('assets/loginBgImage.png')),
                LoginFieldWidget(labelText: 'Account ID'),
                LoginFieldWidget(labelText: 'Username'),
                LoginFieldWidget(labelText: 'Password', obscureStatus: true),
                Row(
                  children: [
                    Checkbox(
                        activeColor: Colors.orange.shade600,
                        value: checkBoxStatus,
                        onChanged: (s) {
                          setState(() {
                            checkBoxStatus = s ?? false;
                          });
                        }),
                    Text('Remember me',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all<OutlinedBorder?>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Set the border radius here
                        )),
                        padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
                            const EdgeInsets.all(15)),
                        backgroundColor:
                            WidgetStateProperty.all<Color?>(appThemeColor),
                        foregroundColor:
                            WidgetStateProperty.all<Color?>(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomeMainScreen()));
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class LoginFieldWidget extends StatelessWidget {
  final String labelText;
  final bool? obscureStatus;

  const LoginFieldWidget({
    super.key,
    required this.labelText,
    this.obscureStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: TextFormField(
        obscureText: obscureStatus ?? false,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 18),
          suffixIcon: obscureStatus != null
              ? Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey.shade600,
                )
              : null,
          focusedBorder: borderStyle(),
          enabledBorder: borderStyle(),
          disabledBorder: borderStyle(),
        ),
      ),
    );
  }

  OutlineInputBorder borderStyle() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(color: Colors.grey));
  }
}
