import 'package:flutter/material.dart';
import '../aya_WelcomeScreen.dart';
import 'aya_colors.dart';
import 'aya_constants.dart';
import 'aya_custom_text_field.dart';
import 'aya_validators.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // صورة الشعار
                  Image.asset(
                    'assets/aa.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 20),

                  // عنوان الصفحة
                  Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // حقل اسم المستخدم
                  CustomTextField(
                    hintText: AppStrings.usernameHint,
                    controller: usernameController,
                    keyboardType: TextInputType.text,
                    validator: Validators.validateUsername,
                  ),
                  const SizedBox(height: 15),

                  // حقل البريد الإلكتروني
                  CustomTextField(
                    hintText: AppStrings.emailHint,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail,
                  ),
                  const SizedBox(height: 15),

                  // حقل كلمة المرور
                  CustomTextField(
                    hintText: AppStrings.passwordHint,
                    controller: passwordController,
                    keyboardType: TextInputType.number,
                    isPassword: true,
                    validator: Validators.validatePassword,
                  ),
                  const SizedBox(height: 20),

                  // زر تسجيل الدخول
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // الانتقال إلى صفحة الترحيب
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WelcomeScreen(
                              username: usernameController.text,
                              password: passwordController.text,
                              email: emailController.text,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      AppStrings.loginButton,
                      style: TextStyle(color: AppColors.secondaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
