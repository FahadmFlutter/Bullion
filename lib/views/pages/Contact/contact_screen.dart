import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

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
                        ),
                      ),
                      Text(
                        '24/7',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.1),
                          fontSize: 36,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
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

  // List of contacts with actions
  final List<Map<String, dynamic>> contacts = [
    {
      'icon': 'assets/icons/call.svg',
      'title': 'Call Us',
      'subtitle': 'Talk to our executives',
      'action': 'call',
    },
    {
      'icon': 'assets/icons/whatsapp.svg',
      'title': 'WhatsApp',
      'subtitle': 'Chat with us',
      'action': 'whatsapp',
    },
    {
      'icon': 'assets/icons/mail.svg',
      'title': 'Mail',
      'subtitle': 'Drop us a line',
      'action': 'email',
    },
    {
      'icon': 'assets/icons/location.svg',
      'title': 'Address',
      'subtitle': 'Reach us at',
      'action': 'location',
    },
  ];

  // Launch action method
  void launchAction(String action) async {
    Uri uri;

    switch (action) {
      case 'email':
        uri = Uri(
          scheme: 'mailto',
          path: 'example@gmail.com',
          query: 'subject=${Uri.encodeComponent('Hello Flutter')}&body=${Uri.encodeComponent('Hi! I\'m a Flutter Developer')}',
        );

        break;
      case 'whatsapp':

        uri = Uri.parse(
          'https://wa.me/+917994770085?text=${Uri.encodeQueryComponent('Hello, this is a test message from Flutter!')}',
        );
        break;
      case 'call':
        uri = Uri(
          scheme: 'tel',
          path: '+917994770085',
        );
        break;
      case 'location':
        uri = Uri.parse('https://www.google.com/maps/search/?api=1&query=10.995367,75.982189');
        break;
      default:
        print('Invalid action');
        return;
    }

    print('Attempting to launch: $uri'); // Debug print

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (kDebugMode) {
        print('Could not launch $uri');
      }
    }

  }

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
        final contact = contacts[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              // Ensure the action is valid before calling launchAction
              final action = contact['action'];
              if (action != null) {
                launchAction(action);
              } else {
                if (kDebugMode) {
                  print('Invalid action for contact: ${contact['title']}');
                }
              }
            },
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
                    contact['icon'] ?? '', // Provide a fallback if icon is null
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact['title'] ?? 'Unknown', // Fallback for title
                        style: const TextStyle(
                          color: Color(0xB2FBF4E4),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        contact['subtitle'] ?? '', // Fallback for subtitle
                        style: const TextStyle(
                          color: Color(0x7FFBF4E4),
                          fontSize: 10,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
