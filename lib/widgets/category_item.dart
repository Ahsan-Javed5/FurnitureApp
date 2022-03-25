import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:sizer/sizer.dart';

class CategoryItem extends StatelessWidget {
  String title;
  String name;
  String description;
  String price;
  String imageUrl;

  CategoryItem({
    required this.title,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(
          2.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12.h,
          ),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 20.h,
                  width: 40.w,
                  //width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      2.w,
                    ),
                    color: Colors.orange.withOpacity(
                      0.05,
                    ),
                  ),
                ),
                Positioned(
                  left: 7.w,
                  bottom: 1.h,
                  child: Image.network(
                    imageUrl,
                    //width: 20.w,
                    height: 15.h,
                  ),
                ),
                Positioned(
                  top: 1.h,
                  right: 3.w,
                  child: FavoriteButton(
                    isFavorite: false,
                    iconSize: 5.h,
                    iconColor: ColorConstants.black,
                    valueChanged: () {},
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 3.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    'by $name',
                  ),
                  Container(
                    height: 12.h,
                    width: 40.w,
                    alignment: Alignment.centerLeft,
                    child: Text(description),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 22.w,
                        child: Text('Rs. $price'),
                      ),
                      Container(
                        padding: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5.w,
                          ),
                          color: Colors.black,
                        ),
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
