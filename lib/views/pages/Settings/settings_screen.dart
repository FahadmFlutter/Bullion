import 'package:bullion/views/pages/Settings/wish%20list/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<Map<String, String>> menuItems = [
  {
    'icon': 'assets/icons/heart.svg',
    'title': 'Wishlist',
    'subtitle': 'Show favorite items',
  },
  {
    'icon': 'assets/icons/notification.svg',
    'title': 'Notifications',
    'subtitle': 'Get latest notification',
  },
  {
    'icon': 'assets/icons/bank.svg',
    'title': 'Bank details',
    'subtitle': 'Banks & Autopay',
  },
  {
    'icon': 'assets/icons/news.svg',
    'title': 'News',
    'subtitle': 'Trending News',
  },
  {
    'icon': 'assets/icons/shop.svg',
    'title': 'Shop',
    'subtitle': 'Shop Gold and sliver',
  },
  {
    'icon': 'assets/icons/info.svg',
    'title': 'About Us',
    'subtitle': 'Know more about us',
  },
  {
    'icon': 'assets/icons/shield.svg',
    'title': 'Privacy Policy',
    'subtitle': 'Terms and conditions',
  },
];

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/User_img.svg',
                width: 55,
                height: 55,
              ),
              title: const Text(
                'Guest User',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
              child: Divider(
                color: Color(0xB2FBF4E4),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListView.separated(
                  physics: const ScrollPhysics(),
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    final item = menuItems[index];
                    return ListTile(
                    splashColor: Color(0xFF231F20),
                      leading: CircleAvatar(
                        radius: 27.5,
                        backgroundColor: const Color(0xFF131313),
                        child: SvgPicture.asset(
                          item['icon']!,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          Text(
                            item['subtitle']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        // Only navigate if the tapped index is 0 (first element)
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => WishListScreen(
                                title: item['title']!,
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
