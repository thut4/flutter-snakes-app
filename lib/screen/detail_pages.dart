import 'package:flutter/material.dart';
import 'package:flutter_application_snakes/data/snakes_models.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final SnakesModel data;
  const DetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios_new)),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      data.mmName,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'chatu'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '(Danger ${data.isDangerString},',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Poison ${data.isPoisonString})',
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 8, right: 8),
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  data.detail,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'chatu',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.only(left: 12.0, bottom: 10),
              //       child: Text(
              //         'Danager - ${data.isDangerString}',
              //         style: TextStyle(
              //             fontSize: 16,
              //             color: Colors.red,
              //             fontWeight: FontWeight.w500,
              //             fontFamily: 'chatu'),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(right: 12.0, bottom: 10),
              //       child: Text(
              //         'Posison - ${data.isPoisonString}',
              //         style: TextStyle(
              //             fontSize: 16,
              //             color: Colors.deepOrange,
              //             fontWeight: FontWeight.w500,
              //             fontFamily: 'chatu'),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ));
  }
}
