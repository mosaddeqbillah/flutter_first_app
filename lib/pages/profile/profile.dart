import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _launchUrl(String address) async {
    final query = Uri.encodeComponent(address);
    final googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=$query";

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('lib/pages/profile/assets/profile.jpg'),
          ),
          const SizedBox(height: 20),
          const Text(
            "Md Mosaddeq Hosain",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () => _launchUrl("Fiber@Home Global"),
              child: Text('Fiber@Home Global'))
        ],
      ),
    );
  }
}
