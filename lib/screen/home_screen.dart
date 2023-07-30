import 'package:clothes_shopping/screen/details_screen.dart';
import 'package:clothes_shopping/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../widget/text_widget.dart';
import 'models/clothes_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double aspectRatio = Get.width <= 360 ? 0.74 : 0.79;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: const Icon(Icons.menu),
        centerTitle: true,
        title: PlayfairDisplayTextWidget(
          text: "Clothes Brand",
          fontWeight: FontWeight.bold,
          textSize: 17.sp,
          color: AppColors.whiteColor,
        ),
        actions: const [
          Icon(Iconsax.shopping_bag),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlayfairDisplayTextWidget(
              text: "Top Brands",
              fontWeight: FontWeight.bold,
              textSize: 22.sp,
              color: AppColors.whiteColor,
            ),
            const SizedBox(
              height: 20,
            ),
            WorkSansTextWidget(
              text: "Total 4280 product",
              fontWeight: FontWeight.normal,
              textSize: 14.sp,
              color: AppColors.bodyColor,
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: clotheList.length,
                itemBuilder: (context, index) => ItemTile(index),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: aspectRatio,
                  mainAxisSpacing: 17.0,
                  crossAxisSpacing: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(
    this.itemNo,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailsScreen()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.borderColor,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 1.sw,
              height: 0.17.sh,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  color: clotheList[itemNo].bgColor,
                  image: DecorationImage(
                      image: AssetImage(
                        clotheList[itemNo].image!,
                      ),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WorkSansTextWidget(
                    text: clotheList[itemNo].name!,
                    fontWeight: FontWeight.normal,
                    textSize: 14.sp,
                    maxLine: 2,
                    color: AppColors.whiteColor,
                    height: 1.3,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.goldColor)),
                        child: Center(
                          child: WorkSansTextWidget(
                            text: "₹",
                            fontWeight: FontWeight.w600,
                            textSize: 10.sp,
                            maxLine: 1,
                            color: AppColors.goldColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      WorkSansTextWidget(
                        text: clotheList[itemNo].price!,
                        fontWeight: FontWeight.w600,
                        textSize: 14.sp,
                        maxLine: 1,
                        overFlowV: TextOverflow.ellipsis,
                        color: AppColors.goldColor,
                        height: 1.3,
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
