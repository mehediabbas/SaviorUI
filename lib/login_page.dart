import 'package:flutter/material.dart';
import 'package:savior/app_colors.dart';
import 'package:savior/app_typography.dart';
import 'package:savior/main.dart';
import 'package:savior/signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isDesktop = width >= 900;

    Widget textSection = Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Image(image: AssetImage('assets/logo.png',), width: 100,),
          Text('Welcome To Savior', style: AppTypography.heading1,),
          Text('Stay safe, stay connected', style: AppTypography.heading2,)
        ],
      )
    );

    Widget loginForm = Container(
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        children: [
          _buildTextField("Phone", Icons.phone),
          const SizedBox(height: 10),
          _buildTextField("Password", Icons.lock, isPassword:true),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.color1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text("Login", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignupPage(),
                ),
              ),
              child: Text('Sign Up', style: AppTypography.smalltext,)),
              TextButton(onPressed: () {}, child: Text('Forgot password?', style: AppTypography.smalltext,)),
            ],
          )
        ],
      ),
    );

    return Scaffold(
      body: Center(
        child: isDesktop
            ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: textSection),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: loginForm,
            ),
          ],
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            textSection,
            loginForm,
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, {int maxLines = 1, bool isPassword = false} ) {
    return TextField(
      maxLines: maxLines,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
