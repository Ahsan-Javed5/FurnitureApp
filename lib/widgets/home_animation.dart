import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:furniture_app/constants/app_images.dart';
import 'package:furniture_app/constants/colors.dart';

class HomeAnimation extends StatefulWidget {
  const HomeAnimation({Key? key}) : super(key: key);

  @override
  State<HomeAnimation> createState() => _HomeAnimationState();
}

class _HomeAnimationState extends State<HomeAnimation> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.w),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.w),
            ),
            child: Image.asset(
              AppImages.heroImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 5.h,
          left: 8.w,
          child: Container(
            width: 55.w,
            padding: EdgeInsets.all(
              4.w,
            ),
            decoration: BoxDecoration(
                color: ColorConstants.orange.withOpacity(0.2),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    2.w,
                  ),
                )),
            child: Text(
              'Best Furniture for Home & Commercial Use',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        )
      ],
    );
  }
}
