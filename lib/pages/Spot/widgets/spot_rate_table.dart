import 'package:flutter/material.dart';

import 'bid_ask_card.dart';

class SpotRateTable extends StatelessWidget {
  const SpotRateTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: ShapeDecoration(
        color: const Color(0xFF131313),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        children: [
          /// title row
          Container(
            width: double.infinity,
            height: 33,
            decoration: ShapeDecoration(
              color: const Color(0xFF231F20),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 2, color: Color(0xFF131313)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// spot rate
                  Expanded(
                    child: Text(
                      'SPOT RATE',
                      style: TextStyle(
                        color: Color(0xFFD4AF37),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),

                  /// bid
                  SizedBox(
                    width: 89,
                    child: Center(
                      child: Text(
                        'BID',
                        style: TextStyle(
                          color: Color(0xFFD4AF37),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 16,
                  ),

                  /// ask
                  SizedBox(
                    width: 89,
                    child: Center(
                      child: Text(
                        'ASK',
                        style: TextStyle(
                          color: Color(0xFFD4AF37),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          ///  gold row
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 10, top: 10, bottom: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'GOLD',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          Text(
                            'Oz',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    BidAskCardGold(
                      largText: '2360.82',
                      smallText: 'LOW ${2346.27}',

                    ),
                    SizedBox(
                      width: 16,
                    ),
                    BidAskCardGold(
                      largText: '2361.59',
                      smallText: 'HIGH ${2378.67}',

                    ),
                  ],
                ),
              ],
            ),
          ),

          ///  silver row
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 10, top: 6, bottom: 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sliver',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          Text(
                            'Oz',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    BidAskCardSilver(
                      largText: '28.157',
                      smallText: 'LOW ${28.027}',

                    ),
                    SizedBox(
                      width: 16,
                    ),
                    BidAskCardSilver(
                      largText: '28.182',
                      smallText: 'HIGH ${28.758}',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
