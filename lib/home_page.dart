import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:savior/app_colors.dart';
import 'package:savior/app_typography.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

// 🔹 ReliefWeb Report model
class ReliefWebReport {
  final String id;
  final String title;
  final String href;

  ReliefWebReport({
    required this.id,
    required this.title,
    required this.href,
  });

  factory ReliefWebReport.fromJson(Map<String, dynamic> json) {
    return ReliefWebReport(
      id: json['id'],
      title: json['fields']['title'] ?? '',
      href: json['href'] ?? '',
    );
  }
}

// 🔹 Fetch reports function
Future<List<ReliefWebReport>> fetchReports() async {
  final response = await http.get(Uri.parse(
      'https://api.reliefweb.int/v2/reports?appname=MehediSaviorApp--5591287346&filter[field]=country&filter[value]=Bangladesh&sort[]=date.created:desc&limit=10'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body)['data'] as List;
    return data.map((json) => ReliefWebReport.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load reports');
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage('assets/logo.png')),
                        SizedBox(width: 20),
                        Text("Savior", style: AppTypography.heading1)
                      ],
                    ),
                    Image(image: AssetImage('assets/profile.png'))
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome, Mehedi', style: AppTypography.heading3),
                    Text('Stay safe with savior', style: AppTypography.smalltext)
                  ],
                ),
              ),
              SizedBox(height: 20),

              // 🔹 Dynamic News Cards
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 150, // 🔹 Fixed height for uniform cards
                child: FutureBuilder<List<ReliefWebReport>>(
                  future: fetchReports(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No news available'));
                    } else {
                      final reports = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: reports.length,
                        itemBuilder: (context, index) {
                          final report = reports[index];
                          return GestureDetector(
                            onTap: () async {
                              final url = report.href;
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url));
                              }
                            },
                            child: NewsCard(
                              title: report.title,
                              shortText: 'Click to read full report',
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 20),

              // Call and Share Location Buttons
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        launch('tel://''999');
                      },
                      icon: Icon(Icons.call, color: Colors.red),
                      label: Text("Call 999", style: AppTypography.heading3wh),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.location_on, color: Colors.red),
                      label: Text("Share Location", style: AppTypography.heading3wh),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Emergency Contacts
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Emergency Contact:', style: AppTypography.heading3),
                    SizedBox(height: 10),
                    ContactCard(imagePath: 'assets/profile.png', name: 'John'),
                    SizedBox(height: 10),
                    ContactCard(imagePath: 'assets/profile.png', name: 'Mr. Hasan'),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.add_circle, color: AppColors.color1),
                        SizedBox(width: 20),
                        Text('Add More Contacts', style: TextStyle(color: AppColors.color1))
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
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8),
          Text(
            shortText,
            style: TextStyle(color: Colors.grey),
            maxLines: 3, //
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String imagePath;
  final String name;

  const ContactCard({super.key, required this.imagePath, required this.name});

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
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
              child:  IconButton(onPressed: (){
                launch('tel://''0000000');
              }, icon: Icon(Icons.call, color: Colors.white, size: 24),),
            ),
          ),
        ],
      ),
    );
  }
}