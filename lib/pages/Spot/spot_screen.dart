import 'package:bullion/pages/Spot/widgets/commodity_table.dart';
import 'package:bullion/pages/Spot/widgets/spot_rate_table.dart';
import 'package:flutter/material.dart';

class SpotScreen extends StatelessWidget {
  const SpotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              ///  Logo  &  date and time
              Stack(
                alignment: Alignment.center,
                children: [
                  /// date & time
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Date
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// date
                          Text(
                            '13 MAY',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),

                          /// year
                          Text(
                            '2024',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),

                          /// Day
                          Text(
                            'SATURDAY',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),

                      /// time
                      Text(
                        '07:56\nPM',
                        textAlign: TextAlign.right,
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

                  /// Logo here
                  Container(
                    width: 113,
                    height: 113,
                    decoration: const ShapeDecoration(
                      color: Color(0x7FD9D9D9),
                      shape: OvalBorder(),
                    ),
                    child: const Center(
                      child: Text(
                        'LOGO',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          height: 0,
                        ),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: 50,
              ),
              

              /// Spot rate table
              const SpotRateTable(),

              const SizedBox(
                height: 16,
              ),

              /// Commodity Table,
              const CommodityTable(),
              Expanded(child: Center(
                child: Container(
                  width: 338,
                  height: 27,
                  decoration: ShapeDecoration(
                    color: Color(0xFF131313),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'BREAKING NEWS !!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    Text(
                      'BREAKING NEWS !!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                ),

              ))

            ],
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
