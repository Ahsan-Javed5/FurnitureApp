import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/constants/app_images.dart';
import 'package:sizer/sizer.dart';

import '../constants/font_constants.dart';
import '../data/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int index = 0;
  Dio dio = Dio();
  final baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  final firestoreInstance = FirebaseFirestore.instance;
  List<QueryDocumentSnapshot<Map<String, dynamic>>> dataList = [];

  @override
  void initState() {
    fetchItems();
    super.initState();
  }

  fetchItems() {
    firestoreInstance.collection("Items").get().then((querySnapshot) {
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        dataList.add(querySnapshot.docs[i]);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 8.h,
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(
              0.6,
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                6.w,
              ),
              topLeft: Radius.circular(
                6.w,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  index = 0;
                }),
                child: SvgPicture.asset(
                  AppImages.home,
                  height: 4.h,
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  index = 1;
                }),
                child: SvgPicture.asset(
                  AppImages.favorite,
                  height: 4.h,
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  index = 2;
                }),
                child: SvgPicture.asset(
                  AppImages.cart,
                  height: 4.h,
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  index = 3;
                }),
                child: SvgPicture.asset(
                  AppImages.profile,
                  height: 4.h,
                ),
              ),
            ],
          ),
        ),
        body: _stackedWidgets(),
      ),
    );
  }

  Widget _stackedWidgets() {
    return IndexedStack(
      index: index,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 4.h,
                  bottom: 1.h,
                ),
                child: Text(
                  'Best Furniture',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.sp,
                    fontFamily: Fonts.ProximaNovaBold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 2.h,
                ),
                child: Text(
                  'Perfect Choice',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 75.w,
                    height: 7.h,
                    margin: EdgeInsets.only(
                      right: 3.w,
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          hintText: 'Search'),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        3.w,
                      ),
                      color: Colors.orange.withOpacity(0.6),
                    ),
                    height: 7.h,
                    width: 7.h,
                    child: const Icon(
                      Icons.filter_alt,
                    ),
                  ),
                ],
              ),
              Container(
                height: 7.3.h,
                margin: EdgeInsets.only(
                  bottom: 2.h,
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: furnitureNames.map((e) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 3.w,
                      ),
                      margin: EdgeInsets.only(
                        right: 3.w,
                        top: 2.h,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          5.w,
                        ),
                        color: Colors.orange.withOpacity(0.6),
                      ),
                      child: Text(
                        e,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              dataList.isEmpty
                  ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              )
                  : Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: dataList.length,
                  itemBuilder: (ctx, index) {
                    return CategoryItem(
                      title: dataList[index]['title'],
                      name: dataList[index]['name'],
                      description: dataList[index]['description'],
                      price: dataList[index]['price'].toString(),
                      imageUrl: dataList[index]['imageUrl'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        //const FavoriteScreen(),
      ],
    );
  }
}
