import 'package:b_pointer/view/components/home/details_body.dart';
import 'package:b_pointer/view/components/home/details_header.dart';
import 'package:b_pointer/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  final int idx;
  const DetailsScreen({super.key, required this.idx});

  @override
  Widget build(BuildContext context) {
    final vModel = context.watch<HomeViewModel>();
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.white),
          title: Text(
            vModel.productModelData[idx].title.toString(),
            style: const TextStyle(color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          backgroundColor: const Color.fromARGB(255, 0, 49, 92),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Text(
                  vModel.productModelData[idx].rating!.rate.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 15,
                )
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsHeader(idx: idx),
              DetailsBody(
                index: idx,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "About",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      vModel.productModelData[idx].description.toString(),
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
