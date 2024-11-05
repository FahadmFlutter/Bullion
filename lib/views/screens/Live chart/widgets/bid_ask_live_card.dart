import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            style:  TextStyle(
              color: Color(0xFFD4AF37),
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 7.h),
            child: Container(
              width: 108.w,
              height: 55.78.w,
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
                        '$mText',
                        style:  TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 108.w,
                    height: 16.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFF231F20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(5.r),
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
                              width: 15.w,
                              height: 10.h,
                              decoration: ShapeDecoration(
                                color:
                                    isUp == false ? Colors.red : Colors.green,
                                shape: const StarBorder.polygon(sides: 3),
                              ),
                            ),
                          ),
                          Text(
                            '$sText',
                            style:  TextStyle(
                              color: Colors.white,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400,
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
