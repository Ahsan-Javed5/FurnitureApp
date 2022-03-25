// import 'package:flutter/material.dart';
// import 'package:furniture_app/constants/font_constants.dart';
// import 'package:furniture_app/data/dummy_data.dart';
// import 'package:furniture_app/widgets/category_item.dart';
// import 'package:sizer/sizer.dart';
//
// class FavoriteScreen extends StatelessWidget {
//   const FavoriteScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 4.w,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(
//                   top: 4.h,
//                   bottom: 3.h,
//                 ),
//                 child: Text(
//                   'Favorites',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 25.sp,
//                     fontFamily: Fonts.ProximaNovaBold,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemCount: furnitureItemData.length,
//                   itemBuilder: (ctx, index) {
//                     return CategoryItem();
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
