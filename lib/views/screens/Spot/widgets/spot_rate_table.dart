import 'package:bullion/Bloc/get_assets/get_assets_bloc.dart';
import 'package:bullion/Repository/Models/get_assets_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';


import 'bid_ask_card.dart';

class SpotRateTable extends StatefulWidget {
  const SpotRateTable({
    super.key,
  });

  @override
  State<SpotRateTable> createState() => _SpotRateTableState();
}

late GetAssetsModel assets;

class _SpotRateTableState extends State<SpotRateTable> {
  @override
  void initState() {
    BlocProvider.of<GetAssetsBloc>(context).add(FetchGetAssets());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160.h,
      decoration: ShapeDecoration(
        color: Color(0xFF131313),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Column(
        children: [
          /// title row
          Container(
            width: double.infinity,
            height: 33.h,
            decoration: ShapeDecoration(
              color: const Color(0xFF231F20),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 2.w, color: Color(0xFF131313)),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 16.0.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// spot rate
                  Expanded(
                    child: Text(
                      'SPOT RATE',
                      style: TextStyle(
                        color: Color(0xFFD4AF37),
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  /// bid
                  SizedBox(
                    width: 89.w,
                    child: Center(
                      child: Text(
                        'BID',
                        style: TextStyle(
                          color: Color(0xFFD4AF37),
                          fontSize: 12.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 16.w,
                  ),

                  /// ask
                  SizedBox(
                    width: 89.w,
                    child: Center(
                      child: Text(
                        'ASK',
                        style: TextStyle(
                          color: Color(0xFFD4AF37),
                          fontSize: 12.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 16.0.w, right: 10.w, top: 10.h, bottom: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<GetAssetsBloc, GetAssetsState>(
                  builder: (context, state) {
                    if (state is GetAssetsLoading) {
                      return Shimmer.fromColors(
                        baseColor: Colors.brown.shade300.withOpacity(0.4),
                        highlightColor: Colors.brown.shade100.withOpacity(0.5),
                        enabled: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80.w,
                              height: 15.h,
                              decoration: ShapeDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h,),
                            Container(
                              width: 40.w,
                              height: 14.h,
                              decoration: ShapeDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                      // return Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     Text('loading'),
                      //     Padding(
                      //       padding: EdgeInsets.all(8.0.w),
                      //       child: SizedBox(
                      //           width: 45.w,
                      //           child: LinearProgressIndicator()),
                      //     )
                      //   ],
                      // );
                    }
                    if (state is GetAssetsError) {
                      // return Center(
                      //   child: Icon(
                      //     Icons.error,
                      //     color: Colors.red,
                      //   ),
                      // );
                      return Shimmer.fromColors(
                        baseColor: Colors.red.shade300.withOpacity(0.4),
                        highlightColor: Colors.red.shade100.withOpacity(0.5),
                        enabled: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80.w,
                              height: 15.h,
                              decoration: ShapeDecoration(
                                color: Colors.red.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h,),
                            Container(
                              width: 40.w,
                              height: 14.h,
                              decoration: ShapeDecoration(
                                color: Colors.red.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    if (state is GetAssetsLoaded) {
                      final assets = BlocProvider.of<GetAssetsBloc>(context)
                          .getAssetsList
                          .assets;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            assets[0].name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            assets[0].description,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      );
                    }

                    return SizedBox();
                  },
                ),
                Spacer(),
                BlocBuilder<GetAssetsBloc, GetAssetsState>(
                  builder: (context, state) {
                    if (state is GetAssetsLoading) {
                      return Shimmer.fromColors(
                        baseColor: Colors.brown.shade300.withOpacity(0.4),
                        highlightColor: Colors.brown.shade100.withOpacity(0.5),
                        enabled: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 89.w,
                              height: 55.h,
                              decoration: ShapeDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 89.w,
                                    height: 16.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                      // return BidAskCardGold(
                      //   largText: '0000',
                      //   smallText: '',
                      // );
                    }
                    if (state is GetAssetsError) {
                      // return BidAskCardGold(
                      //   largText: 'NO DATA',
                      //   smallText: 'error',
                      // );
                      return Shimmer.fromColors(
                        baseColor: Colors.red.shade300.withOpacity(0.4),
                        highlightColor: Colors.red.shade100.withOpacity(0.5),
                        enabled: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 89.w,
                              height: 55.h,
                              decoration: ShapeDecoration(
                                color: Colors.red.withOpacity(0.4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 89.w,
                                    height: 16.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.red.withOpacity(0.3),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    }
                    // if (state is GetAssetsLoaded) {
                    //   final assets = BlocProvider.of<GetAssetsBloc>(context)
                    //       .getAssetsList
                    //       .assets;
                    //
                    //   return Column(
                    //     children: [
                    //       ///  gold row
                    //       Padding(
                    //         padding: const EdgeInsets.only(
                    //             left: 16.0, right: 10, top: 10, bottom: 8),
                    //         child: Column(
                    //           children: assets.map((assets) {
                    //             return Row(
                    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //               children: [
                    //                 const Expanded(
                    //                   child: Column(
                    //                     crossAxisAlignment: CrossAxisAlignment.start,
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       Text(
                    //                         'GOLD',
                    //                         style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 16,
                    //                           fontFamily: 'Inter',
                    //                           fontWeight: FontWeight.w700,
                    //                         ),
                    //                       ),
                    //                       Text(
                    //                         'Oz',
                    //                         style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 16,
                    //                           fontFamily: 'Inter',
                    //                           fontWeight: FontWeight.w700,
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 BidAskCardGold(
                    //                   largText: '${assets.sellPrice}',
                    //                   smallText: 'LOW ${assets.sellPrice}',
                    //                 ),
                    //                 const SizedBox(
                    //                   width: 16,
                    //                 ),
                    //                 BidAskCardGold(
                    //                   largText: '${assets.buyPrice}',
                    //                   smallText: 'HIGH ${assets.buyPrice}',
                    //                 ),
                    //               ],
                    //             );
                    //           }).toList(),
                    //         ),
                    //       ),
                    //
                    //       ///  silver row
                    //       Padding(
                    //         padding: const EdgeInsets.only(
                    //             left: 16.0, right: 10, top: 10, bottom: 8),
                    //         child: Column(
                    //           children: assets.map((assets) {
                    //             return Row(
                    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //               children: [
                    //                 const Expanded(
                    //                   child: Column(
                    //                     crossAxisAlignment: CrossAxisAlignment.start,
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       Text(
                    //                         'Sliver',
                    //                         style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 12,
                    //                           fontFamily: 'Inter',
                    //                           fontWeight: FontWeight.w400,
                    //                         ),
                    //                       ),
                    //                       Text(
                    //                         'Oz',
                    //                         style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 12,
                    //                           fontFamily: 'Inter',
                    //                           fontWeight: FontWeight.w400,
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 BidAskCardSilver(
                    //                   largText: '${assets.sellPrice}',
                    //                   smallText: 'LOW ${assets.sellPrice}',
                    //                 ),
                    //                 const SizedBox(
                    //                   width: 16,
                    //                 ),
                    //                 BidAskCardSilver(
                    //                   largText: '${assets.buyPrice}',
                    //                   smallText: 'HIGH ${assets.buyPrice}',
                    //                 ),
                    //               ],
                    //             );
                    //           }).toList(),
                    //         ),
                    //       ),
                    //     ],
                    //   );
                    // }
                    if (state is GetAssetsLoaded) {
                      final assets = BlocProvider.of<GetAssetsBloc>(context)
                          .getAssetsList
                          .assets;
                      return BidAskCardGold(
                        largText: '${assets[0].sellPrice}',
                        smallText: 'LOW ${assets[0].sellPrice}',
                      );
                    }

                    return SizedBox();
                  },
                ),
                SizedBox(width: 16.w),
                BlocBuilder<GetAssetsBloc, GetAssetsState>(
                  builder: (context, state) {
                    if (state is GetAssetsLoading) {
                      return Shimmer.fromColors(
                        baseColor: Colors.brown.shade300.withOpacity(0.4),
                        highlightColor: Colors.brown.shade100.withOpacity(0.5),
                        enabled: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 89.w,
                              height: 55.h,
                              decoration: ShapeDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 89.w,
                                    height: 16.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                      // return BidAskCardGold(
                      //   largText: '0000',
                      //   smallText: '',
                      // );
                    }
                    if (state is GetAssetsError) {
                      // return BidAskCardGold(
                      //   largText: 'NO DATA',
                      //   smallText: 'error',
                      // );
                      return Shimmer.fromColors(
                        baseColor: Colors.red.shade300.withOpacity(0.4),
                        highlightColor: Colors.red.shade100.withOpacity(0.5),
                        enabled: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 89.w,
                              height: 55.h,
                              decoration: ShapeDecoration(
                                color: Colors.red.withOpacity(0.4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 89.w,
                                    height: 16.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.red.withOpacity(0.3),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    }
                    // if (state is GetAssetsLoaded) {
                    //   final assets = BlocProvider.of<GetAssetsBloc>(context)
                    //       .getAssetsList
                    //       .assets;
                    //
                    //   return Column(
                    //     children: [
                    //       ///  gold row
                    //       Padding(
                    //         padding: const EdgeInsets.only(
                    //             left: 16.0, right: 10, top: 10, bottom: 8),
                    //         child: Column(
                    //           children: assets.map((assets) {
                    //             return Row(
                    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //               children: [
                    //                 const Expanded(
                    //                   child: Column(
                    //                     crossAxisAlignment: CrossAxisAlignment.start,
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       Text(
                    //                         'GOLD',
                    //                         style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 16,
                    //                           fontFamily: 'Inter',
                    //                           fontWeight: FontWeight.w700,
                    //                         ),
                    //                       ),
                    //                       Text(
                    //                         'Oz',
                    //                         style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 16,
                    //                           fontFamily: 'Inter',
                    //                           fontWeight: FontWeight.w700,
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 BidAskCardGold(
                    //                   largText: '${assets.sellPrice}',
                    //                   smallText: 'LOW ${assets.sellPrice}',
                    //                 ),
                    //                 const SizedBox(
                    //                   width: 16,
                    //                 ),
                    //                 BidAskCardGold(
                    //                   largText: '${assets.buyPrice}',
                    //                   smallText: 'HIGH ${assets.buyPrice}',
                    //                 ),
                    //               ],
                    //             );
                    //           }).toList(),
                    //         ),
                    //       ),
                    //
                    //       ///  silver row
                    //       Padding(
                    //         padding: const EdgeInsets.only(
                    //             left: 16.0, right: 10, top: 10, bottom: 8),
                    //         child: Column(
                    //           children: assets.map((assets) {
                    //             return Row(
                    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //               children: [
                    //                 const Expanded(
                    //                   child: Column(
                    //                     crossAxisAlignment: CrossAxisAlignment.start,
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       Text(
                    //                         'Sliver',
                    //                         style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 12,
                    //                           fontFamily: 'Inter',
                    //                           fontWeight: FontWeight.w400,
                    //                         ),
                    //                       ),
                    //                       Text(
                    //                         'Oz',
                    //                         style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 12,
                    //                           fontFamily: 'Inter',
                    //                           fontWeight: FontWeight.w400,
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 BidAskCardSilver(
                    //                   largText: '${assets.sellPrice}',
                    //                   smallText: 'LOW ${assets.sellPrice}',
                    //                 ),
                    //                 const SizedBox(
                    //                   width: 16,
                    //                 ),
                    //                 BidAskCardSilver(
                    //                   largText: '${assets.buyPrice}',
                    //                   smallText: 'HIGH ${assets.buyPrice}',
                    //                 ),
                    //               ],
                    //             );
                    //           }).toList(),
                    //         ),
                    //       ),
                    //     ],
                    //   );
                    // }
                    if (state is GetAssetsLoaded) {
                      final assets = BlocProvider.of<GetAssetsBloc>(context)
                          .getAssetsList
                          .assets;

                      return BidAskCardGold(
                        largText: '${assets[0].buyPrice}',
                        smallText: 'LOW ${assets[0].buyPrice}',
                      );
                    }

                    return SizedBox();
                  },
                ),
                // BidAskCardGold(
                //   largText: '${455}',
                //   smallText: 'HIGH ${152}',
                // ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 16.0.w, right: 10.w, top: 4.h, bottom: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<GetAssetsBloc, GetAssetsState>(
                  builder: (context, state) {
                    if (state is GetAssetsLoading) {
                      return Shimmer.fromColors(
                        baseColor: Colors.brown.shade300.withOpacity(0.4),
                        highlightColor: Colors.brown.shade100.withOpacity(0.5),
                        enabled: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80.w,
                              height: 12.h,
                              decoration: ShapeDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h,),
                            Container(
                              width: 40.w,
                              height: 10.h,
                              decoration: ShapeDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    if (state is GetAssetsError) {
                      // return Center(
                      //   child: Icon(
                      //     Icons.error,
                      //     color: Colors.red,
                      //   ),
                      // );
                      return Shimmer.fromColors(
                        baseColor: Colors.red.shade300.withOpacity(0.4),
                        highlightColor: Colors.red.shade100.withOpacity(0.5),
                        enabled: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80.w,
                              height: 12.h,
                              decoration: ShapeDecoration(
                                color: Colors.red.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h,),
                            Container(
                              width: 40.w,
                              height: 10.h,
                              decoration: ShapeDecoration(
                                color: Colors.red.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    if (state is GetAssetsLoaded) {
                      final assets = BlocProvider.of<GetAssetsBloc>(context).getAssetsList.assets;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            assets[1].name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            assets[1].description,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      );
                    }
                    return SizedBox();
                  },
                ),
                Spacer(),
                BlocBuilder<GetAssetsBloc, GetAssetsState>(
                  builder: (context, state) {
                    if (state is GetAssetsLoading) {
                      return Shimmer.fromColors(
                        baseColor: Colors.brown.shade300.withOpacity(0.4),
                        highlightColor: Colors.brown.shade100.withOpacity(0.5),
                        enabled: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 89.w,
                              height: 37.h,
                              decoration: ShapeDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 89.w,
                                    height: 10.61.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                      // return BidAskCardSilver(
                      //   largText: '0000',
                      //   smallText: '',
                      // );
                    }
                    if (state is GetAssetsError) {
                      // return BidAskCardSilver(
                      //   largText: 'NO DATA',
                      //   smallText: 'error',
                      // );
                      return Shimmer.fromColors(
                        baseColor: Colors.red.shade300.withOpacity(0.4),
                        highlightColor: Colors.red.shade100.withOpacity(0.5),
                        enabled: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 89.w,
                              height: 37.h,
                              decoration: ShapeDecoration(
                                color: Colors.red.withOpacity(0.4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 89.w,
                                    height: 10.61.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.red.withOpacity(0.3),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    }

                    if (state is GetAssetsLoaded) {
                      final assets = BlocProvider.of<GetAssetsBloc>(context)
                          .getAssetsList
                          .assets;
                      return BidAskCardSilver(
                        largText: '${assets[1].sellPrice}',
                        smallText: 'LOW ${assets[1].sellPrice}',
                      );
                    }

                    return SizedBox();
                  },
                ),
                SizedBox(width: 16.w),
                BlocBuilder<GetAssetsBloc, GetAssetsState>(
                  builder: (context, state) {
                    if (state is GetAssetsLoading) {
                      // return BidAskCardSilver(
                      //   largText: '0000',
                      //   smallText: '',
                      // );
                      return Shimmer.fromColors(
                        baseColor: Colors.brown.shade300.withOpacity(0.4),
                        highlightColor: Colors.brown.shade100.withOpacity(0.5),
                        enabled: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 89.w,
                              height: 37.h,
                              decoration: ShapeDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 89.w,
                                    height: 10.61.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    }
                    if (state is GetAssetsError) {
                      // return BidAskCardSilver(
                      //   largText: 'NO DATA',
                      //   smallText: 'error',
                      // );
                      return Shimmer.fromColors(
                        baseColor: Colors.red.shade300.withOpacity(0.4),
                        highlightColor: Colors.red.shade100.withOpacity(0.5),
                        enabled: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 89.w,
                              height: 37.h,
                              decoration: ShapeDecoration(
                                color: Colors.red.withOpacity(0.4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 89.w,
                                    height: 10.61.h,
                                    decoration: ShapeDecoration(
                                      color: Colors.red.withOpacity(0.3),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    }
                    // if (state is GetAssetsLoaded) {
                    //   final assets = BlocProvider.of<GetAssetsBloc>(context)
                    //       .getAssetsList
                    //       .assets;
                    //
                    //   return Column(
                    //     children: [
                    //       ///  gold row
                    //       Padding(
                    //         padding: const EdgeInsets.only(
                    //             left: 16.0, right: 10, top: 10, bottom: 8),
                    //         child: Column(
                    //           children: assets.map((assets) {
                    //             return Row(
                    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //               children: [
                    //                 const Expanded(
                    //                   child: Column(
                    //                     crossAxisAlignment: CrossAxisAlignment.start,
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       Text(
                    //                         'GOLD',
                    //                         style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 16,
                    //                           fontFamily: 'Inter',
                    //                           fontWeight: FontWeight.w700,
                    //                         ),
                    //                       ),
                    //                       Text(
                    //                         'Oz',
                    //                         style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 16,
                    //                           fontFamily: 'Inter',
                    //                           fontWeight: FontWeight.w700,
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 BidAskCardGold(
                    //                   largText: '${assets.sellPrice}',
                    //                   smallText: 'LOW ${assets.sellPrice}',
                    //                 ),
                    //                 const SizedBox(
                    //                   width: 16,
                    //                 ),
                    //                 BidAskCardGold(
                    //                   largText: '${assets.buyPrice}',
                    //                   smallText: 'HIGH ${assets.buyPrice}',
                    //                 ),
                    //               ],
                    //             );
                    //           }).toList(),
                    //         ),
                    //       ),
                    //
                    //       ///  silver row
                    //       Padding(
                    //         padding: const EdgeInsets.only(
                    //             left: 16.0, right: 10, top: 10, bottom: 8),
                    //         child: Column(
                    //           children: assets.map((assets) {
                    //             return Row(
                    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //               children: [
                    //                 const Expanded(
                    //                   child: Column(
                    //                     crossAxisAlignment: CrossAxisAlignment.start,
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       Text(
                    //                         'Sliver',
                    //                         style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 12,
                    //                           fontFamily: 'Inter',
                    //                           fontWeight: FontWeight.w400,
                    //                         ),
                    //                       ),
                    //                       Text(
                    //                         'Oz',
                    //                         style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 12,
                    //                           fontFamily: 'Inter',
                    //                           fontWeight: FontWeight.w400,
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 BidAskCardSilver(
                    //                   largText: '${assets.sellPrice}',
                    //                   smallText: 'LOW ${assets.sellPrice}',
                    //                 ),
                    //                 const SizedBox(
                    //                   width: 16,
                    //                 ),
                    //                 BidAskCardSilver(
                    //                   largText: '${assets.buyPrice}',
                    //                   smallText: 'HIGH ${assets.buyPrice}',
                    //                 ),
                    //               ],
                    //             );
                    //           }).toList(),
                    //         ),
                    //       ),
                    //     ],
                    //   );
                    // }
                    if (state is GetAssetsLoaded) {
                      final assets = BlocProvider.of<GetAssetsBloc>(context)
                          .getAssetsList
                          .assets;
                      return BidAskCardSilver(
                        largText: '${assets[1].buyPrice}',
                        smallText: 'LOW ${assets[1].buyPrice}',
                      );
                    }

                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
          // BlocBuilder<GetAssetsBloc, GetAssetsState>(
          //   builder: (context, state) {
          //     if (state is GetAssetsLoading) {
          //       // return Center(
          //       //   child: CircularProgressIndicator(),
          //       // );
          //       return Expanded(
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             Text('loading'),
          //             Padding(
          //               padding: EdgeInsets.all(8.0.w),
          //               child: SizedBox(
          //                   width: 45.w, child: LinearProgressIndicator()),
          //             )
          //           ],
          //         ),
          //       );
          //     }
          //     if (state is GetAssetsError) {
          //       return Center(
          //         child: Icon(
          //           Icons.error,
          //           color: Colors.red,
          //         ),
          //       );
          //     }
          //     // if (state is GetAssetsLoaded) {
          //     //   final assets = BlocProvider.of<GetAssetsBloc>(context)
          //     //       .getAssetsList
          //     //       .assets;
          //     //
          //     //   return Column(
          //     //     children: [
          //     //       ///  gold row
          //     //       Padding(
          //     //         padding: const EdgeInsets.only(
          //     //             left: 16.0, right: 10, top: 10, bottom: 8),
          //     //         child: Column(
          //     //           children: assets.map((assets) {
          //     //             return Row(
          //     //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     //               children: [
          //     //                 const Expanded(
          //     //                   child: Column(
          //     //                     crossAxisAlignment: CrossAxisAlignment.start,
          //     //                     mainAxisAlignment: MainAxisAlignment.center,
          //     //                     children: [
          //     //                       Text(
          //     //                         'GOLD',
          //     //                         style: TextStyle(
          //     //                           color: Colors.white,
          //     //                           fontSize: 16,
          //     //                           fontFamily: 'Inter',
          //     //                           fontWeight: FontWeight.w700,
          //     //                         ),
          //     //                       ),
          //     //                       Text(
          //     //                         'Oz',
          //     //                         style: TextStyle(
          //     //                           color: Colors.white,
          //     //                           fontSize: 16,
          //     //                           fontFamily: 'Inter',
          //     //                           fontWeight: FontWeight.w700,
          //     //                         ),
          //     //                       ),
          //     //                     ],
          //     //                   ),
          //     //                 ),
          //     //                 BidAskCardGold(
          //     //                   largText: '${assets.sellPrice}',
          //     //                   smallText: 'LOW ${assets.sellPrice}',
          //     //                 ),
          //     //                 const SizedBox(
          //     //                   width: 16,
          //     //                 ),
          //     //                 BidAskCardGold(
          //     //                   largText: '${assets.buyPrice}',
          //     //                   smallText: 'HIGH ${assets.buyPrice}',
          //     //                 ),
          //     //               ],
          //     //             );
          //     //           }).toList(),
          //     //         ),
          //     //       ),
          //     //
          //     //       ///  silver row
          //     //       Padding(
          //     //         padding: const EdgeInsets.only(
          //     //             left: 16.0, right: 10, top: 10, bottom: 8),
          //     //         child: Column(
          //     //           children: assets.map((assets) {
          //     //             return Row(
          //     //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     //               children: [
          //     //                 const Expanded(
          //     //                   child: Column(
          //     //                     crossAxisAlignment: CrossAxisAlignment.start,
          //     //                     mainAxisAlignment: MainAxisAlignment.center,
          //     //                     children: [
          //     //                       Text(
          //     //                         'Sliver',
          //     //                         style: TextStyle(
          //     //                           color: Colors.white,
          //     //                           fontSize: 12,
          //     //                           fontFamily: 'Inter',
          //     //                           fontWeight: FontWeight.w400,
          //     //                         ),
          //     //                       ),
          //     //                       Text(
          //     //                         'Oz',
          //     //                         style: TextStyle(
          //     //                           color: Colors.white,
          //     //                           fontSize: 12,
          //     //                           fontFamily: 'Inter',
          //     //                           fontWeight: FontWeight.w400,
          //     //                         ),
          //     //                       ),
          //     //                     ],
          //     //                   ),
          //     //                 ),
          //     //                 BidAskCardSilver(
          //     //                   largText: '${assets.sellPrice}',
          //     //                   smallText: 'LOW ${assets.sellPrice}',
          //     //                 ),
          //     //                 const SizedBox(
          //     //                   width: 16,
          //     //                 ),
          //     //                 BidAskCardSilver(
          //     //                   largText: '${assets.buyPrice}',
          //     //                   smallText: 'HIGH ${assets.buyPrice}',
          //     //                 ),
          //     //               ],
          //     //             );
          //     //           }).toList(),
          //     //         ),
          //     //       ),
          //     //     ],
          //     //   );
          //     // }
          //     if (state is GetAssetsLoaded) {
          //       final assets = BlocProvider.of<GetAssetsBloc>(context)
          //           .getAssetsList
          //           .assets;
          //
          //       // Separate assets into gold and silver lists
          //       final goldAssets = assets
          //           .where((asset) => asset.name.contains('GOLD'))
          //           .toList();
          //       final silverAssets = assets
          //           .where((asset) => asset.name.contains('SILVER'))
          //           .toList();
          //
          //       return Column(
          //         children: [
          //           /// Gold Section
          //           Padding(
          //             padding: const EdgeInsets.only(
          //                 left: 16.0, right: 10, top: 10, bottom: 8),
          //             child: Column(
          //               children: goldAssets.map((goldAsset) {
          //                 // Display "24K" instead of "Oz" if it is 24K gold
          //                 final unitText =
          //                     goldAsset.description?.contains('24K') ?? false
          //                         ? '24K'
          //                         : 'Oz';
          //
          //                 return Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Expanded(
          //                       child: Column(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         children: [
          //                           Text(
          //                             'GOLD',
          //                             style: TextStyle(
          //                               color: Colors.white,
          //                               fontSize: 16.sp,
          //                               fontFamily: 'Inter',
          //                               fontWeight: FontWeight.w700,
          //                             ),
          //                           ),
          //                           Text(
          //                             unitText,
          //                             style: TextStyle(
          //                               color: Colors.white,
          //                               fontSize: 16.sp,
          //                               fontFamily: 'Inter',
          //                               fontWeight: FontWeight.w700,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                     BidAskCardGold(
          //                       largText: '${goldAsset.sellPrice}',
          //                       smallText: 'LOW ${goldAsset.sellPrice}',
          //                     ),
          //                     SizedBox(width: 16.w),
          //                     BidAskCardGold(
          //                       largText: '${goldAsset.buyPrice}',
          //                       smallText: 'HIGH ${goldAsset.buyPrice}',
          //                     ),
          //                   ],
          //                 );
          //               }).toList(),
          //             ),
          //           ),
          //
          //           /// Silver Section
          //           Padding(
          //             padding: EdgeInsets.only(
          //                 left: 16.0.w, right: 10.w, top: 10.h, bottom: 8.h),
          //             child: Column(
          //               children: silverAssets.map((silverAsset) {
          //                 return Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Expanded(
          //                       child: Column(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         children: [
          //                           Text(
          //                             'SILVER',
          //                             style: TextStyle(
          //                               color: Colors.white,
          //                               fontSize: 12.sp,
          //                               fontFamily: 'Inter',
          //                               fontWeight: FontWeight.w400,
          //                             ),
          //                           ),
          //                           Text(
          //                             'Oz',
          //                             style: TextStyle(
          //                               color: Colors.white,
          //                               fontSize: 12.sp,
          //                               fontFamily: 'Inter',
          //                               fontWeight: FontWeight.w400,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                     BidAskCardSilver(
          //                       largText: '${silverAsset.sellPrice}',
          //                       smallText: 'LOW ${silverAsset.sellPrice}',
          //                     ),
          //                     SizedBox(width: 16.w),
          //                     BidAskCardSilver(
          //                       largText: '${silverAsset.buyPrice}',
          //                       smallText: 'HIGH ${silverAsset.buyPrice}',
          //                     ),
          //                   ],
          //                 );
          //               }).toList(),
          //             ),
          //           ),
          //         ],
          //       );
          //     }
          //
          //     return SizedBox();
          //   },
          // ),
        ],
      ),
    );
  }
}
