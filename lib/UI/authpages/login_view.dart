import 'package:finap_test/DB/user_database.dart';
import 'package:finap_test/UI/Dashbord/dashbord_view.dart';
import 'package:finap_test/common/theme.dart';
import 'package:finap_test/models/user.dart';
import 'package:finap_test/provider/data_provider.dart';
import 'package:finap_test/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authFormKey = GlobalKey<FormState>();
  final TextEditingController _idControler = TextEditingController();
  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _passwordControler = TextEditingController();
  bool isLogin = true;
  bool isPassword = false;
  List users = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _idControler.dispose();
    _emailControler.dispose();
    _passwordControler.dispose();
  }

  signIn() {
    DBHelper.getUserData("users").then((value) {
      print("all users $value");
    });
    DBHelper.loginUser(
      _idControler.text.toString(),
      _passwordControler.text.toString(),
    );
    Navigator.pushNamed(
      context,
      DashbordScreen.routeName,
    );
  }

  loginMethod() {
    if (_authFormKey.currentState!.validate()) {
      if (isLogin) {
        signIn();
      } else if (!isLogin) {
        Provider.of<DataProvider>(
          context,
          listen: false,
        ).addUser(
          Users(
            id: DateTime.now().toString(),
            userId: _idControler.text.toString(),
            email: _emailControler.text.toString(),
            password: _passwordControler.text.toString(),
          ),
        );
        Navigator.pushNamed(
          context,
          DashbordScreen.routeName,
        );
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DBHelper.createTable();
    ApiManager().getNews();
    ApiManager().searchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(170),
          left: ScreenUtil().setWidth(20),
          right: ScreenUtil().setHeight(20),
        ),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Wellcome To News APP",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(30),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(50),
            ),
            SingleChildScrollView(
              child: Form(
                key: _authFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _idControler,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "User ID",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().setHeight(16),
                          ),
                          borderSide: const BorderSide(
                              color: AppColors.primaryColor,
                              width: 1,
                              style: BorderStyle.solid),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return "Please Enter the User ID";
                        } else if (value.length < 4 || value.length > 4) {
                          return "User Id Should be 4 digits";
                        }
                      },
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    if (!isLogin)
                      TextFormField(
                        controller: _emailControler,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              ScreenUtil().setHeight(16),
                            ),
                            borderSide: const BorderSide(
                              color: AppColors.primaryColor,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "Please Enter Email Id";
                          }
                        },
                      ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    TextFormField(
                      controller: _passwordControler,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !isPassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                          icon: Icon(
                            !isPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().setHeight(16),
                          ),
                          borderSide: const BorderSide(
                              color: AppColors.primaryColor,
                              width: 1,
                              style: BorderStyle.solid),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return "Please Enter the Password";
                        }
                      },
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(30),
                    ),
                    GestureDetector(
                      onTap: loginMethod,
                      child: Container(
                        height: ScreenUtil().setHeight(50),
                        width: ScreenUtil().setWidth(100),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(
                            6,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            isLogin ? "Login" : "SignUp",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              // fontFamily: manaropeSemiBold,
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                      child: Text(
                        isLogin ? "SignUp" : "Login",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
