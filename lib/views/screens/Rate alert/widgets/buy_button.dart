import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyButton extends StatelessWidget {
  final bool isAdd;
  final double amount;

  const BuyButton({
    super.key,
    required this.isAdd,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:  ButtonStyle(
        padding: WidgetStatePropertyAll( EdgeInsets.symmetric(horizontal: 30.w, vertical: 9.h),),
        backgroundColor: const WidgetStatePropertyAll(Color(0xFF131313)),
        elevation: const WidgetStatePropertyAll(3),
        side: WidgetStatePropertyAll(BorderSide(color: Colors.white.withOpacity(0.5),width: 1.w)),
        surfaceTintColor: WidgetStateColor.transparent,
        foregroundColor: WidgetStateColor.transparent,
        overlayColor: WidgetStateColor.transparent,

      ),
      onPressed: () {},
      child: Text(
        '${isAdd ? '+' : ''} ${amount < 0 ? '-\$${amount.abs().toStringAsFixed(0)}' : '\$${amount.toStringAsFixed(0)}'}',
        style:  TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );

    // Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //   // add padding as needed
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 9),
    //     decoration: ShapeDecoration(
    //       color: const Color(0xFF131313),
    //       shape: RoundedRectangleBorder(
    //         side: BorderSide(
    //           width: 1,
    //           color: Colors.white.withOpacity(0.5),
    //         ),
    //         borderRadius: BorderRadius.circular(20),
    //       ),
    //       shadows: const [
    //         BoxShadow(
    //           color: Color(0x3F000000),
    //           blurRadius: 4,
    //           offset: Offset(0, 4),
    //           spreadRadius: 0,
    //         ),
    //       ],
    //     ),
    //     child: Center(
    //       child: Text(
    //         '${isAdd ? '+' : ''} \$$amount',
    //         style: const TextStyle(
    //           color: Colors.white,
    //           fontSize: 20,
    //           fontFamily: 'Inter',
    //           fontWeight: FontWeight.w700,
    //           height: 0,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
