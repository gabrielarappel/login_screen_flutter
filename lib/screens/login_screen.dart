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

class _LoginPageState extends State<LoginPage> with ValidationsMixin{
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final ResponsiveUtils responsiveUtils = ResponsiveUtils();
  bool _showErrors = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      if (email.isNotEmpty && password.isNotEmpty) {
        showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Login successfully"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please, fill out all required fields"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

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
                    borderRadius:
                        const BorderRadius.only(bottomLeft: Radius.circular(120))),
                width: responsiveUtils.getWidthSpacing(context, 410),
                height: responsiveUtils.getHeightSpacing(context, 320),
                child: 
                Stack(
                  children: [
                    Center(
                      child: Image.asset("lib/assets/logo_dois.png", 
                      width: responsiveUtils.getWidthSpacing(context, 150), 
                      height: responsiveUtils.getHeightSpacing(context, 150),
                      )
                      ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: responsiveUtils.getHeightSpacing(context, 250), 
                        left: responsiveUtils.getHeightSpacing(context, 300), 
                        bottom: responsiveUtils.getHeightSpacing(context, 20) 
                        ),
                      child: Text(
                        "Login", style: TextStyle(fontSize: 24 * responsiveUtils.getTextScale(context), color: ColorTheme.white),
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
                        validator: validateEmail,
                        controller: _emailController,
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorTheme.grey,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 25, right: 10),
                              child: Icon(
                                Icons.email, 
                                color: Colors.grey, 
                                size: 30 * responsiveUtils.getImageScale(context),
                                ),
                              ),
                              errorStyle: TextStyle(
                                fontSize: 16 * responsiveUtils.getTextScale(context),
                              ),
                              hintText: " Email Address",
                              hintStyle: const TextStyle(
                                color: Colors.grey, 
                                fontWeight: FontWeight.w400
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.grey, 
                                fontSize: 20 * responsiveUtils.getTextScale(context), 
                                fontWeight: FontWeight.w400
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => FocusScope.of(context).nextFocus(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: responsiveUtils.getHeightSpacing(context, 20)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        validator: isEmpty,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorTheme.grey,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 25, right: 10),
                            child: Icon(
                              Icons.vpn_key, 
                              color: Colors.grey, 
                              size: 30 * responsiveUtils.getImageScale(context),
                              ),
                            ),
                            errorStyle: TextStyle(
                              fontSize: 16 * responsiveUtils.getTextScale(context)
                            ),
                            hintText: " Password",
                            hintStyle: const TextStyle(
                              color: Colors.grey, 
                              fontWeight: FontWeight.w400
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              suffixIcon: IconButton(
                              icon: _isPasswordVisible ? const Icon(Icons.visibility, color: Colors.grey,) : const Icon(Icons.visibility_off, color: Colors.grey,),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                        obscureText: !_isPasswordVisible,
                        style: TextStyle(color: Colors.grey, fontSize: 20 * responsiveUtils.getTextScale(context), fontWeight: FontWeight.w500),
                      ),
                    ),
              SizedBox(height: responsiveUtils.getHeightSpacing(context, 10),),
              Padding(
                padding: EdgeInsets.only(right: responsiveUtils.getWidthSpacing(context, 30)),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      debugPrint("Forgot password clicked");
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.white, fontSize: 16 * responsiveUtils.getTextScale(context)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: responsiveUtils.getHeightSpacing(context, 120),),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showErrors = true;
                  });
                  if (_formKey.currentState!.validate()) {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final bool isEmailValid = validateEmail(email) == null;
                    
                    if (email.isNotEmpty && password.isNotEmpty && isEmailValid) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Login Successful"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please, fill out all required fields"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveUtils.getWidthSpacing(context, 150), 
                    vertical: responsiveUtils.getHeightSpacing(context, 15)
                    ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white, fontSize: 18 * responsiveUtils.getTextScale(context)),
                ),
              ),
              SizedBox(height: responsiveUtils.getHeightSpacing(context, 30),),
              RichText(
                text: TextSpan(
                  text: "Don't have an Account?",
                  style: TextStyle(color: Colors.white, fontSize: 16 * responsiveUtils.getTextScale(context)),
                  children: <TextSpan>[
                    TextSpan(
                      text: " Register",
                      style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 16 * responsiveUtils.getTextScale(context)),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        debugPrint("Register clicked");
                      }
                    )
                  ]
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}