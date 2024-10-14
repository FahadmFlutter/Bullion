import 'dart:convert';
import 'package:bullion/pages/Live%20chart/widgets/bid_ask_live_card.dart';
import 'package:flutter/material.dart';
import 'package:candlesticks/candlesticks.dart';
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
    return (jsonDecode(res.body) as List<dynamic>).map((e) => Candle.fromJson(e))
        .toList().reversed.toList();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Live Chart',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xB2FBF4E4),
                  fontSize: 40,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 24),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                  width: double.infinity,
                  height: 331,
                  decoration: ShapeDecoration(
                    color: Color(0xFF1E222D),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Color(0xFF131313)),
                      borderRadius: BorderRadius.circular(10),
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  width: double.infinity,
                  height: 116,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF131313),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BideAskLive(title: 'BID', mText: 2360.82 , sText: 2346.27, isUp: false,),
                      BideAskLive(title: 'ASK', mText: 2360.82 , sText: 2346.27, isUp: true,),
                    ],
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}


