import 'dart:convert';

import 'package:bullion/views/screens/Live%20chart/widgets/bid_ask_live_card.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class LiveChartScreen extends StatefulWidget {
  const LiveChartScreen({super.key});

  @override
  State<LiveChartScreen> createState() => _LiveChartScreenState();
}

class _LiveChartScreenState extends State<LiveChartScreen> {
  List<Candle> candles = [];

  @override
  void initState() {
    fetchCandles().then((value) {
      setState(() {
        candles = value;
      });
    });
    super.initState();
  }

  Future<List<Candle>> fetchCandles() async {
    final uri = Uri.parse(
        "https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=1h");
    final res = await http.get(uri);
    return (jsonDecode(res.body) as List<dynamic>)
        .map((e) => Candle.fromJson(e))
        .toList()
        .reversed
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("BTCUSDT 1H Chart"),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         setState(() {
      //           themeIsDark = !themeIsDark;
      //         });
      //       },
      //       icon: Icon(
      //         themeIsDark
      //             ? Icons.wb_sunny_sharp
      //             : Icons.nightlight_round_outlined,
      //       ),
      //     )
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h,),
                   Text(
                    'Live Chart',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xB2FBF4E4),
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding:
                         EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 24.h),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                      width: double.infinity,
                      height: 331.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFF1E222D),
                        shape: RoundedRectangleBorder(
                          side:
                               BorderSide(width: 1.w, color: Color(0xFF131313)),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Candlesticks(
                        candles: candles,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                         EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 30.h),
                    child: Container(
                      padding:  EdgeInsets.symmetric(horizontal: 40.w),
                      width: double.infinity,
                      height: 116.h,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF131313),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BideAskLive(
                            title: 'BID',
                            mText: 2360.82,
                            sText: 2346.27,
                            isUp: false,
                          ),
                          BideAskLive(
                            title: 'ASK',
                            mText: 2360.82,
                            sText: 2346.27,
                            isUp: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
