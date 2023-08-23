import 'dart:developer';

import 'package:b_pointer/view/components/special_button.dart';
import 'package:b_pointer/view/details_screen.dart';
import 'package:b_pointer/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeVModel = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 49, 92),
        centerTitle: true,
        title: const Text(
          "B Pointer Technologies",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: homeVModel.productModelData.length,
        itemBuilder: (context, index) {
          log(homeVModel.productModelData.length.toString());
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SpecialButton(
              childIcon: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailsScreen(
                          idx: index,
                        );
                      },
                    ),
                  );
                },
                leading: Text(
                  index.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                title: Text(
                  homeVModel.productModelData[index].title.toString(),
                  maxLines: 1,
                ),
                subtitle: Text(
                  homeVModel.productModelData[index].category.toString(),
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
