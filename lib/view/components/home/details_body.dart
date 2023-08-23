import 'package:b_pointer/view/components/specification_card.dart';
import 'package:b_pointer/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final vModel = context.watch<HomeViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 15, 0, 10),
          child: const Text(
            "Specification",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 100,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SpecificationCard(
                  title: "Category",
                  content: vModel.productModelData[index].category.toString(),
                ),
                SpecificationCard(
                  title: "Price",
                  content: vModel.productModelData[index].price.toString(),
                ),
                SpecificationCard(
                  title: "Count",
                  content:
                      vModel.productModelData[index].rating!.count.toString(),
                ),
                const SizedBox(width: 20)
              ],
            ),
          ),
        )
      ],
    );
  }
}
