import 'package:flutter/material.dart';
import 'package:savior/app_colors.dart';
import 'package:savior/app_typography.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
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
            Emergencys(
              icon: Icons.local_hospital,
              text: "Nearest Hospital",
              onPressed: () {
                launch('tel://''0000000');
              },
            ),
            SizedBox(height: 10,),
            Emergencys(
              icon: Icons.local_police,
              text: "Nearest Police Station",
              onPressed: () {
                launch('tel://''0000000');
              },
            ),
            SizedBox(height: 10,),
            Emergencys(
              icon: Icons.car_crash_sharp,
              text: "Nearest Ambulance",
              onPressed: () {
                launch('tel://''0000000');
              },
            ),
            SizedBox(height: 10,),
            Emergencys(
              icon: Icons.emergency,
              text: "Call 999",
              onPressed: () {
                launch('tel://''999');
              },
            ),




          ],
        ),
      ),
    );
  }

}

class Emergencys extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const Emergencys({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: AppColors.color1,
          size: 32,
        ),
        label: Text(
          text,
          style: AppTypography.heading2,
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}



