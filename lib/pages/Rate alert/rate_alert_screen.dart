import 'package:bullion/pages/Rate%20alert/widgets/buy_button.dart';
import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';

class RateAlertScreen extends StatelessWidget {
  const RateAlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // bool _stretch = false;
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
        body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
          SliverAppBar(

            // stretch: _stretch,
            // onStretchTrigger: () async {
            //   // Triggers when stretching
            // },
            // [stretchTriggerOffset] describes the amount of overscroll that must occur
            // to trigger [onStretchTrigger]
            //
            // Setting [stretchTriggerOffset] to a value of 300.0 will trigger
            // [onStretchTrigger] when the user has overscrolled by 300.0 pixels.
            // stretchTriggerOffset: 150.0,
            expandedHeight: (158),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: const Color(0xFF131313),
              ),
              expandedTitleScale: 1.2,
              title: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Gold ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Transform.rotate(
                              angle: 45,
                              child: Container(
                                width: 14,
                                height: 14,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: StarBorder.polygon(sides: 3),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Text(
                        '2356.97',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              centerTitle: true,

            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // Prevents the Column from expanding
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: BuyButton(
                        isAdd: true,
                        amount: 0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '-25',
                          style: TextStyle(
                            color:
                            Colors.white.withOpacity(0.699999988079071),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(0.699999988079071),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 290,
                              child: CircularSeekBar(
                                interactive: true,
                                trackColor: Color(0xff141414),
                                width: double.infinity,
                                height: 250,
                                progress: 50,
                                progressColor: Colors.transparent,
                                barWidth: 35,
                                startAngle: 90,
                                sweepAngle: 180,
                                strokeCap: StrokeCap.round,
                                innerThumbRadius: 16,
                                innerThumbColor: Color(0xffD4AF37),

                                // progressGradientColors: [Colors.blue, Colors.indigo, Colors.purple],
                                // dashWidth: 0,
                                // dashGap: 15,
                                animation: false,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '25',
                          style: TextStyle(
                            color:
                            Colors.white.withOpacity(0.699999988079071),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    Transform(
                      transform: Matrix4.identity()..translate(0.0, -110.0),
                      child: Column(
                        children: [
                          const Center(
                            child: BuyButton(
                              isAdd: false,
                              amount: 2345.76,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            'All Alerts',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 14.0, bottom: 4, left: 20, right: 20),
                            child: Container(
                              width: double.infinity,
                              height: 42,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF131313),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 70,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'GOLD',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                          Text(
                                            '2024/05/10 - 15:22:53',
                                            style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(
                                                  0.800000011920929),
                                              fontSize: 6,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 70,
                                      child: Text(
                                        '\$2346.87',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.check_circle_sharp,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 4.0, bottom: 7, left: 20, right: 20),
                            child: Container(
                              width: double.infinity,
                              height: 42,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF131313),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 70,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'GOLD',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                          Text(
                                            '2024/05/10 - 15:22:53',
                                            style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(
                                                  0.800000011920929),
                                              fontSize: 6,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 70,
                                      child: Text(
                                        '\$2346.87',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.check_circle_sharp,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform(
                      transform: Matrix4.identity()..translate(0.0, -60.0),
                      child: Container(
                        width: 165,
                        height: 41,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF131313),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Color(0xFFD4AF37),
                              child: Padding(
                                padding: EdgeInsets.only(left: 3.0),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFF131313),
                                  size: 26,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0),
                              child: Text(
                                'SET ALERT',
                                style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(0.699999988079071),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),


          ),
        ]

            // child: Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //   child: SingleChildScrollView(
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       // Prevents the Column from expanding
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         const Padding(
            //           padding: EdgeInsets.all(20.0),
            //           child: BuyButton(
            //             isAdd: true,
            //             amount: 0,
            //           ),
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Text(
            //               '-25',
            //               style: TextStyle(
            //                 color: Colors.white.withOpacity(0.699999988079071),
            //                 fontSize: 12,
            //                 fontFamily: 'Inter',
            //                 fontWeight: FontWeight.w400,
            //                 height: 0,
            //               ),
            //             ),
            //             Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: [
            //                 Padding(
            //                   padding: const EdgeInsets.all(8.0),
            //                   child: Text(
            //                     '0',
            //                     style: TextStyle(
            //                       color:
            //                           Colors.white.withOpacity(0.699999988079071),
            //                       fontSize: 12,
            //                       fontFamily: 'Inter',
            //                       fontWeight: FontWeight.w400,
            //                       height: 0,
            //                     ),
            //                   ),
            //                 ),
            //                 const SizedBox(
            //                   width: 290,
            //                   child: CircularSeekBar(
            //                     interactive: true,
            //                     trackColor: Color(0xff141414),
            //                     width: double.infinity,
            //                     height: 250,
            //                     progress: 50,
            //                     progressColor: Colors.transparent,
            //                     barWidth: 35,
            //                     startAngle: 90,
            //                     sweepAngle: 180,
            //                     strokeCap: StrokeCap.round,
            //                     innerThumbRadius: 16,
            //                     innerThumbColor: Color(0xffD4AF37),
            //
            //                     // progressGradientColors: [Colors.blue, Colors.indigo, Colors.purple],
            //                     // dashWidth: 0,
            //                     // dashGap: 15,
            //                     animation: false,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             Text(
            //               '25',
            //               style: TextStyle(
            //                 color: Colors.white.withOpacity(0.699999988079071),
            //                 fontSize: 12,
            //                 fontFamily: 'Inter',
            //                 fontWeight: FontWeight.w400,
            //                 height: 0,
            //               ),
            //             ),
            //           ],
            //         ),
            //         Transform(
            //           transform: Matrix4.identity()..translate(0.0, -110.0),
            //           child: Column(
            //             children: [
            //               const Center(
            //                 child: BuyButton(
            //                   isAdd: false,
            //                   amount: 2345.76,
            //                 ),
            //               ),
            //               const SizedBox(
            //                 height: 40,
            //               ),
            //               const Text(
            //                 'All Alerts',
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 20,
            //                   fontFamily: 'Inter',
            //                   fontWeight: FontWeight.w400,
            //                   height: 0,
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     top: 14.0, bottom: 4, left: 20, right: 20),
            //                 child: Container(
            //                   width: double.infinity,
            //                   height: 42,
            //                   decoration: ShapeDecoration(
            //                     color: const Color(0xFF131313),
            //                     shape: RoundedRectangleBorder(
            //                         borderRadius: BorderRadius.circular(5)),
            //                     shadows: const [
            //                       BoxShadow(
            //                         color: Color(0x3F000000),
            //                         blurRadius: 4,
            //                         offset: Offset(0, 4),
            //                         spreadRadius: 0,
            //                       )
            //                     ],
            //                   ),
            //                   child: Padding(
            //                     padding: const EdgeInsets.symmetric(
            //                         horizontal: 16.0, vertical: 8),
            //                     child: Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       children: [
            //                         SizedBox(
            //                           width: 70,
            //                           child: Column(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.center,
            //                             crossAxisAlignment:
            //                                 CrossAxisAlignment.start,
            //                             children: [
            //                               const Text(
            //                                 'GOLD',
            //                                 style: TextStyle(
            //                                   color: Colors.white,
            //                                   fontSize: 14,
            //                                   fontFamily: 'Inter',
            //                                   fontWeight: FontWeight.w700,
            //                                   height: 0,
            //                                 ),
            //                               ),
            //                               Text(
            //                                 '2024/05/10 - 15:22:53',
            //                                 style: TextStyle(
            //                                   color: Colors.white
            //                                       .withOpacity(0.800000011920929),
            //                                   fontSize: 6,
            //                                   fontFamily: 'Inter',
            //                                   fontWeight: FontWeight.w400,
            //                                   height: 0,
            //                                 ),
            //                               )
            //                             ],
            //                           ),
            //                         ),
            //                         const SizedBox(
            //                           width: 70,
            //                           child: Text(
            //                             '\$2346.87',
            //                             style: TextStyle(
            //                               color: Colors.white,
            //                               fontSize: 14,
            //                               fontFamily: 'Inter',
            //                               fontWeight: FontWeight.w700,
            //                               height: 0,
            //                             ),
            //                           ),
            //                         ),
            //                         Icon(
            //                           Icons.check_circle_sharp,
            //                           color: Colors.white,
            //                           size: 16,
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     top: 4.0, bottom: 7, left: 20, right: 20),
            //                 child: Container(
            //                   width: double.infinity,
            //                   height: 42,
            //                   decoration: ShapeDecoration(
            //                     color: const Color(0xFF131313),
            //                     shape: RoundedRectangleBorder(
            //                         borderRadius: BorderRadius.circular(5)),
            //                     shadows: const [
            //                       BoxShadow(
            //                         color: Color(0x3F000000),
            //                         blurRadius: 4,
            //                         offset: Offset(0, 4),
            //                         spreadRadius: 0,
            //                       )
            //                     ],
            //                   ),
            //                   child: Padding(
            //                     padding: const EdgeInsets.symmetric(
            //                         horizontal: 16.0, vertical: 8),
            //                     child: Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       children: [
            //                         SizedBox(
            //                           width: 70,
            //                           child: Column(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.center,
            //                             crossAxisAlignment:
            //                                 CrossAxisAlignment.start,
            //                             children: [
            //                               const Text(
            //                                 'GOLD',
            //                                 style: TextStyle(
            //                                   color: Colors.white,
            //                                   fontSize: 14,
            //                                   fontFamily: 'Inter',
            //                                   fontWeight: FontWeight.w700,
            //                                   height: 0,
            //                                 ),
            //                               ),
            //                               Text(
            //                                 '2024/05/10 - 15:22:53',
            //                                 style: TextStyle(
            //                                   color: Colors.white
            //                                       .withOpacity(0.800000011920929),
            //                                   fontSize: 6,
            //                                   fontFamily: 'Inter',
            //                                   fontWeight: FontWeight.w400,
            //                                   height: 0,
            //                                 ),
            //                               )
            //                             ],
            //                           ),
            //                         ),
            //                         const SizedBox(
            //                           width: 70,
            //                           child: Text(
            //                             '\$2346.87',
            //                             style: TextStyle(
            //                               color: Colors.white,
            //                               fontSize: 14,
            //                               fontFamily: 'Inter',
            //                               fontWeight: FontWeight.w700,
            //                               height: 0,
            //                             ),
            //                           ),
            //                         ),
            //                         const Icon(
            //                           Icons.check_circle_sharp,
            //                           color: Colors.white,
            //                           size: 16,
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //
            //             ],
            //           ),
            //         ),
            //         Transform(
            //           transform: Matrix4.identity()..translate(0.0, -60.0),
            //
            //           child: Container(
            //             width: 165,
            //             height: 41,
            //             decoration: ShapeDecoration(
            //               color: const Color(0xFF131313),
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(30),
            //               ),
            //               shadows: const [
            //                 BoxShadow(
            //                   color: Color(0x3F000000),
            //                   blurRadius: 4,
            //                   offset: Offset(0, 4),
            //                   spreadRadius: 0,
            //                 ),
            //               ],
            //             ),
            //             child:  Row(
            //
            //               children: [
            //                 const CircleAvatar(
            //                   backgroundColor: Color(0xFFD4AF37),
            //                   child: Padding(
            //                     padding: EdgeInsets.only(left: 3.0),
            //                     child: Icon(Icons.chevron_right,color: Color(0xFF131313),size: 26,),
            //                   ),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //                   child: Text(
            //                     'SET ALERT',
            //                     style: TextStyle(
            //                       color: Colors.white.withOpacity(0.699999988079071),
            //                       fontSize: 14,
            //                       fontFamily: 'Inter',
            //                       fontWeight: FontWeight.w400,
            //                       height: 0,
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            ));
  }
}
