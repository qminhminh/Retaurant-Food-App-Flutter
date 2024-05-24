import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantfoodappflutter/common/app_style.dart';
import 'package:restaurantfoodappflutter/common/background_container.dart';
import 'package:restaurantfoodappflutter/common/reusable_text.dart';
import 'package:restaurantfoodappflutter/constants/constants.dart';
import 'package:restaurantfoodappflutter/controllers/food_controller.dart';
import 'package:restaurantfoodappflutter/controllers/restaurant_controller.dart';
import 'package:restaurantfoodappflutter/controllers/uploader_controller.dart';
import 'package:restaurantfoodappflutter/models/add_foods_models.dart';
import 'package:restaurantfoodappflutter/views/add_foods/widgets/additives_info.dart';
import 'package:restaurantfoodappflutter/views/add_foods/widgets/all_categories.dart';
import 'package:restaurantfoodappflutter/views/add_foods/widgets/food_info.dart';
import 'package:restaurantfoodappflutter/views/add_foods/widgets/image_uploads.dart';

class AddFoods extends StatefulWidget {
  const AddFoods({super.key});

  @override
  State<AddFoods> createState() => _AddFoodsState();
}

class _AddFoodsState extends State<AddFoods> {
  final PageController _pageController = PageController();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController preparation = TextEditingController();
  final TextEditingController types = TextEditingController();
  final TextEditingController additivePrice = TextEditingController();
  final TextEditingController additiveTitle = TextEditingController();
  final TextEditingController foodTags = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    price.dispose();
    preparation.dispose();
    types.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());
    final images = Get.put(UploaderController());
    final restaurant = Get.put(RestaurantController());
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        backgroundColor: kSecondary,
        centerTitle: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
                text: "Chào mừng bạn đến với bảng điều khiển nhà hàng",
                style: appStyle(14, kLightWhite, FontWeight.w600)),
            ReusableText(
                text:
                    "Điền vào tất cả các thông tin cần thiết để thêm các mặt hàng thucứ uống",
                style: appStyle(12, kLightWhite, FontWeight.normal)),
          ],
        ),
      ),
      body: BackGroundContainer(
        child: ListView(
          children: [
            SizedBox(
              width: width,
              height: hieght,
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                pageSnapping: false,
                children: [
                  ChooseCategory(
                    next: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                  ),
                  ImageUploads(
                    back: () {
                      _pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    next: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                  ),
                  FoodInfo(
                    back: () {
                      _pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    next: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    title: title,
                    description: description,
                    price: price,
                    preparation: preparation,
                    types: types,
                  ),
                  AdditivesInfo(
                    additivePrice: additivePrice,
                    additiveTitle: additiveTitle,
                    foodTags: foodTags,
                    back: () {
                      _pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    submit: () {
                      if (title.text.isEmpty ||
                          description.text.isEmpty ||
                          price.text.isEmpty ||
                          preparation.text.isEmpty ||
                          controller.types.isEmpty ||
                          controller.tags.isEmpty ||
                          controller.additivesList.isEmpty) {
                        Get.snackbar(
                            colorText: kLightWhite,
                            backgroundColor: kPrimary,
                            "Bạn nên điền vào tất cả các trường",
                            "Tất cả các lĩnh vực được yêu cầu để tải các mặt hàng thực phẩm lên ứng dụng");
                      } else {
                        AddFoodsModel foodItem = AddFoodsModel(
                            title: title.text,
                            foodTags: controller.tags,
                            foodType: controller.types,
                            code: restaurant.restaurant!.code,
                            category: controller.category,
                            time: preparation.text,
                            isAvailable: true,
                            restaurant: restaurant.restaurant!.id,
                            description: description.text,
                            price: double.parse(price.text),
                            additives: controller.additivesList,
                            imageUrl: images.images);

                        String data = addFoodsModelToJson(foodItem);
                        controller.addFoodsFunction(data);
                        images.resetList();
                        controller.additivesList.clear();
                        controller.tags.clear();
                        controller.types.clear();
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
