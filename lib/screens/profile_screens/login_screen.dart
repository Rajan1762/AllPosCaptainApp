import 'package:captain_app/utils/colors.dart';
import 'package:flutter/material.dart';
import '../../model/errorResponseModel.dart';
import '../../model/profile_models.dart';
import '../../services/network_services/profile_services.dart';
import '../../utils/custom_widgets/full_screen_loading_widget.dart';
import '../../utils/custom_widgets/notification_widget.dart';
import '../home_screen/home_main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool checkBoxStatus = true;
  StringBuffer accountId =StringBuffer();
  StringBuffer userName =StringBuffer();
  StringBuffer password =StringBuffer();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<ErrorResponseModel> _loginUser(
      {required String userName, required String password, required String accountID}) async {
    UserBaseModel? obj;
    String? message;
    try {
      obj = await loginUser(userName: userName, password: password, accountID: accountID);
      print('obj = $obj');
    } catch (e) {
      message = e.toString();
      print('Error Occurred $e');
    }
    print('objsgsg = $obj');
    return ErrorResponseModel(obj: obj, errorMessage: message);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Image(image: AssetImage('assets/loginBgImage.png')),
                        LoginFieldWidget(labelText: 'Account ID',onChanged:(s){accountId.clear();accountId.write(s);}),
                        LoginFieldWidget(labelText: 'Username',onChanged:(s){userName.clear();userName.write(s);}),
                        LoginFieldWidget(labelText: 'Password', obscureStatus: true,onChanged:(s){password.clear();password.write(s);}),
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
                                      15.0),
                                )),
                                padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
                                    const EdgeInsets.all(15)),
                                backgroundColor:
                                    WidgetStateProperty.all<Color?>(appThemeColor),
                                foregroundColor:
                                    WidgetStateProperty.all<Color?>(Colors.white),
                              ),
                              onPressed: () {
                                if(_formKey.currentState!.validate())
                                  {
                                    setState(() => _isLoading=true);
                                    _loginUser(userName: userName.toString(), password: password.toString(), accountID: accountId.toString()).then((e){
                                      if (context.mounted) {
                                        setState(() => _isLoading=false);
                                        if (e.obj != null) {
                                          if(!e.obj.status!)
                                          {
                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                              content: Text('UserName Or Password is Incorrect'),
                                            ));
                                          }else{
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomeMainScreen()));
                                          }
                                        } else {
                                          showErrorAlertDialog(context: context, message: e.errorMessage ?? '');
                                        }
                                      }
                                    });
                                  }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text('Fill all fields to Login'),
                                  ));
                                }
                              },
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                              )),
                        )
                      ],
                    ),
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

class LoginFieldWidget extends StatelessWidget {
  final String labelText;
  final bool? obscureStatus;
  final Function(String) onChanged;

  const LoginFieldWidget({
    super.key,
    required this.labelText,
    this.obscureStatus, required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: TextFormField(
        obscureText: obscureStatus ?? false,
        onChanged: onChanged,
        validator: (s){
          if(s==null|| s.isEmpty)
            {
              return 'Field cannot be empty';
            }
          return null;
        },
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 18),
          suffixIcon: obscureStatus != null
              ? Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey.shade600,
                )
              : null,
          errorBorder: borderStyle(),
          focusedErrorBorder: borderStyle(),
          focusedBorder: borderStyle(),
          enabledBorder: borderStyle(),
          disabledBorder: borderStyle(),
        ),
      ),
    );
  }

  OutlineInputBorder borderStyle() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(color: Colors.grey));
  }
}
