import 'package:flutter/material.dart';

class BidAskCardGold extends StatefulWidget {
  final String largText;
  final String smallText;

  const BidAskCardGold(
      {super.key,
      required this.largText,
      required this.smallText,
 });

  @override
  State<BidAskCardGold> createState() => _BidAskCardGoldState();
}

class _BidAskCardGoldState extends State<BidAskCardGold> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 89,
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
                widget.largText,
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
            width: 89,
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
              child: Text(
                widget.smallText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BidAskCardSilver extends StatefulWidget {
  final String largText;
  final String smallText;

  const BidAskCardSilver(
      {super.key, required this.largText, required this.smallText});

  @override
  State<BidAskCardSilver> createState() => _BidAskCardSilverState();
}

class _BidAskCardSilverState extends State<BidAskCardSilver> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 89,
      height: 37,
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
                widget.largText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          Container(
            width: 89,
            height: 10,
            decoration: const ShapeDecoration(
              color: Color(0xFF231F20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(5),
                ),
              ),
            ),
            child: Center(
              child: Text(
                widget.smallText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 6,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
