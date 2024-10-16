import 'package:flutter/material.dart';

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
                  Expanded(
                    child: Text(
                      'COMMODITY',
                      style: TextStyle(
                        color: Color(0xFFD4AF37),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 89,
                    child: Center(
                      child: Text(
                        'WEIGHT',
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
                    width: 5,
                  ),
                  SizedBox(
                    width: 100,
                    child: Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'PRICE ',
                              style: TextStyle(
                                color: Color(0xFFD4AF37),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: 'AED',
                              style: TextStyle(
                                color: Color(0xFFD4AF37),
                                fontSize: 10,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.0,vertical: 8),
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
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: sTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 84,
            child: Text(
              weight,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 75,
            child: Text(
              '$price',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
