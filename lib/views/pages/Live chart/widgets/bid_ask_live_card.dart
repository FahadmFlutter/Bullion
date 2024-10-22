import 'package:flutter/material.dart';

class BideAskLive extends StatelessWidget {
  final String title;
  final double mText;
  final double sText;
  final bool isUp;

  const BideAskLive({
    super.key,
    required this.title,
    required this.mText,
    required this.sText,
    required this.isUp,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFD4AF37),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 7),
            child: Container(
              width: 108,
              height: 55.78,
              decoration: ShapeDecoration(
                color: const Color(0xFF131313),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2, color: Color(0xFF231F20)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        '$mText',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 108,
                    height: 16,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF231F20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(5),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.rotate(
                            angle: isUp == false ? 45 : 0,
                            child: Container(
                              width: 15,
                              height: 10,
                              decoration: ShapeDecoration(
                                color:
                                    isUp == false ? Colors.red : Colors.green,
                                shape: const StarBorder.polygon(sides: 3),
                              ),
                            ),
                          ),
                          Text(
                            '$sText',
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
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
