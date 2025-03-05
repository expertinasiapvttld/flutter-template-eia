import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happy_grocers/utils/asset_helper.dart';
import 'package:happy_grocers/router/hg_navigator.dart';
import 'package:happy_grocers/router/hg_route.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool _isPasswordVisible = true;
  AutovalidateMode validateMode = AutovalidateMode.disabled;
  bool autoValidateMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetHelper.loginBg),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SvgPicture.asset(
                  AssetHelper.logo,
                  height: 50,
                  width: 50,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Guest",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                    ),
                  ),
                ),
              ]),
              const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  )),
              SizedBox(
                height: 3.h,
              ),
              Center(
                child: Card(
                  elevation: 8,
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: <Widget>[
                        _buildEmailField(context),
                        const Divider(
                          indent: 10,
                          endIndent: 10,
                        ),
                        _buildPasswordField(context),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              _buildForgotPasswordWidget(context),
              SizedBox(
                height: 2.h,
              ),
              _buildLoginButton(context),
              SizedBox(
                height: 2.h,
              ),
              _dividerTextWidget(),
              SizedBox(
                height: 2.h,
              ),
              _buildGoogleSignUpButton(context),
              SizedBox(
                height: 2.h,
              ),
              _buildFackBookSignUpButton(context),
              SizedBox(
                height: 2.h,
              ),
              _buildSignUp()
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          labelText: "",
          hintText: "Email Id",
          labelStyle: TextStyle(color: Colors.black),
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
        validator: (value) => _emailValidation(value!),
        // decoration: CommonStyles.textFormFieldStyle("Email", ""),
      ),
    );
  }

  String? _emailValidation(String value) {
    bool emailValid =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    if (!emailValid) {
      return "Enter valid email address";
    } else {
      return null;
    }
  }

  String? _userNameValidation(String value) {
    if (value.isEmpty) {
      return "Please enter valid user name";
    } else {
      return null;
    }
  }

  Widget _buildPasswordField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_emailFocusNode);
        },
        validator: (value) => _userNameValidation(value!),
        obscureText: _isPasswordVisible,
        decoration: InputDecoration(
          labelText: "",
          hintText: "Password",
          labelStyle: const TextStyle(color: Colors.black),
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              }),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Align(
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () {},
            child: const Text(
              'Forgot password ?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  fontWeight: FontWeight.w500),
            )),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Container(
      height: 6.h,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green, // Background color
        ),
        child: const Text(
          "Log in",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
        onPressed: () {
          _signUpProcess(context);
        },
      ),
    );
  }

  Widget _buildSignUp() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't hava an Account?",
            style: TextStyle(
              fontSize: 16.dp,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 1.h,
          ),
          InkWell(
            onTap: () {
              HGNavigator.pushNamed(context, HGRoute.signUpRoute);
            },
            child: Text(
              "SIGN UP",
              style: TextStyle(
                fontSize: 16.dp,
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoogleSignUpButton(BuildContext context) {
    return Container(
      height: 6.h,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent, // Background color
        ),
        child: const Text(
          "Signup with Google",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
        onPressed: () {
          //  _signUpProcess(context);
        },
      ),
    );
  }

  Widget _buildFackBookSignUpButton(BuildContext context) {
    return Container(
      height: 6.h,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Background color
        ),
        child: const Text(
          "Facebook",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
        onPressed: () {
          // _signUpProcess(context);
        },
      ),
    );
  }

  Widget _dividerTextWidget() {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(
              left: 40.0,
            ),
            child: const Divider(
              color: Colors.white,
              height: 10,
              endIndent: 10,
              indent: 10,
            )),
      ),
      Container(
        width: 35.0,
        height: 35.0,
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
        child: const Center(
            child: Text(
          "OR",
          style: TextStyle(color: Colors.white),
        )),
      ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(right: 40.0),
            child: const Divider(
              color: Colors.white,
              height: 10,
              endIndent: 10,
              indent: 10,
            )),
      ),
    ]);
  }

  void _signUpProcess(BuildContext context) {
    var validate = _formKey.currentState!.validate();

    if (validate) {
      //Do login stuff
    } else {
      setState(() {
        autoValidateMode = true;
      });
    }
  }

  void _clearAllFields() {
    setState(() {
      emailController.clear();
      passwordController.clear();
    });
  }
}
