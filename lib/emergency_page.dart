import 'package:flutter/material.dart';
import 'package:savior/app_typography.dart';

class EmergencyPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20,),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('assets/logo.png',)),
                  SizedBox(width: 30,),
                  Text("Savior", style: AppTypography.heading0,)
                ],
              ),
            ),
            SizedBox(height: 20,),
            CustomImageTextButton(
              imagePath: 'assets/hospital.png',
              text: "Call Now",
              onPressed: () {
                print("Button pressed");
              },
            ),


          ],
        ),
      ),
    );
  }

}


class CustomIconTextButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const CustomIconTextButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.grey[700]),
        label: Text(
          text,
          style: AppTypography.heading2,
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
      ),
    );
  }
}

