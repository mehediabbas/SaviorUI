import 'package:flutter/material.dart';
import 'package:savior/app_colors.dart';
import 'package:savior/app_typography.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20,),
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage('assets/logo.png',)),
                        SizedBox(width: 20,),
                        Text("Savior", style: AppTypography.heading1,)
                      ],
                    ),
                    Image(image: AssetImage('assets/profile.png'))
                  ],
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Welcome, Mehedi', style: AppTypography.heading3,),
                    Text('Stay safe with savior', style: AppTypography.smalltext,)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      NewsCard(title: "News 1", shortText: "First news short text"),
                      NewsCard(title: "News 2", shortText: "Second news short text"),
                      NewsCard(title: "News 3", shortText: "Third news short text"),
                      NewsCard(title: "News 4", shortText: "Fourth news short text"),
                      NewsCard(title: "News 5", shortText: "Fifth news short text"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.call, color: Colors.red),
                      label: Text(
                        "Call 999",
                        style: AppTypography.heading3wh,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.location_on, color: Colors.red),
                      label: Text(
                        "Share Location",
                        style: AppTypography.heading3wh,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Emergency Contract:', style: AppTypography.heading3,),
                    SizedBox(height: 10,),
                    ContactCard(
                      imagePath: 'assets/profile.png',
                      name: 'John',
                    ),
                    SizedBox(height: 10,),
                    ContactCard(
                      imagePath: 'assets/profile.png',
                      name: 'Mr. Hasan',
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.add_circle, color: AppColors.color1,),
                        SizedBox(width: 20,),
                        Text('Add More Contacts', style: TextStyle(color: AppColors.color1,),)
                      ],
                    )



                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

}

class NewsCard extends StatelessWidget {
  final String title;
  final String shortText;

  const NewsCard({super.key, required this.title, required this.shortText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 8),
          Text(shortText, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String imagePath;
  final String name;

  const ContactCard({
    super.key,
    required this.imagePath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Row(
        children: [
          // Rounded Image
          ClipRRect(
            borderRadius: BorderRadius.circular(30), // circular radius for 60x60 image
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 16),

          // Name text expanded
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),

          // Call icon button
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.call,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}