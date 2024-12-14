import 'package:aya_second_hw/utils/aya_colors.dart';
import 'package:flutter/material.dart';
import 'aya_colors.dart';

class WelcomeScreen extends StatelessWidget {
  final String username, password, email;

  const WelcomeScreen({
    Key? key,
    required this.username,
    required this.password,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // صورة رمزية
                CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.primaryColor,
                  child: const Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // رسالة الترحيب
                Text(
                  'مرحبا، $username 👋',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),

                // بطاقة البريد الإلكتروني
                _buildInfoCard(
                  icon: Icons.email,
                  title: 'البريد الإلكتروني',
                  data: email,
                ),

                const SizedBox(height: 10),

                // بطاقة كلمة المرور
                _buildInfoCard(
                  icon: Icons.lock,
                  title: 'كلمة المرور',
                  data: password,
                ),

                const SizedBox(height: 20),

                // زر العودة
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'رجوع',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // دالة لإنشاء بطاقة المعلومات
  Widget _buildInfoCard({required IconData icon, required String title, required String data}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryColor, size: 30),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          data,
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ),
    );
  }
}
