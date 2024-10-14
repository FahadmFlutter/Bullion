import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Customer Support',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      Text(
                        '24/7',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.10000000149011612),
                          fontSize: 36,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(flex: 3, child: ContactGrid()),
              const Expanded(flex: 1, child: SizedBox())
            ],
          ),
        ),
      ),
    );
  }
}

class ContactGrid extends StatelessWidget {
   ContactGrid({super.key});
  final List<Map<String, dynamic>> contacts = [
    {
      'icon': 'assets/icons/call.svg',
      'title': 'Call Us',
      'subtitle': 'Talk to our executives'
    },
    {
      'icon': 'assets/icons/whatsapp.svg',
      'title': 'Whatsapp',
      'subtitle': 'Chat with us',
    },
    {
      'icon': 'assets/icons/mail.svg',
      'title': 'Mail',
      'subtitle': 'Drop us a line',
    },
    {
      'icon': 'assets/icons/location.svg',
      'title': 'Address',
      'subtitle': 'Reach us at',
    },
  ];



  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        childAspectRatio: 1 / 1, // Aspect ratio of each item
      ),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: const Color(0xFF131313),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  contacts[index]['icon'],
                  height: 55,
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contacts[index]['title'],
                      style: const TextStyle(
                        color: Color(0xB2FBF4E4),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    Text(
                      contacts[index]['subtitle'],
                      style: const TextStyle(
                        color: Color(0x7FFBF4E4),
                        fontSize: 10,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
