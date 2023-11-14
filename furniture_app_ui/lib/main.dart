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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
        padding: const EdgeInsets.only(top: 20, bottom: 20), // 전체 컨테이너에 패딩 적용
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 40), // 상단 여백
            const Text(
              'Center',
              style: TextStyle(
                color: Colors.black,
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20), // 섹션 사이의 여백
            _buildStatisticCard(),
            const SizedBox(height: 20), // 섹션 사이의 여백
            _buildFeatureList(),
            const SizedBox(height: 20), // 섹션 사이의 여백
            _buildSettingsList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // 둥근 모서리 설정
      ),
      color: Colors.blue, // 카드의 배경색을 파란색으로 설정
      margin: const EdgeInsets.all(15.0), // 카드에 마진을 추가
      child: Padding(
        padding: const EdgeInsets.all(16.0), // 내부 패딩을 추가
        child: Column(
          children: <Widget>[
            _buildUserRow(), // 사용자 이미지와 이름을 표시하는 새로운 함수
            const SizedBox(height: 15.0), // 두 섹션 사이에 공간 추가
            _buildStatisticRow(), // 기존의 통계를 표시하는 Row
          ],
        ),
      ),
    );
  }

  Widget _buildUserRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 25.0), // 이미지와 텍스트 사이에 공간 추가
        CircleAvatar(
          backgroundImage: AssetImage('lib/tt.jpg'), // 사용자의 이미지 경로
          radius: 30.0, // 이미지의 반지름 크기 설정
        ),
        SizedBox(width: 15.0), // 이미지와 텍스트 사이에 공간 추가
        Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽으로 정렬
          children: <Widget>[
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

  Widget _buildStatisticRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 아이템들을 고르게 배치
      children: <Widget>[
        _buildStatisticItem('846', 'Collect'),
        _buildStatisticItem('51', 'Attention'),
        _buildStatisticItem('267', 'Track'),
        _buildStatisticItem('39', 'Coupons'),
      ],
    );
  }

  Widget _buildStatisticItem(String value, String label) {
    // 통계 아이템 위젯 구현
    return Column(
      mainAxisSize: MainAxisSize.min, // 컨텐츠 크기에 맞게
      children: <Widget>[
        Text(
          value,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ), // 숫자 색상을 흰색으로 설정
        Text(label,
            style: const TextStyle(color: Colors.white)), // 라벨 색상을 흰색으로 설정
      ],
    );
  }

  Widget _buildFeatureList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0), // 좌우 패딩을 줄입니다.
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildFeatureItem(Icons.account_balance_wallet, 'Wallet'),
          _buildFeatureItem(Icons.local_shipping, 'Delivery'),
          _buildFeatureItemWithBadge(Icons.message, 'Message', '2'),
          _buildFeatureItem(Icons.build, 'Service'),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          onPressed: () {
            // 아이콘 버튼 클릭 시 수행할 동작
          },
        ),
        Text(label),
      ],
    );
  }

  Widget _buildFeatureItemWithBadge(
      IconData icon, String label, String badgeContent) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            IconButton(
              icon: Icon(icon),
              onPressed: () {
                // 아이콘 버튼 클릭 시 수행할 동작
              },
            ),
            if (badgeContent.isNotEmpty) // 배지 내용이 있는 경우에만 배지 표시
              CircleAvatar(
                radius: 10.0,
                backgroundColor: Colors.blue,
                child: Text(
                  badgeContent,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ),
          ],
        ),
        Text(label),
      ],
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(8.0), // 리스트뷰 패딩 추가
        children: [
          _buildSettingsCard(Icons.location_on, 'Address',
              'Ensure your harvesting address', Colors.purple, context),
          _buildSettingsCard(Icons.lock, 'Privacy', 'System permission change',
              Colors.pink, context),
          _buildSettingsCard(Icons.settings, 'General',
              'Basic functional settings', Colors.orange, context),
          _buildSettingsCard(Icons.notifications, 'Notification',
              'Take over the news in time', Colors.blue, context),
        ],
      ),
    );
  }

  Widget _buildSettingsCard(IconData icon, String title, String subtitle,
      Color iconBgColor, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12.0), // 카드별 상하 마진 추가
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // 카드의 모서리를 둥글게 설정
      ),
      elevation: 4.0, // 카드의 그림자 효과
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconBgColor, // 아이콘 배경 색상을 파라미터로 받음
          child: Icon(icon, color: Colors.white), // 아이콘 색상
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // 각 설정을 여는 코드
        },
      ),
    );
  }
}
