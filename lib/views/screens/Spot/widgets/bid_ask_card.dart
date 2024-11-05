import 'package:bullion/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      width: 89.w,
      height: 55.78.h,
      decoration: ShapeDecoration(
        color: const Color(0xFF131313),
        shape: RoundedRectangleBorder(
          side:  BorderSide(width: 2.w, color: Color(0xFF231F20)),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Text(
                widget.largText,
                style:  TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
            width: 89.w,
            height: 16.h,
            decoration:  ShapeDecoration(
              color: Color(0xFF231F20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(5.r),
                ),
              ),
            ),
            child: Center(
              child: Text(
                widget.smallText,
                style:  TextStyle(
                  color: Colors.white,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w400,
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
      width: 89.w,
      height: 37.h,
      decoration: ShapeDecoration(
        color: const Color(0xFF131313),
        shape: RoundedRectangleBorder(
          side:  BorderSide(width: 2.w, color: Color(0xFF231F20)),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Text(
                widget.largText,
                style:  TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
            width: 89.w,
            height: 10.h,
            decoration:  ShapeDecoration(
              color: Color(0xFF231F20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(5.r),
                ),
              ),
            ),
            child: Center(
              child: Text(
                widget.smallText,
                style:  TextStyle(
                  color: Colors.white,
                  fontSize: 6.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
