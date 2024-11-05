import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommodityTable extends StatelessWidget {
  const CommodityTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double tPadding = (20 + 16) * 2;
    // double mWidth = screenWidth * 0.50 - tPadding; // 2 parts
    // double sWidth = screenWidth * 0.35 - tPadding;
    return Container(
      width: double.infinity,
      // height: 160,
      decoration: ShapeDecoration(
        color: const Color(0xFF131313),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 33.h,
            decoration: ShapeDecoration(
              color: const Color(0xFF231F20),
              shape: RoundedRectangleBorder(
                side:  BorderSide(width: 2.w, color: Color(0xFF131313)),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child:  Padding(
              padding: EdgeInsets.only(left: 16.0.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'COMMODITY',
                      style: TextStyle(
                        color: Color(0xFFD4AF37),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 89.w,
                    child: Center(
                      child: Text(
                        'WEIGHT',
                        style: TextStyle(
                          color: Color(0xFFD4AF37),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                    width: 100.w,
                    child: Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'PRICE ',
                              style: TextStyle(
                                color: Color(0xFFD4AF37),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: 'AED',
                              style: TextStyle(
                                color: Color(0xFFD4AF37),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.0.w,vertical: 8.h),
            child: Column(
              children: [
                /// ///// /// / // / // // / / /
                CommodityRow(
                  title: 'GOLD',
                  sTitle: '9999',
                  weight: '1 GM',
                  price: 280.02,
                ),
                CommodityRow(
                  title: 'GOLD',
                  sTitle: '9999',
                  weight: '1 KG',
                  price: 280.018,
                ),
                CommodityRow(
                  title: 'GOLD',
                  sTitle: '995',
                  weight: '1 KG',
                  price: 278.302,
                ),
                CommodityRow(
                  title: 'GOLD',
                  sTitle: '999',
                  weight: '1 TTB',
                  price: 32.629,
                ),
                CommodityRow(
                  title: 'GOLD',
                  sTitle: '9999',
                  weight: '1 KG',
                  price: 3.326,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommodityRow extends StatelessWidget {
  final String title;
  final String sTitle;
  final String weight;
  final double price;

  const CommodityRow({
    super.key,
    required this.title,
    required this.sTitle,
    required this.weight,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0.h),
      child: Row(
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$title ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: sTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 84.w,
            child: Text(
              weight,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          SizedBox(
            width: 75.w,
            child: Text(
              '$price',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
