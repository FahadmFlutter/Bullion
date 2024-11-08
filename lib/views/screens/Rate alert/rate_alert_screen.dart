import 'package:bullion/views/screens/Rate%20alert/widgets/buy_button.dart';
import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_to_act/slide_to_act.dart';

class RateAlertScreen extends StatelessWidget {
  const RateAlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
    // bool _stretch = false;
    double newValue = 0;
    return Scaffold(
      // appBar: AppBar(
      //   scrolledUnderElevation: 0,
      //   toolbarHeight: 158-15,
      //   backgroundColor: const Color(0xFF131313),
      //   centerTitle: true,
      //   title: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Row(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           const Text(
      //             'Gold ',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 32,
      //               fontFamily: 'Inter',
      //               fontWeight: FontWeight.w700,
      //               height: 0,
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.symmetric(vertical: 10.0),
      //             child: Transform.rotate(
      //               angle: 45,
      //               child: Container(
      //                 width: 18,
      //                 height: 18,
      //                 decoration: const ShapeDecoration(
      //                   color: Color(0xFFD9D9D9),
      //                   shape: StarBorder.polygon(sides: 3),
      //                 ),
      //               ),
      //             ),
      //           )
      //         ],
      //       ),
      //       const Text(
      //         '2356.97',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 24,
      //           fontFamily: 'Inter',
      //           fontWeight: FontWeight.w700,
      //           height: 0,
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 158.h,
                decoration: BoxDecoration(color: Color(0xFF131313)),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Gold ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0.h),
                            child: Transform.rotate(
                              angle: 45,
                              child: Container(
                                width: 14.w,
                                height: 14.h,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: StarBorder.polygon(sides: 3),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        '2356.97',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0.w),
                child: BuyButton(
                  isAdd: true,
                  amount: newValue,
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '-25',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.699999988079071),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '0',
                            style: TextStyle(
                              color:
                                  Colors.white.withOpacity(0.699999988079071),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.0.w,
                          ),
                          child: CircularSeekBar(
                            valueNotifier: _valueNotifier,
                            interactive: true,
                            trackColor: Color(0xff141414),
                            width: 290.w,
                            height: 290.w,
                            progress: 25,
                            maxProgress: 50,
                            progressColor: Colors.transparent,
                            barWidth: 40.w,
                            startAngle: 95,
                            sweepAngle: 170,

                            strokeCap: StrokeCap.round,
                            innerThumbRadius: 20.r,
                            innerThumbColor: Color(0xffD4AF37),

                            // progressGradientColors: [Colors.blue, Colors.indigo, Colors.purple],
                            dashWidth: 1,
                            dashGap: 1,
                            animation: false,
                            child: Padding(
                              padding: EdgeInsets.only(top: 150.0.h),
                              child: ValueListenableBuilder(
                                valueListenable: _valueNotifier,
                                builder: (_, double value, __) {
                                  
                                  newValue = value;
                                  return Column(
                                    children: [
                                      Center(
                                        child: BuyButton(
                                          isAdd: false,
                                          // amount: 2345.76,
                                          amount: 2345.76 + newValue - (25),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40.h,
                                      ),
                                      Text(
                                        'All Alerts',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '25',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.699999988079071),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 14.0.h, bottom: 4.h, left: 20.w, right: 20.w),
                child: Container(
                  width: double.infinity,
                  // height: 42.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF131313),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r)),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0.w, vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 70.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'GOLD',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '2024/05/10 - 15:22:53',
                                style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(0.800000011920929),
                                  fontSize: 6.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 70.w,
                          child: Text(
                            '\$2346.87',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.check_circle_sharp,
                          color: Colors.white,
                          size: 16.sp,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 4.0.h, bottom: 7.h, left: 20.w, right: 20.w),
                child: Container(
                  width: double.infinity,
                  // height: 42.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF131313),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4.r,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0.w, vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 70.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'GOLD',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '2024/05/10 - 15:22:53',
                                style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(0.800000011920929),
                                  fontSize: 6.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 70.w,
                          child: Text(
                            '\$2346.87',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.check_circle_sharp,
                          color: Colors.white,
                          size: 16.sp,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Builder(
                builder: (ctx) {
                  final GlobalKey<SlideActionState> _key = GlobalKey();
                  return Padding(
                    padding: const EdgeInsets.all(33.0),
                    child: SizedBox(
                      width: 165.w,
                      height: 41.h,
                      child: SlideAction(
                        text: 'SET ALERT',
                        textStyle: TextStyle(
                          color: Colors.white.withOpacity(0.699999988079071),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        height: 41.h,
                        sliderButtonIcon: Icon(
                          Icons.chevron_right,
                          color: Color(0xFF131313),
                        ),
                        innerColor: Color(0xFFD4AF37),
                        outerColor: Color(0xFF131313),
                        sliderButtonIconPadding: 8.w,
                        sliderButtonIconSize: 26.sp,
                        sliderButtonYOffset: -10,
                        sliderRotate: false,
                        enabled: true,
                        key: _key,
                        onSubmit: () {
                          Future.delayed(
                            Duration(seconds: 1),
                            () => _key.currentState!.reset(),
                          );
                          ScaffoldMessenger.of(ctx).showSnackBar(
                            snackBarAnimationStyle: AnimationStyle(

                            ),
                            SnackBar(

                              action: SnackBarAction(
                                  label: 'cancel',
                                  textColor: Colors.red,
                                  onPressed: () {
                                    // Navigator.pop(ctx);
                                  }),
                              content: Text(
                                'Alert set',
                              ),

                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              // Padding(
              //   padding: EdgeInsets.all(33.0.w),
              //   child: Container(
              //     width: 165.w,
              //     height: 41.h,
              //     decoration: ShapeDecoration(
              //       color: const Color(0xFF131313),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30.r),
              //       ),
              //       shadows: [
              //         BoxShadow(
              //           color: Color(0x3F000000),
              //           blurRadius: 4.r,
              //           offset: Offset(0, 4),
              //           spreadRadius: 0,
              //         ),
              //       ],
              //     ),
              //     child: Row(
              //       children: [
              //         CircleAvatar(
              //           backgroundColor: Color(0xFFD4AF37),
              //           child: Padding(
              //             padding: EdgeInsets.only(left: 3.0.w),
              //             child: Icon(
              //               Icons.chevron_right,
              //               color: Color(0xFF131313),
              //               size: 26,
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              //           child: Text(
              //             'SET ALERT',
              //             style: TextStyle(
              //               color:
              //               Colors.white.withOpacity(0.699999988079071),
              //               fontSize: 14.sp,
              //               fontWeight: FontWeight.w400,
              //             ),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),

      // CustomScrollView(
      //     physics: const BouncingScrollPhysics(),
      //     slivers: <Widget>[
      //   SliverAppBar(
      //     // stretch: _stretch,
      //     // onStretchTrigger: () async {
      //     //   // Triggers when stretching
      //     // },
      //     // [stretchTriggerOffset] describes the amount of overscroll that must occur
      //     // to trigger [onStretchTrigger]
      //     //
      //     // Setting [stretchTriggerOffset] to a value of 300.0 will trigger
      //     // [onStretchTrigger] when the user has overscrolled by 300.0 pixels.
      //     // stretchTriggerOffset: 150.0,
      //     expandedHeight: (158.h),
      //     flexibleSpace: FlexibleSpaceBar(
      //       background: Container(
      //         color: const Color(0xFF131313),
      //       ),
      //       expandedTitleScale: 1.2,
      //       title: SingleChildScrollView(
      //         child: Padding(
      //           padding: EdgeInsets.all(40.0.w),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Row(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Text(
      //                     'Gold ',
      //                     style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 24.sp,
      //                       fontWeight: FontWeight.w700,
      //                     ),
      //                   ),
      //                   Padding(
      //                     padding: EdgeInsets.symmetric(vertical: 5.0.h),
      //                     child: Transform.rotate(
      //                       angle: 45,
      //                       child: Container(
      //                         width: 14.w,
      //                         height: 14.h,
      //                         decoration: const ShapeDecoration(
      //                           color: Color(0xFFD9D9D9),
      //                           shape: StarBorder.polygon(sides: 3),
      //                         ),
      //                       ),
      //                     ),
      //                   )
      //                 ],
      //               ),
      //               Text(
      //                 '2356.97',
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 18.sp,
      //                   fontWeight: FontWeight.w700,
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //       centerTitle: true,
      //     ),
      //   ),
      //
      // ]
      //
      //     // child: Padding(
      //     //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //     //   child: SingleChildScrollView(
      //     //     child: Column(
      //     //       mainAxisSize: MainAxisSize.min,
      //     //       // Prevents the Column from expanding
      //     //       crossAxisAlignment: CrossAxisAlignment.center,
      //     //       children: [
      //     //         const Padding(
      //     //           padding: EdgeInsets.all(20.0),
      //     //           child: BuyButton(
      //     //             isAdd: true,
      //     //             amount: 0,
      //     //           ),
      //     //         ),
      //     //         Row(
      //     //           mainAxisAlignment: MainAxisAlignment.center,
      //     //           crossAxisAlignment: CrossAxisAlignment.center,
      //     //           children: [
      //     //             Text(
      //     //               '-25',
      //     //               style: TextStyle(
      //     //                 color: Colors.white.withOpacity(0.699999988079071),
      //     //                 fontSize: 12,
      //     //                 fontFamily: 'Inter',
      //     //                 fontWeight: FontWeight.w400,
      //     //                 height: 0,
      //     //               ),
      //     //             ),
      //     //             Column(
      //     //               mainAxisAlignment: MainAxisAlignment.center,
      //     //               crossAxisAlignment: CrossAxisAlignment.center,
      //     //               children: [
      //     //                 Padding(
      //     //                   padding: const EdgeInsets.all(8.0),
      //     //                   child: Text(
      //     //                     '0',
      //     //                     style: TextStyle(
      //     //                       color:
      //     //                           Colors.white.withOpacity(0.699999988079071),
      //     //                       fontSize: 12,
      //     //                       fontFamily: 'Inter',
      //     //                       fontWeight: FontWeight.w400,
      //     //                       height: 0,
      //     //                     ),
      //     //                   ),
      //     //                 ),
      //     //                 const SizedBox(
      //     //                   width: 290,
      //     //                   child: CircularSeekBar(
      //     //                     interactive: true,
      //     //                     trackColor: Color(0xff141414),
      //     //                     width: double.infinity,
      //     //                     height: 250,
      //     //                     progress: 50,
      //     //                     progressColor: Colors.transparent,
      //     //                     barWidth: 35,
      //     //                     startAngle: 90,
      //     //                     sweepAngle: 180,
      //     //                     strokeCap: StrokeCap.round,
      //     //                     innerThumbRadius: 16,
      //     //                     innerThumbColor: Color(0xffD4AF37),
      //     //
      //     //                     // progressGradientColors: [Colors.blue, Colors.indigo, Colors.purple],
      //     //                     // dashWidth: 0,
      //     //                     // dashGap: 15,
      //     //                     animation: false,
      //     //                   ),
      //     //                 ),
      //     //               ],
      //     //             ),
      //     //             Text(
      //     //               '25',
      //     //               style: TextStyle(
      //     //                 color: Colors.white.withOpacity(0.699999988079071),
      //     //                 fontSize: 12,
      //     //                 fontFamily: 'Inter',
      //     //                 fontWeight: FontWeight.w400,
      //     //                 height: 0,
      //     //               ),
      //     //             ),
      //     //           ],
      //     //         ),
      //     //         Transform(
      //     //           transform: Matrix4.identity()..translate(0.0, -110.0),
      //     //           child: Column(
      //     //             children: [
      //     //               const Center(
      //     //                 child: BuyButton(
      //     //                   isAdd: false,
      //     //                   amount: 2345.76,
      //     //                 ),
      //     //               ),
      //     //               const SizedBox(
      //     //                 height: 40,
      //     //               ),
      //     //               const Text(
      //     //                 'All Alerts',
      //     //                 textAlign: TextAlign.center,
      //     //                 style: TextStyle(
      //     //                   color: Colors.white,
      //     //                   fontSize: 20,
      //     //                   fontFamily: 'Inter',
      //     //                   fontWeight: FontWeight.w400,
      //     //                   height: 0,
      //     //                 ),
      //     //               ),
      //     //               Padding(
      //     //                 padding: const EdgeInsets.only(
      //     //                     top: 14.0, bottom: 4, left: 20, right: 20),
      //     //                 child: Container(
      //     //                   width: double.infinity,
      //     //                   height: 42,
      //     //                   decoration: ShapeDecoration(
      //     //                     color: const Color(0xFF131313),
      //     //                     shape: RoundedRectangleBorder(
      //     //                         borderRadius: BorderRadius.circular(5)),
      //     //                     shadows: const [
      //     //                       BoxShadow(
      //     //                         color: Color(0x3F000000),
      //     //                         blurRadius: 4,
      //     //                         offset: Offset(0, 4),
      //     //                         spreadRadius: 0,
      //     //                       )
      //     //                     ],
      //     //                   ),
      //     //                   child: Padding(
      //     //                     padding: const EdgeInsets.symmetric(
      //     //                         horizontal: 16.0, vertical: 8),
      //     //                     child: Row(
      //     //                       mainAxisAlignment:
      //     //                           MainAxisAlignment.spaceBetween,
      //     //                       children: [
      //     //                         SizedBox(
      //     //                           width: 70,
      //     //                           child: Column(
      //     //                             mainAxisAlignment:
      //     //                                 MainAxisAlignment.center,
      //     //                             crossAxisAlignment:
      //     //                                 CrossAxisAlignment.start,
      //     //                             children: [
      //     //                               const Text(
      //     //                                 'GOLD',
      //     //                                 style: TextStyle(
      //     //                                   color: Colors.white,
      //     //                                   fontSize: 14,
      //     //                                   fontFamily: 'Inter',
      //     //                                   fontWeight: FontWeight.w700,
      //     //                                   height: 0,
      //     //                                 ),
      //     //                               ),
      //     //                               Text(
      //     //                                 '2024/05/10 - 15:22:53',
      //     //                                 style: TextStyle(
      //     //                                   color: Colors.white
      //     //                                       .withOpacity(0.800000011920929),
      //     //                                   fontSize: 6,
      //     //                                   fontFamily: 'Inter',
      //     //                                   fontWeight: FontWeight.w400,
      //     //                                   height: 0,
      //     //                                 ),
      //     //                               )
      //     //                             ],
      //     //                           ),
      //     //                         ),
      //     //                         const SizedBox(
      //     //                           width: 70,
      //     //                           child: Text(
      //     //                             '\$2346.87',
      //     //                             style: TextStyle(
      //     //                               color: Colors.white,
      //     //                               fontSize: 14,
      //     //                               fontFamily: 'Inter',
      //     //                               fontWeight: FontWeight.w700,
      //     //                               height: 0,
      //     //                             ),
      //     //                           ),
      //     //                         ),
      //     //                         Icon(
      //     //                           Icons.check_circle_sharp,
      //     //                           color: Colors.white,
      //     //                           size: 16,
      //     //                         )
      //     //                       ],
      //     //                     ),
      //     //                   ),
      //     //                 ),
      //     //               ),
      //     //               Padding(
      //     //                 padding: const EdgeInsets.only(
      //     //                     top: 4.0, bottom: 7, left: 20, right: 20),
      //     //                 child: Container(
      //     //                   width: double.infinity,
      //     //                   height: 42,
      //     //                   decoration: ShapeDecoration(
      //     //                     color: const Color(0xFF131313),
      //     //                     shape: RoundedRectangleBorder(
      //     //                         borderRadius: BorderRadius.circular(5)),
      //     //                     shadows: const [
      //     //                       BoxShadow(
      //     //                         color: Color(0x3F000000),
      //     //                         blurRadius: 4,
      //     //                         offset: Offset(0, 4),
      //     //                         spreadRadius: 0,
      //     //                       )
      //     //                     ],
      //     //                   ),
      //     //                   child: Padding(
      //     //                     padding: const EdgeInsets.symmetric(
      //     //                         horizontal: 16.0, vertical: 8),
      //     //                     child: Row(
      //     //                       mainAxisAlignment:
      //     //                           MainAxisAlignment.spaceBetween,
      //     //                       children: [
      //     //                         SizedBox(
      //     //                           width: 70,
      //     //                           child: Column(
      //     //                             mainAxisAlignment:
      //     //                                 MainAxisAlignment.center,
      //     //                             crossAxisAlignment:
      //     //                                 CrossAxisAlignment.start,
      //     //                             children: [
      //     //                               const Text(
      //     //                                 'GOLD',
      //     //                                 style: TextStyle(
      //     //                                   color: Colors.white,
      //     //                                   fontSize: 14,
      //     //                                   fontFamily: 'Inter',
      //     //                                   fontWeight: FontWeight.w700,
      //     //                                   height: 0,
      //     //                                 ),
      //     //                               ),
      //     //                               Text(
      //     //                                 '2024/05/10 - 15:22:53',
      //     //                                 style: TextStyle(
      //     //                                   color: Colors.white
      //     //                                       .withOpacity(0.800000011920929),
      //     //                                   fontSize: 6,
      //     //                                   fontFamily: 'Inter',
      //     //                                   fontWeight: FontWeight.w400,
      //     //                                   height: 0,
      //     //                                 ),
      //     //                               )
      //     //                             ],
      //     //                           ),
      //     //                         ),
      //     //                         const SizedBox(
      //     //                           width: 70,
      //     //                           child: Text(
      //     //                             '\$2346.87',
      //     //                             style: TextStyle(
      //     //                               color: Colors.white,
      //     //                               fontSize: 14,
      //     //                               fontFamily: 'Inter',
      //     //                               fontWeight: FontWeight.w700,
      //     //                               height: 0,
      //     //                             ),
      //     //                           ),
      //     //                         ),
      //     //                         const Icon(
      //     //                           Icons.check_circle_sharp,
      //     //                           color: Colors.white,
      //     //                           size: 16,
      //     //                         )
      //     //                       ],
      //     //                     ),
      //     //                   ),
      //     //                 ),
      //     //               ),
      //     //
      //     //             ],
      //     //           ),
      //     //         ),
      //     //         Transform(
      //     //           transform: Matrix4.identity()..translate(0.0, -60.0),
      //     //
      //     //           child: Container(
      //     //             width: 165,
      //     //             height: 41,
      //     //             decoration: ShapeDecoration(
      //     //               color: const Color(0xFF131313),
      //     //               shape: RoundedRectangleBorder(
      //     //                 borderRadius: BorderRadius.circular(30),
      //     //               ),
      //     //               shadows: const [
      //     //                 BoxShadow(
      //     //                   color: Color(0x3F000000),
      //     //                   blurRadius: 4,
      //     //                   offset: Offset(0, 4),
      //     //                   spreadRadius: 0,
      //     //                 ),
      //     //               ],
      //     //             ),
      //     //             child:  Row(
      //     //
      //     //               children: [
      //     //                 const CircleAvatar(
      //     //                   backgroundColor: Color(0xFFD4AF37),
      //     //                   child: Padding(
      //     //                     padding: EdgeInsets.only(left: 3.0),
      //     //                     child: Icon(Icons.chevron_right,color: Color(0xFF131313),size: 26,),
      //     //                   ),
      //     //                 ),
      //     //                 Padding(
      //     //                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //     //                   child: Text(
      //     //                     'SET ALERT',
      //     //                     style: TextStyle(
      //     //                       color: Colors.white.withOpacity(0.699999988079071),
      //     //                       fontSize: 14,
      //     //                       fontFamily: 'Inter',
      //     //                       fontWeight: FontWeight.w400,
      //     //                       height: 0,
      //     //                     ),
      //     //                   ),
      //     //                 )
      //     //               ],
      //     //             ),
      //     //           ),
      //     //         ),
      //     //       ],
      //     //     ),
      //     //   ),
      //     // ),
    );
  }
}
