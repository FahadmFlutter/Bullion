import 'package:bullion/views/screens/Spot/widgets/commodity_table.dart';
import 'package:bullion/views/screens/Spot/widgets/spot_rate_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:marquee/marquee.dart';

class SpotScreen extends StatelessWidget {
  const SpotScreen({super.key});

  Widget _buildComplexMarquee() {
    return Marquee(
      text: 'BREAKING NEWS !!!  BREAKING NEWS !!!',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
      ),
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.center,
      blankSpace: 20.0,
      velocity: 60.0,
      pauseAfterRound: Duration(seconds: 1),
      showFadingOnlyWhenScrolling: true,
      fadingEdgeStartFraction: 0.1,
      fadingEdgeEndFraction: 0.1,
      numberOfRounds: 3,
      startPadding: 10.0,
      accelerationDuration: Duration(seconds: 1),
      accelerationCurve: Curves.linear,
      decelerationDuration: Duration(milliseconds: 600),
      decelerationCurve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.h),
            child: Column(
              children: [
                ///  Logo  &  date and time
                Stack(
                  alignment: Alignment.center,
                  children: [
                    /// date & time
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Date
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// date
                            Text(
                              DateFormat('d MMMM')
                                  .format(DateTime.now())
                                  .toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),

                            /// year
                            Text(
                              DateFormat('yyyy').format(DateTime.now()),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),

                            /// Day
                            Text(
                              DateFormat('EEEE')
                                  .format(DateTime.now())
                                  .toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),

                        /// time
                        StreamBuilder(
                          stream: Stream.periodic(const Duration(seconds: 1)),
                          builder: (context, snapshot) {
                            return Text(
                              '${DateFormat('hh:mm').format(DateTime.now())}\n${DateFormat('a').format(DateTime.now())}',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    /// Logo here
                    Container(
                      width: 113.w,
                      height: 113.w,
                      decoration: const ShapeDecoration(
                        color: Color(0x7FD9D9D9),
                        shape: OvalBorder(),
                      ),
                      child: Center(
                        child: Text(
                          'LOGO',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w900,
                            height: 0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: 50.h,
                ),

                /// Spot rate table
                const SpotRateTable(),

                SizedBox(
                  height: 16.h,
                ),


            /// Commodity Table,
                const CommodityTable(),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0.h),
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: 30.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFF131313),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child:_buildComplexMarquee(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Container(
//   width: double.infinity,
//   height: 160,
//   decoration: ShapeDecoration(
//     color: Color(0xFF131313),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10),
//     ),
//   ),
//   child: DataTable(
//
//     decoration: const BoxDecoration(),
//     columns: const [
//       DataColumn(label:  Text(
//         'SPOT RATE ',
//         style: TextStyle(
//           color: Color(0xFFD4AF37),
//           fontSize: 12,
//           fontFamily: 'Inter',
//           fontWeight: FontWeight.w700,
//           height: 0,
//         ),
//       ),),
//       DataColumn(label:  Text(
//         'BID',
//         style: TextStyle(
//           color: Color(0xFFD4AF37),
//           fontSize: 12,
//           fontFamily: 'Inter',
//           fontWeight: FontWeight.w700,
//           height: 0,
//         ),
//       ),),
//       DataColumn(label:  Text(
//         'ASK',
//         style: TextStyle(
//           color: Color(0xFFD4AF37),
//           fontSize: 12,
//           fontFamily: 'Inter',
//           fontWeight: FontWeight.w700,
//           height: 0,
//         ),
//       ),),
//     ],
//     rows: const [
//       DataRow(cells: [
//         DataCell(Text('GOLD Oz')),
//         DataCell(Text('123.26')),
//         DataCell(Text('213.23')),
//       ]),
//       DataRow(cells: [
//         DataCell(Text('SILVER Oz')),
//         DataCell(Text('123.26')),
//         DataCell(Text('213.23')),
//       ]),
//     ],
//   ),
// ),
