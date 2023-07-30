import 'package:clothes_shopping/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../widget/button_widget.dart';
import '../widget/expandable_text.dart';
import '../widget/text_widget.dart';
import 'models/clothes_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt selectedIndex = 0.obs;
    RxInt selectedIndex1 = 0.obs;
    RxBool isFav = false.obs;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: AppButton.primaryButton(
            onButtonPressed: () {},
            title: "Buy Now",
            textClr: AppColors.blackColor),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => Container(
                  width: 1.sw,
                  height: 0.45.sh,
                  decoration: BoxDecoration(
                      color: colorList[selectedIndex1.value],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 14.0, right: 14, top: 20, bottom: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor:
                                    Colors.transparent.withOpacity(0.25),
                                child: Icon(
                                  Iconsax.arrow_left_2,
                                  size: 22,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 16,
                              backgroundColor:
                                  Colors.transparent.withOpacity(0.25),
                              child: Icon(
                                Icons.share_rounded,
                                size: 20,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 50.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.transparent.withOpacity(0.25),
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      WorkSansTextWidget(
                                        text: "1/6",
                                        fontWeight: FontWeight.w500,
                                        textSize: 12.sp,
                                        color: AppColors.whiteColor,
                                      )
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned.fill(
                          top: 50,
                          child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(clotheList[0].image!)))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 0.8.sw,
                          child: PlayfairDisplayTextWidget(
                            text: "Muberry Silk Chiffon Saree",
                            maxLine: 2,
                            fontWeight: FontWeight.bold,
                            textSize: 22.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Obx(
                          () => Container(
                            margin: const EdgeInsets.only(top: 7),
                            child: GestureDetector(
                              onTap: () {
                                isFav.value = !isFav.value;
                              },
                              child: Icon(
                                isFav.value
                                    ? Icons.favorite_outlined
                                    : Icons.favorite_border_outlined,
                                color: isFav.value
                                    ? Colors.redAccent
                                    : AppColors.bodyColor,
                                size: 26,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    // PlayfairDisplayTextWidget(
                    //   text: "Rose Polo",
                    //   maxLine: 1,
                    //   fontWeight: FontWeight.normal,
                    //   textSize: 15.sp,
                    //   color: AppColors.whiteColor,
                    // ),
                    // const SizedBox(
                    //   height: 13,
                    // ),
                    Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.goldColor)),
                          child: Center(
                            child: WorkSansTextWidget(
                              text: "₹",
                              fontWeight: FontWeight.normal,
                              textSize: 17.sp,
                              maxLine: 1,
                              color: AppColors.goldColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        WorkSansTextWidget(
                          text: clotheList[0].price!,
                          fontWeight: FontWeight.normal,
                          textSize: 17.sp,
                          maxLine: 1,
                          color: AppColors.goldColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        WorkSansTextWidget(
                          text: clotheList[0].price!,
                          fontWeight: FontWeight.normal,
                          textSize: 13.sp,
                          maxLine: 2,
                          decColor: AppColors.bodyColor,
                          textDecoration: TextDecoration.lineThrough,
                          color: AppColors.bodyColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    WorkSansTextWidget(
                      text: "Choose size",
                      fontWeight: FontWeight.normal,
                      textSize: 15.sp,
                      maxLine: 1,
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(
                      height: 50.h,
                      child: ListView.builder(
                          itemCount: sizeList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return Obx(
                              () => GestureDetector(
                                onTap: () {
                                  selectedIndex.value = index;
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  width: 30.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: selectedIndex.value == index
                                              ? Colors.transparent
                                              : AppColors.borderColor),
                                      color: selectedIndex.value == index
                                          ? AppColors.goldColor
                                          : Colors.transparent),
                                  child: Center(
                                    child: WorkSansTextWidget(
                                      text: sizeList[index],
                                      fontWeight: FontWeight.w600,
                                      textSize: 15.sp,
                                      maxLine: 1,
                                      color: selectedIndex.value == index
                                          ? AppColors.blackColor
                                          : AppColors.bodyColor,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    WorkSansTextWidget(
                      text: "Choose Color",
                      fontWeight: FontWeight.normal,
                      textSize: 15.sp,
                      maxLine: 1,
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(
                      height: 50.h,
                      child: ListView.builder(
                          itemCount: colorList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return Obx(
                              () => GestureDetector(
                                onTap: () {
                                  selectedIndex1.value = index;
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  width: 30.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: selectedIndex1.value == index
                                          ? AppColors.goldColor
                                          : Colors.transparent,
                                    ),
                                    color: colorList[index],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PlayfairDisplayTextWidget(
                      text: "Description",
                      maxLine: 1,
                      fontWeight: FontWeight.bold,
                      textSize: 15.sp,
                      color: AppColors.whiteColor,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // WorkSansTextWidget(
                    //   text:
                    //       "Silk sarees are a timeless and elegant form of traditional attire that have captivated women for centuries. Crafted from luxurious silk fabric, these sarees are renowned for their exquisite beauty, rich texture, and intricate designs",
                    //   fontWeight: FontWeight.normal,
                    //   textSize: 14.sp,
                    //   maxLine: 8,
                    //   color: AppColors.bodyColor,
                    // ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    ExpandableText(
                      text:
                          "Silk sarees are a timeless and elegant form of traditional attire that have captivated women for centuries. Crafted from luxurious silk fabric, these sarees are renowned for their exquisite beauty, rich texture, and intricate designs",
                      maxLines: 3,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
