import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghaith_test/core/constants/app_colors.dart';
import 'package:ghaith_test/core/constants/text_manager.dart';
import 'package:ghaith_test/core/constants/text_styles.dart';
import 'package:ghaith_test/presentation/screens/home_screen.dart';
import 'package:ghaith_test/presentation/widgets/button_custom_widget.dart';
import 'package:ghaith_test/providers/password_visibility_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/text_form_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(TextManager.successLogin)));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(TextManager.failedLogin),
        backgroundColor: ColorsManager.redAccent,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final visibilityProvider = Provider.of<PasswordVisibilityProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80.h,
              ),
              Text(TextManager.welcomeBack, style: TextStyles.heading1),
              SizedBox(
                height: 40.h,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldWidget(
                      hintText: TextManager.emailHint,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return TextManager.errorEmptyEmail;
                        }
                        final emailRegex =
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (!emailRegex.hasMatch(value)) {
                          return TextManager.errorInvalidEmail;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    TextFieldWidget(
                      hintText: TextManager.passwordHint,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return TextManager.errorEmptyPassword;
                        }
                        if (value.length < 8) {
                          return TextManager.errorShortPassword;
                        }
                        return null;
                      },
                      obscureText: visibilityProvider.isObscureText,
                      suffixIcon: IconButton(
                        iconSize: 22,
                        onPressed: () => visibilityProvider.toggleVisibility(),
                        icon: visibilityProvider.isObscureText
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined),
                        color: ColorsManager.greycolor,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        TextManager.forgetPassword,
                        style: TextStyles.font15semiboldprimary,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    ButtonWidget(
                        height: 56.h,
                        title: TextManager.loginButton,
                        onTap: () => _onLoginPressed())
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
