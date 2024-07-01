import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_teste/constants/color_theme.dart';
import 'package:login_screen_teste/constants/responsive_utils.dart';
import 'package:login_screen_teste/mixins/validations_mixin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidationsMixin {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final ResponsiveUtils responsiveUtils = ResponsiveUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.background,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: ColorTheme.linearGradient,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(120))),
                width: responsiveUtils.getWidthSpacing(context, 410),
                height: responsiveUtils.getHeightSpacing(context, 320),
                child: Stack(
                  children: [
                    Center(
                        child: Image.asset(
                      "lib/assets/logo_dois.png",
                      width: responsiveUtils.getWidthSpacing(context, 150),
                      height: responsiveUtils.getHeightSpacing(context, 150),
                    )),
                    Padding(
                      padding: EdgeInsets.only(
                          top: responsiveUtils.getHeightSpacing(context, 250),
                          left: responsiveUtils.getHeightSpacing(context, 300),
                          bottom:
                              responsiveUtils.getHeightSpacing(context, 20)),
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: responsiveUtils.getHeightSpacing(context, 90)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorTheme.greyField,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 25, right: 10),
                            child: Icon(
                              Icons.email,
                              color: ColorTheme.grey,
                              size: 30 * responsiveUtils.getImageScale(context),
                            ),
                          ),
                          errorStyle: TextStyle(
                            fontSize:
                                16 * responsiveUtils.getTextScale(context),
                          ),
                          labelText: " Email Address",
                          labelStyle: const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w400),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                        validator: validateEmail,
                      ),
                      SizedBox(
                          height:
                              responsiveUtils.getHeightSpacing(context, 20)),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorTheme.greyField,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 25, right: 10),
                            child: Icon(
                              Icons.vpn_key,
                              color: ColorTheme.grey,
                              size: 30 * responsiveUtils.getImageScale(context),
                            ),
                          ),
                          labelText: "Password",
                          labelStyle: const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w400),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                          suffixIcon: IconButton(
                            icon: _isPasswordVisible
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        validator: moreThanSeven,
                        obscureText: !_isPasswordVisible,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: responsiveUtils.getHeightSpacing(context, 10),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: responsiveUtils.getWidthSpacing(context, 30)),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      debugPrint("Forgot password clicked");
                    },
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: responsiveUtils.getHeightSpacing(context, 80),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Login Successful"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorTheme.orange,
                  padding: EdgeInsets.symmetric(
                      horizontal: responsiveUtils.getWidthSpacing(context, 150),
                      vertical: responsiveUtils.getHeightSpacing(context, 15)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "LOGIN",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SizedBox(
                height: responsiveUtils.getHeightSpacing(context, 15),
              ),
              RichText(
                  text: TextSpan(
                      text: "Don't have an Account?",
                      style: Theme.of(context).textTheme.displaySmall,
                      children: <TextSpan>[
                    TextSpan(
                        text: " Register",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: ColorTheme.deepOrangeAccent),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            debugPrint("Register clicked");
                          })
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
