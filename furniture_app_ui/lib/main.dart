import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furniture App UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: Colors.white,
        ),
      ),
      home: const FurnitureApp(),
    );
  }
}

class FurnitureApp extends StatelessWidget {
  const FurnitureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Center',
              style: TextStyle(
                color: Colors.black,
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            statisticCard(),
            const SizedBox(height: 20),
            featureList(),
            const SizedBox(height: 20),
            settingsList(context),
          ],
        ),
      ),
    );
  }

  Widget statisticCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 10, 2, 162).withOpacity(0.9),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      margin: const EdgeInsets.all(15.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            userRow(),
            const SizedBox(height: 20.0),
            statisticRow(),
          ],
        ),
      ),
    );
  }

  Widget userRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20.0),
        CircleAvatar(
          backgroundImage: AssetImage('lib/tt.jpg'),
          radius: 30.0,
        ),
        SizedBox(width: 15.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mausam Rayamajhi',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'A trendsetter',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget statisticRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        statisticItem('846', 'Collect'),
        statisticItem('51', 'Attention'),
        statisticItem('267', 'Track'),
        statisticItem('39', 'Coupons'),
      ],
    );
  }

  Widget statisticItem(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget featureList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          featureItem(Icons.account_balance_wallet, 'Wallet'),
          featureItem(Icons.local_shipping, 'Delivery'),
          featureItem(Icons.message, 'Message'),
          featureItem(Icons.build, 'Service'),
        ],
      ),
    );
  }

  Widget featureItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 192, 192, 192),
          ),
          child: IconButton(
            icon: Icon(icon),
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 7.0),
        Text(label),
      ],
    );
  }

  // Widget featureItemWithBadge(
  //     IconData icon, String label, String badgeContent) {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       Stack(
  //         alignment: Alignment.topRight,
  //         children: [
  //           IconButton(
  //             icon: Icon(icon),
  //             onPressed: () {},
  //           ),
  //           if (badgeContent.isNotEmpty)
  //             CircleAvatar(
  //               radius: 10.0,
  //               backgroundColor: Colors.blue,
  //               child: Text(
  //                 badgeContent,
  //                 style: const TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 12.0,
  //                 ),
  //               ),
  //             ),
  //         ],
  //       ),
  //       Text(label),
  //     ],
  //   );
  // }

  Widget settingsList(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          settingsCard(Icons.location_on, 'Address',
              'Ensure your harvesting address', Colors.purple, context),
          settingsCard(Icons.lock, 'Privacy', 'System permission change',
              Colors.pink, context),
          settingsCard(Icons.settings, 'General', 'Basic functional settings',
              Colors.orange, context),
          settingsCard(Icons.notifications, 'Notification',
              'Take over the news in time', Colors.blue, context),
        ],
      ),
    );
  }

  Widget settingsCard(IconData icon, String title, String subtitle,
      Color iconBgColor, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 3, 47, 244).withOpacity(0.2),
            spreadRadius: 8,
            blurRadius: 10.0,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconBgColor,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
