import 'package:flutter/material.dart';
import 'package:flutter_application_snakes/controller/home_controller.dart';
import 'package:flutter_application_snakes/screen/detail_pages.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = Get.height;
    final double width = Get.width;
    print('Screen height is $height an Screen width is $width');
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyanSnakes'),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => controller.snakesList.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      height: 800,
                      child: ListView.builder(
                        itemCount: controller.snakesList.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => DetailPage(
                                    data: controller.snakesList[index],
                                  ));
                            },
                            child: ListTile(
                              title: Text(controller.snakesList[index].engName),
                              subtitle: Text(
                                'Danager - ${controller.snakesList[index].isDangerString}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.red,
                                  fontFamily: 'chatu',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: Text(
                                controller.snakesList[index].mmName,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'chatu',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }
}
